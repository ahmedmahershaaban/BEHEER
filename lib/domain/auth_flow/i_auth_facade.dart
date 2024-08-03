import 'package:dartz/dartz.dart';
import 'package:ringo_media_management/domain/auth_flow/auth_failure/auth_failure.dart';
import 'package:ringo_media_management/domain/auth_flow/user_model/user_model.dart';
import 'package:ringo_media_management/domain/auth_flow/value_objects.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';

abstract class IAuthFacade {
  /// Return [UniqueId] if found cached in the local memory else return `none()`.
  Option<UniqueId> getSignedInUserId();

  /// Return [CalenderDayModel] if found in the db else return `none()`.
  Future<Option<UserModel>> getSignedInUserData();

  /// Return `Stream` for only one [UserModel] which is the signed in user from db for real time updates.
  ///
  ///
  /// A [AuthFailure] maybe returned with the following failures:
  /// [AuthFailure.userNotFound].
  /// [AuthFailure.insufficientPermission].
  /// [AuthFailure.serverError].
  Stream<Either<AuthFailure, UserModel>> watchUserDate();

  /// Register new user by email and password.
  ///
  ///
  /// A [AuthFailure] maybe returned with the following failures:
  /// [AuthFailure.noInternetConnection].
  /// [AuthFailure.emailAlreadyInUse].
  /// [AuthFailure.invalidEmail].
  /// [AuthFailure.serverError].
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required Name name,
    required EmailAddress emailAddress,
    required Password password,
  });

  /// Login user by entering email and password.
  ///
  ///
  /// A [AuthFailure] maybe returned with the following failures:
  /// [AuthFailure.noInternetConnection].
  /// [AuthFailure.invalidEmailAndPasswordCombination].
  /// [AuthFailure.serverError].
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  /// Sign in existing user Or Create a new user if there is no user registered by `Google SignIn`.
  ///
  ///
  /// A [AuthFailure] maybe returned with the following failures:
  /// [AuthFailure.noInternetConnection].
  /// [AuthFailure.cancelledByUser].
  /// [AuthFailure.serverError].
  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  /// This feature will be implemented later.
  Future<Either<AuthFailure, Unit>> signInWithFacebook();

  /// This feature will be implemented later.
  Future<Either<AuthFailure, Unit>> signInWithTwitter();

  /// This feature will be implemented later.
  Future<Either<AuthFailure, Unit>> signInWithApple();

  /// Reset password by sending link to the email.
  ///
  ///
  /// A [AuthFailure] maybe returned with the following failures:
  /// [AuthFailure.noInternetConnection].
  /// [AuthFailure.invalidEmail].
  /// [AuthFailure.userNotFound].
  /// [AuthFailure.serverError].
  Future<Either<AuthFailure, Unit>> resetPasswordUsingEmail({
    required EmailAddress emailAddress,
  });

  /// Update user notification token in the db.
  ///
  ///
  /// A [AuthFailure] maybe returned with the following failures:
  /// [AuthFailure.noInternetConnection].
  /// [AuthFailure.insufficientPermission].
  /// [AuthFailure.serverError].
  Future<Either<AuthFailure, Unit>> updateUserNotificationToken();

  /// Sign Out the user from all registered authentication platform along with resetting the default `Bloc`s
  /// and dependency injection third pastries that needs to be reset to remove old signed in user data.
  Future<void> signOut();

  /// Sign Out user from [_firebaseAuth]
  Future<void> signOutFromFirebaseOnly();

  /// The main sign our functionality which will be responsible to call and handle every thing.
  Future<void> signOutFromAllExceptFirestore();

  /// Delete user account permanently and can not store the user data again.
  Future<void> deleteAccountPermanently();

  /// This feature enables users to send message to support when they face `ErrorCard` in the `Presentation Layer`
  /// as `UI Components`.
  Future<void> sendEmailForSupport({required String message});
}
