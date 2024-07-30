import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.cancelledByUser() = CancelledByUser;
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AuthFailure.invalidEmail() = InvalidEmail;
  const factory AuthFailure.userNotFound() = UserNotFound;
  const factory AuthFailure.invalidEmailAndPasswordCombination() = InvalidEmailAndPasswordCombination;
  const factory AuthFailure.invalidPhoneNumber() = InvalidPhoneNumber;
  const factory AuthFailure.phoneNumberIsAlreadyInUse() = PhoneNumberIsAlreadyInUse;
  const factory AuthFailure.accountExistsWithDifferentCredential() = AccountExistsWithDifferentCredential;
  const factory AuthFailure.usedSocialMediaIsNotAssignedWithEmailAddress() = UsedSocialMediaIsNotAssignedWithEmailAddress;
  const factory AuthFailure.noInternetConnection() = NoInternetConnection;
  const factory AuthFailure.invalidDetails() = InvalidDetails;
  const factory AuthFailure.userHasBeenBlocked() = UserHasBeenBlocked;
  const factory AuthFailure.insufficientPermission() = InsufficientPermission;
  const factory AuthFailure.notImplementedFeature() = NotImplementedFeature;
  const factory AuthFailure.notSupportingAppleLogin() = NotSupportingAppleLogin;
}

String getAuthFailureString(AuthFailure value) {
  return value.map(
    cancelledByUser: (_) => 'Cancelled by user',
    serverError: (_) => 'Server Error !',
    emailAlreadyInUse: (_) => 'Email is already in use',
    insufficientPermission: (_) => "You don't have enough permission!",
    userNotFound: (_) => 'Can not find user with this email',
    userHasBeenBlocked: (_) => 'User had been blocked by admin, please contact support!',
    invalidEmail: (_) => 'Email is not valid',
    invalidEmailAndPasswordCombination: (_) => 'Invalid accreditations, make sure you entered email and password correct',
    accountExistsWithDifferentCredential: (_) => 'Account has been already used with another account',
    usedSocialMediaIsNotAssignedWithEmailAddress: (_) => 'Used social media is not having email address assigned with it',
    notSupportingAppleLogin: (_) => 'The device that you used is not supporting Apple Login, please try another method or update your phone IOS',
    invalidPhoneNumber: (_) => 'Phone Number is not valid',
    phoneNumberIsAlreadyInUse: (_) => 'Phone Number is already in use',
    invalidDetails: (_) => 'Make sure all details are valid',
    noInternetConnection: (_) => 'No Internet Connection',
    notImplementedFeature: (_) => 'We are developing this feature, wait for the next update!',
  );
}
