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

  @override
  Option<UniqueId> getSignedInUserId() => optionOf(
        _firebaseAuth.currentUser?.uid == null ? null : UniqueId.fromUniqueString(_firebaseAuth.currentUser!.uid),
      );

  @override
  Stream<Either<AuthFailure, UserModel>> watchUserDate() async* {
    final userDocument = _firebaseFirestore.userModelDocument();
    yield* userDocument.snapshots().map(
      (doc) {
        return right<AuthFailure, UserModel>(UserModelDto.fromFireStore(doc).toDomain());
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

  @override
  Future<Either<AuthFailure, Unit>> resetPasswordUsingEmail({required EmailAddress emailAddress}) async {
    try {
      bool result = await _internetConnection.hasInternetAccess;
      if (!result) {
        return left(const AuthFailure.noInternetConnection());
      }

      final emailAddressStr = emailAddress.getOrCrash();
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
        await createProjectsStatisticsModelForNewUsers();
      } else {
        userDto = userDto.copyWith(
          notificationToken: notificationToken,
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

  /// These feature could be implemented later
  @override
  Future<Either<AuthFailure, Unit>> signInWithFacebook() async {
    bool result = await _internetConnection.hasInternetAccess;
    if (!result) {
      return left(const AuthFailure.noInternetConnection());
    }

    return left(const AuthFailure.notImplementedFeature());
  }

  /// These feature could be implemented later
  @override
  Future<Either<AuthFailure, Unit>> signInWithApple() async {
    bool result = await _internetConnection.hasInternetAccess;
    if (!result) {
      return left(const AuthFailure.noInternetConnection());
    }

    return left(const AuthFailure.notImplementedFeature());
  }

  /// These feature could be implemented later
  @override
  Future<Either<AuthFailure, Unit>> signInWithTwitter() async {
    bool result = await _internetConnection.hasInternetAccess;
    if (!result) {
      return left(const AuthFailure.noInternetConnection());
    }

    return left(const AuthFailure.notImplementedFeature());
  }

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

  @override
  Future<void> signOutFromAllExceptFirestore() async {
    try {
      /// Could use Firebase Functions if needed for example like this
      /// depending on the logic of the app
      // final userModelIdOption =   getSignedInUserId();
      // final userModelId = userModelIdOption.getOrElse(() => throw const Unauthenticated());
      //   final HttpsCallable callable = _firebaseFunctions.httpsCallable('removeNotification');
      //   await callable.call(
      //     <String, dynamic>{
      //       'userId':userModelId,
      //     },
      //   );

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

  /// This is must for Apple Store deploy
  /// will not use it now, but for production code this is must !
  /// Will use Firebase Functions as there should be a lot to handle
  /// and we want to sign out the user from the app
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

  @override
  Future<void> signOut() async {
    await signOutFromAllExceptFirestore();
    await signOutFromFirebaseOnly();
  }

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

  /// User must be registered and signed in firebase to perform this function
  Future<void> createProjectsStatisticsModelForNewUsers() async {
    // Create ProjectsStatisticsModel document
    await _firebaseFirestore.userProjectsStatisticsDocument.set(
      ProjectsStatisticsModelDto.fromDomain(ProjectsStatisticsModel.createEmpty()).toJson(),
      SetOptions(merge: true),
    );
  }
}
