import 'package:dartz/dartz.dart';
import 'package:ringo_media_management/domain/auth_flow/auth_failure/auth_failure.dart';
import 'package:ringo_media_management/domain/auth_flow/user_model/user_model.dart';
import 'package:ringo_media_management/domain/auth_flow/value_objects.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';

abstract class IAuthFacade {
  Option<UniqueId> getSignedInUserId();

  Future<Option<UserModel>> getSignedInUserData();

  Stream<Either<AuthFailure, UserModel>> watchUserDate();

  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required Name name,
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  Future<Either<AuthFailure, Unit>> signInWithFacebook();

  Future<Either<AuthFailure, Unit>> signInWithTwitter();

  Future<Either<AuthFailure, Unit>> signInWithApple();

  Future<Either<AuthFailure, Unit>> resetPasswordUsingEmail({
    required EmailAddress emailAddress,
  });

  Future<Either<AuthFailure, Unit>> updateUserNotificationToken();

  Future<void> signOut();

  Future<void> signOutFromFirebaseOnly();

  Future<void> signOutFromAllExceptFirestore();

  Future<void> deleteAccountPermanently();

  Future<void> sendEmailForSupport({required String message});
}
