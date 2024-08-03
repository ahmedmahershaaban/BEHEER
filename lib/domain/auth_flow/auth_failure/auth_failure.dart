import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

/// These are the [AuthFailure] which will be returned from [IAuthFacade] instead of [Error].
///
/// This will ensure the safety of the application with out getting any un needed [Error]s
/// instead we have it now in a format that could be handled and passed with in the app safely.
@freezed
abstract class AuthFailure with _$AuthFailure {
  /// This [AuthFailure] will occur when the user exit social media login in the middle of the process.
  const factory AuthFailure.cancelledByUser() = CancelledByUser;

  /// This [AuthFailure] will occur when there is unexpected error happened and not handled in the
  /// logic of the implementation to be returned as [AuthFailure] this it will be [AuthFailure.serverError].
  const factory AuthFailure.serverError() = ServerError;

  /// This [AuthFailure] will occur when the email address is already in use while login or signup.
  const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUse;

  /// This [AuthFailure] will occur when the format of email address is invalid.
  const factory AuthFailure.invalidEmail() = InvalidEmail;

  /// This [AuthFailure] will occur when the user is not found in the database.
  const factory AuthFailure.userNotFound() = UserNotFound;

  /// This [AuthFailure] will occur when the email address or password is incorrect while login to the app.
  const factory AuthFailure.invalidEmailAndPasswordCombination() = InvalidEmailAndPasswordCombination;

  /// This [AuthFailure] will occur when the format of the phone number is invalid.
  const factory AuthFailure.invalidPhoneNumber() = InvalidPhoneNumber;

  /// This [AuthFailure] will occur when the phone number is already registered with in the database.
  const factory AuthFailure.phoneNumberIsAlreadyInUse() = PhoneNumberIsAlreadyInUse;

  /// This [AuthFailure] will occur when trying to signup with social media that it's email is already registered in the backend.
  ///
  /// To solve this problem you will need to login with the registered email to the app then connect the social media
  /// from the setting page.
  const factory AuthFailure.accountExistsWithDifferentCredential() = AccountExistsWithDifferentCredential;

  /// This [AuthFailure] will occur when using a social media that does not have assigned email to it.
  ///
  /// For some applications email might be must to continue using the app, so this [AuthFailure] will be helpful.
  const factory AuthFailure.usedSocialMediaIsNotAssignedWithEmailAddress() = UsedSocialMediaIsNotAssignedWithEmailAddress;

  /// This [AuthFailure] will occur when there is no internet connection while doing a request to the API.
  const factory AuthFailure.noInternetConnection() = NoInternetConnection;

  /// This [AuthFailure] will occur when the return data is invalid.
  const factory AuthFailure.invalidDetails() = InvalidDetails;

  /// This [AuthFailure] will occur when the user is blocked form the admin side.
  const factory AuthFailure.userHasBeenBlocked() = UserHasBeenBlocked;

  /// This [AuthFailure] will occur when the user is trying to make a request that over his permissions.
  const factory AuthFailure.insufficientPermission() = InsufficientPermission;

  /// This [AuthFailure] will occur when the user try to access a feature that is not implemented yet.
  const factory AuthFailure.notImplementedFeature() = NotImplementedFeature;

  /// This [AuthFailure] will occur when IOS device is not supporting apple login.
  const factory AuthFailure.notSupportingAppleLogin() = NotSupportingAppleLogin;
}

/// Mapping each [AuthFailure] to a `String`.
///
/// This helps when you are getting [AuthFailure] and want to display an error message on
/// the screen for the user, you only call [getAuthFailureString] instead of manually mapping
/// all [AuthFailure] to a string, also this makes the error handling maintainable and any change
/// in this function will effect all the [AuthFailure] error messaging.
///
/// ```dart
/// // will assign any AuthFailure like if we get it from API call from the infrastructure layer.
/// final authFailure = AuthFailure.userHasBeenBlocked();
/// IconSnackBar.show(
/// context: context,
/// snackBarType: SnackBarType.fail,
/// label: getAuthFailureString(authFailure),
/// ); // will show pop up on screen with the right error message.
/// ```
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
