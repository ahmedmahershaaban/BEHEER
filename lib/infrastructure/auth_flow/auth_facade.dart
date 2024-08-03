import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:ringo_media_management/application/user_flow/user_flow/user_flow_bloc.dart';
import 'package:ringo_media_management/domain/auth_flow/auth_failure/auth_failure.dart';
import 'package:ringo_media_management/domain/auth_flow/i_auth_facade.dart';
import 'package:ringo_media_management/domain/auth_flow/user_model/user_model.dart';
import 'package:ringo_media_management/domain/auth_flow/value_objects.dart';
import 'package:ringo_media_management/domain/core/errors.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';
import 'package:ringo_media_management/domain/user_flow/projects_statistics_model/projects_statistics_model.dart';
import 'package:ringo_media_management/infrastructure/auth_flow/user_model_dtos/user_model_dtos.dart';
import 'package:ringo_media_management/infrastructure/core/firebase_helper.dart';
import 'package:ringo_media_management/infrastructure/core/injection/injection.dart';
import 'package:ringo_media_management/infrastructure/user_flow/projects_statistics_model_dtos/projects_statistics_model_dtos.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher.dart';

/// The implementations of the interface [IAuthFacade].
///
/// This implementation will have all the needed logic for auth flow to deal
/// with APIs and third party libraries.
@LazySingleton(as: IAuthFacade)
class AuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseMessaging _firebaseMessaging;
  final FirebaseFunctions _firebaseFunctions;
  final InternetConnection _internetConnection;
  final GoogleSignIn _googleSignIn;

  AuthFacade(
    this._firebaseAuth,
    this._firebaseFirestore,
    this._firebaseMessaging,
    this._firebaseFunctions,
    this._internetConnection,
    this._googleSignIn,
  );

  /// Return [CalenderDayModel] if found in the db else return `none()`.
  ///
  /// Steps:
  /// 1- check internet connections.
  /// 2- search for the [UserModel] record.
  /// 4- if record exists return `right(UserModel())`.
  /// 5- if record is not exists or any [Error] happened return `none()`.
  @override
  Future<Option<UserModel>> getSignedInUserData() async {
    try {
      bool result = await _internetConnection.hasInternetAccess;
      if (!result) {
        return none();
      }

      final userDocument = _firebaseFirestore.userModelDocument();
      return userDocument.get().then((doc) {
        if (!doc.exists) {
          return none();
        }
        return optionOf(UserModelDto.fromFireStore(doc).toDomain());
      });
    } on FirebaseAuthException catch (e) {
      debugPrint("Error In [getSignedInUserData] By [FirebaseAuthException]: $e");
      return none();
    } catch (e) {
      debugPrint("Error In [getSignedInUserData] By [GeneralCatch]: $e");
      return none();
    }
  }

  /// Return [UniqueId] if found cached in the local memory else return `none()`.
  @override
  Option<UniqueId> getSignedInUserId() => optionOf(
        _firebaseAuth.currentUser?.uid == null ? null : UniqueId.fromUniqueString(_firebaseAuth.currentUser!.uid),
      );

  /// Return `Stream` for only one [UserModel] which is the signed in user from db for real time updates.
  ///
  /// Note:
  /// 1- If there is no internet connection `onErrorReturnWith` will return `serverError`!
  ///
  /// Steps:
  /// 1- get the user [UniqueId] from the cached memory.
  /// 4- search for the [UserModel] by the [UniqueId] using `Stream`.
  /// 5- if the [UserModel] is not exists return `left( AuthFailure.userNotFound())` in `Stream` format.
  /// 6- if [UserModel] is found, then use [UserModelDto.fromFireStore] to convert the firebase json data to dto.
  /// 7- convert [UserModelDto] to [UserModel] by [UserModelDto.toDomain].
  /// 8- return `right(UserModel())` in `Stream` format.
  ///
  ///
  ///
  /// A [AuthFailure] maybe returned with the following failures:
  /// [AuthFailure.userNotFound].
  /// [AuthFailure.insufficientPermission].
  /// [AuthFailure.serverError].
  @override
  Stream<Either<AuthFailure, UserModel>> watchUserDate() async* {
    final userDocument = _firebaseFirestore.userModelDocument();
    yield* userDocument.snapshots().map(
      (docSnap) {
        if (!docSnap.exists) {
          return left<AuthFailure, UserModel>(const AuthFailure.userNotFound());
        }
        return right<AuthFailure, UserModel>(UserModelDto.fromFireStore(docSnap).toDomain());
      },
    ).onErrorReturnWith((e, _) {
      if (e is FirebaseException && e.message!.contains('PERMISSION_DENIED')) {
        debugPrint("Error In [watchUserDate] By [FirebaseException]: $e");
        return left(const AuthFailure.insufficientPermission());
      } else {
        debugPrint("Error In [watchUserDate] By [GeneralCatch]: $e");
        return left(const AuthFailure.serverError());
      }
    });
  }

  /// Register new user by email and password.
  ///
  /// Steps:
  /// 1- validate the form data first.
  /// 2- check internet connections.
  /// 3- call [_firebaseAuth.createUserWithEmailAndPassword] to create a new user in the auth db.
  /// 4- create a [UserModel] from the form data and returned data from the auth module.
  /// 5- add the [UserModel] record to the db under `userCollection`.
  /// 6- create and add to db empty [ProjectsStatisticsModel] by calling [createProjectsStatisticsModelForNewUsers].
  /// 7- return `right(Unit())`.
  ///
  ///
  /// A [AuthFailure] maybe returned with the following failures:
  /// [AuthFailure.noInternetConnection].
  /// [AuthFailure.emailAlreadyInUse].
  /// [AuthFailure.invalidEmail].
  /// [AuthFailure.serverError].
  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required Name name,
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();
    final nameStr = name.getOrCrash();
    try {
      bool result = await _internetConnection.hasInternetAccess;
      if (!result) {
        return left(const AuthFailure.noInternetConnection());
      }

      final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddressStr,
        password: passwordStr,
      );
      await userCredential.user!.updateDisplayName(nameStr);
      final UserModelDto userDto = UserModelDto(
        id: userCredential.user!.uid,
        name: nameStr,
        emailAddress: emailAddressStr,
        phoneNumber: userCredential.user!.phoneNumber,
        notificationToken: kIsWeb ? null : await _firebaseMessaging.getToken(),
        photo: null,
        address: null,
        website: null,
        admin: false,
        isBlocked: false,
        lastUpdate: DuoDate.now().getOrCrash(),
        creationDate: DuoDate.now().getOrCrash(),
      );
      final userDocument = _firebaseFirestore.userModelDocument();
      await userDocument.set(
        userDto.toJson(),
        SetOptions(merge: true),
      );
      await createProjectsStatisticsModelForNewUsers();

      return right(unit);
    } on FirebaseAuthException catch (e) {
      debugPrint("Error In [registerWithEmailAndPassword] By [FirebaseAuthException]: $e");
      if (e.code == 'email-already-in-use') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else if (e.code == 'invalid-email') {
        return left(const AuthFailure.invalidEmail());
      } else {
        return left(const AuthFailure.serverError());
      }
    } catch (e) {
      debugPrint("Error In [registerWithEmailAndPassword] By [GeneralCatch]: $e");
      return left(const AuthFailure.serverError());
    }
  }

  /// Reset password by sending link to the email.
  ///
  /// Steps:
  /// 1- validate the form data first.
  /// 2- check internet connections.
  /// 3- call [_firebaseAuth.sendPasswordResetEmail] to send email with reset link.
  /// 4- return `right(Unit())`.
  ///
  ///
  /// A [AuthFailure] maybe returned with the following failures:
  /// [AuthFailure.noInternetConnection].
  /// [AuthFailure.invalidEmail].
  /// [AuthFailure.userNotFound].
  /// [AuthFailure.serverError].
  @override
  Future<Either<AuthFailure, Unit>> resetPasswordUsingEmail({required EmailAddress emailAddress}) async {
    final emailAddressStr = emailAddress.getOrCrash();

    try {
      bool result = await _internetConnection.hasInternetAccess;
      if (!result) {
        return left(const AuthFailure.noInternetConnection());
      }

      await _firebaseAuth.sendPasswordResetEmail(email: emailAddressStr);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      debugPrint("Error In [resetPasswordUsingEmail] By [FirebaseAuthException]: $e");
      if (e.code == 'invalid-email') {
        return left(const AuthFailure.invalidEmail());
      } else if (e.code == 'user-not-found') {
        return left(const AuthFailure.userNotFound());
      } else {
        return left(const AuthFailure.serverError());
      }
    } catch (e) {
      debugPrint("Error In [resetPasswordUsingEmail] By [GeneralCatch]: $e");
      return left(const AuthFailure.serverError());
    }
  }

  /// Login user by entering email and password.
  ///
  /// Steps:
  /// 1- validate the form data first.
  /// 2- check internet connections.
  /// 3- call [_firebaseAuth.signInWithEmailAndPassword] to login into firebase.
  /// 4- update [UserModel.notification] by calling [updateUserNotificationToken].
  /// 5- return `right(Unit())`.
  ///
  ///
  /// A [AuthFailure] maybe returned with the following failures:
  /// [AuthFailure.noInternetConnection].
  /// [AuthFailure.invalidEmailAndPasswordCombination].
  /// [AuthFailure.serverError].
  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();
    try {
      bool result = await _internetConnection.hasInternetAccess;
      if (!result) {
        return left(const AuthFailure.noInternetConnection());
      }
      await _firebaseAuth.signInWithEmailAndPassword(email: emailAddressStr, password: passwordStr);
      await updateUserNotificationToken();
      return right(unit);
    } on FirebaseAuthException catch (e) {
      debugPrint("Error In [signInWithEmailAndPassword] By [FirebaseAuthException]: $e");
      if (e.code == "user-not-found" || e.code == "wrong-password") {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        return left(const AuthFailure.serverError());
      }
    } catch (e) {
      debugPrint("Error In [signInWithEmailAndPassword] By [GeneralCatch]: $e");
      return left(const AuthFailure.serverError());
    }
  }

  /// Sign in existing user Or Create a new user if there is no user registered by `Google SignIn`.
  ///
  /// Steps:
  /// 1- check internet connections.
  /// 2- call [_googleSignIn.signIn] to get the user credentials from google.
  /// 3- register the credentials from google and register it with [FirebaseAuth].
  /// 4- get the [UserModel] from db.
  /// 5- if [UserModel] exists, update [UserModel.NotificationToken].
  /// 6- if [UserModel] not exists, create a [UserModel] then add it to the db,
  /// also create empty [ProjectsStatisticsModel] and add it to db.
  /// 7- return `right(Unit())`.
  ///
  ///
  /// A [AuthFailure] maybe returned with the following failures:
  /// [AuthFailure.noInternetConnection].
  /// [AuthFailure.cancelledByUser].
  /// [AuthFailure.serverError].
  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      bool result = await _internetConnection.hasInternetAccess;
      if (!result) {
        return left(const AuthFailure.noInternetConnection());
      }

      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(const AuthFailure.cancelledByUser());
      }

      final googleUserCredential = await googleUser.authentication;

      final googleAuthCredential = GoogleAuthProvider.credential(
        idToken: googleUserCredential.idToken,
        accessToken: googleUserCredential.accessToken,
      );
      final signedInUser = await _firebaseAuth.signInWithCredential(googleAuthCredential);

      final userDocument = _firebaseFirestore.userModelDocument();
      UserModelDto? userDto = await userDocument.get().then(
            (doc) => doc.data() == null ? null : UserModelDto.fromJson(doc.data()! as Map<String, dynamic>),
          );

      final String? notificationToken = kIsWeb ? null : await FirebaseMessaging.instance.getToken();
      if (userDto == null) {
        userDto = UserModelDto(
          id: signedInUser.user!.uid,
          name: googleUser.displayName!,
          emailAddress: googleUser.email,
          phoneNumber: signedInUser.user!.phoneNumber,
          notificationToken: notificationToken,
          photo: googleUser.photoUrl,
          address: null,
          website: null,
          admin: false,
          isBlocked: false,
          lastUpdate: DuoDate.now().getOrCrash(),
          creationDate: DuoDate.now().getOrCrash(),
        );

        await userDocument.set(
          userDto.toJson(),
          SetOptions(merge: true),
        );
        await createProjectsStatisticsModelForNewUsers();
      } else {
        userDto = userDto.copyWith(
          notificationToken: notificationToken,
        );

        await userDocument.set(
          userDto.toJson(),
          SetOptions(merge: true),
        );
      }

      return right(unit);
    } on FirebaseAuthException catch (e) {
      debugPrint("Error In [signInWithGoogle] By [FirebaseAuthException]: $e");
      return left(const AuthFailure.cancelledByUser());
    } catch (e) {
      debugPrint("Error In [signInWithGoogle] By [GeneralCatch]: $e");
      return left(const AuthFailure.serverError());
    }
  }

  /// This feature will be implemented later.
  @override
  Future<Either<AuthFailure, Unit>> signInWithFacebook() async {
    bool result = await _internetConnection.hasInternetAccess;
    if (!result) {
      return left(const AuthFailure.noInternetConnection());
    }

    return left(const AuthFailure.notImplementedFeature());
  }

  /// This feature will be implemented later.
  @override
  Future<Either<AuthFailure, Unit>> signInWithApple() async {
    bool result = await _internetConnection.hasInternetAccess;
    if (!result) {
      return left(const AuthFailure.noInternetConnection());
    }

    return left(const AuthFailure.notImplementedFeature());
  }

  /// This feature will be implemented later.
  @override
  Future<Either<AuthFailure, Unit>> signInWithTwitter() async {
    bool result = await _internetConnection.hasInternetAccess;
    if (!result) {
      return left(const AuthFailure.noInternetConnection());
    }

    return left(const AuthFailure.notImplementedFeature());
  }

  /// Update user notification token in the db.
  ///
  /// Steps:
  /// 1- check internet connections.
  /// 2- get [UserModel.notificationToken] by calling [_firebaseMessaging.getToken].
  /// 3- register the credentials from google and register it with [FirebaseAuth].
  /// 4- update [UserModel] in db.
  /// 7- return `right(Unit())`.
  ///
  ///
  /// A [AuthFailure] maybe returned with the following failures:
  /// [AuthFailure.noInternetConnection].
  /// [AuthFailure.insufficientPermission].
  /// [AuthFailure.serverError].
  @override
  Future<Either<AuthFailure, Unit>> updateUserNotificationToken() async {
    try {
      bool result = await _internetConnection.hasInternetAccess;
      if (!result) {
        return left(const AuthFailure.noInternetConnection());
      }
      final String? notificationToken = kIsWeb ? null : await _firebaseMessaging.getToken();
      final userDocument = _firebaseFirestore.userModelDocument();
      await userDocument.update(
        {
          'notificationToken': notificationToken,
        },
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      debugPrint("Error In [updateUserNotificationToken] By [FirebaseAuthException]: $e");
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const AuthFailure.insufficientPermission());
      } else {
        return left(const AuthFailure.serverError());
      }
    } catch (e) {
      debugPrint("Error In [updateUserNotificationToken] By [GeneralCatch]: $e");
      return left(const AuthFailure.serverError());
    }
  }

  /// Sign Out the user from all registered authentication platform along with resetting the default `Bloc`s
  /// and dependency injection third pastries that needs to be reset to remove old signed in user data.
  ///
  /// Steps:
  /// 1- check internet connections.
  /// 2- get [UserModel.notificationToken] by calling [_firebaseMessaging.getToken].
  /// 3- register the credentials from google and register it with [FirebaseAuth].
  /// 4- update [UserModel] in db.
  /// 7- return `right(Unit())`.
  @override
  Future<void> signOutFromAllExceptFirestore() async {
    try {
      if (!kIsWeb) {
        try {
          await _googleSignIn.signOut();
        } catch (e) {
          debugPrint("Error In [signOutFromAllExceptFirestore] By [SignOutFromGoogle]: $e");
        }
      }
      // resetting the bloc registered and any data
      getIt.resetLazySingleton<UserFlowBloc>();
    } on FirebaseAuthException catch (e) {
      debugPrint("Error In [updateUserNotificationToken] By [FirebaseAuthException]: $e");
    } catch (e) {
      debugPrint("Error In [updateUserNotificationToken] By [GeneralCatch]: $e");
    }
  }

  /// Delete user account permanently and can not store the user data again.
  ///
  /// Note: This is must for Apple Store deploy.
  ///
  /// will not use it now, but for production code this is must !
  /// Will use Firebase Functions as there should be a lot to handle.
  /// and we want to sign out the user from the app.
  @override
  Future<void> deleteAccountPermanently() async {
    final userDataOption = await getSignedInUserData();
    final userData = userDataOption.getOrElse(() => throw UnexpectedNullValueError());
    try {
      /// remove user document and remove all other document or how we will handle the data
      final HttpsCallable callable = _firebaseFunctions.httpsCallable('deleteUserAccount');
      await callable.call(
        <String, dynamic>{
          'userId': userData.id.getOrCrash(),
        },
      );
      await Future.wait([
        _googleSignIn.signOut(),
        signOutFromFirebaseOnly(),
      ]);
    } on FirebaseFunctionsException catch (e) {
      debugPrint("Error In [deleteAccountPermanently] By [FirebaseFunctionsException]: $e");
    } catch (e) {
      debugPrint("Error In [deleteAccountPermanently] By [GeneralCatch]: $e");
    }
  }

  /// Sign Out user from [_firebaseAuth]
  @override
  Future<void> signOutFromFirebaseOnly() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      debugPrint("Error In [signOutFromFirebaseOnly] By [FirebaseAuthException]: $e");
    } catch (e) {
      debugPrint("Error In [signOutFromFirebaseOnly] By [GeneralCatch]: $e");
    }
  }

  /// The main sign our functionality which will be responsible to call and handle every thing.
  ///
  /// steps:
  /// 1- calls and await [signOutFromAllExceptFirestore].
  /// 2- calls and await [signOutFromFirebaseOnly].
  @override
  Future<void> signOut() async {
    await signOutFromAllExceptFirestore();
    await signOutFromFirebaseOnly();
  }

  /// This feature enables users to send message to support when they face `ErrorCard` in the `Presentation Layer`
  /// as `UI Components`.
  ///
  /// steps:
  /// 1- prepare the `encodeQueryParameters`.
  /// 2- prepare the [Uri].
  /// 3- call [launchUrl].
  @override
  Future<void> sendEmailForSupport({required String message}) async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries.map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'ahmedmaher13579@outlook.com', // should add the email of the company email will use mine for now
      query: encodeQueryParameters(<String, String>{
        'subject': 'Something went wrong!, please provide us with details so we could help you.',
      }),
    );

    try {
      await launchUrl(emailLaunchUri);
    } catch (e) {
      debugPrint("Error In [sendEmailForSupport] By [GeneralCatch]: $e");
    }
  }

  /// creates empty [ProjectsStatisticsModel] and add it to the database
  ///
  /// Note 1: there is only 1 record of [ProjectsStatisticsModel] for each user in the db.
  /// Note 2: User must be registered and signed in firebase to perform this function.
  ///
  /// steps:
  /// 1- create empty [ProjectsStatisticsModel] by calling [ProjectsStatisticsModel.createEmpty].
  /// 2- converting it to DTO then to json by calling [ProjectsStatisticsModelDto.fromDomain().toJson()].
  /// 3- add the [ProjectsStatisticsModel] record to db.
  Future<void> createProjectsStatisticsModelForNewUsers() async {
    // Create ProjectsStatisticsModel document
    await _firebaseFirestore.userProjectsStatisticsDocument.set(
      ProjectsStatisticsModelDto.fromDomain(ProjectsStatisticsModel.createEmpty()).toJson(),
      SetOptions(merge: true),
    );
  }
}
