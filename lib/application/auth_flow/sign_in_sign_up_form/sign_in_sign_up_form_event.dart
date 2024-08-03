import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_sign_up_form_event.freezed.dart';

/// This File will be documented in the next steps, covering both the `Presentation Layer` and `Application Layer`.
/// The `Domain Layer` and `Infrastructure Layer` have already been documented.
@freezed
abstract class SignInSignUpFormEvent with _$SignInSignUpFormEvent {
  const factory SignInSignUpFormEvent.nameChanged(String? nameStr) = NameChanged;
  const factory SignInSignUpFormEvent.emailChanged(String? emailStr) = EmailChanged;
  const factory SignInSignUpFormEvent.passwordChanged(String? passwordStr) = PasswordChanged;
  const factory SignInSignUpFormEvent.passwordConfirmChanged(String? passwordConfirmStr) = PasswordConfirmChanged;
  const factory SignInSignUpFormEvent.loginScreenToggled() = LoginScreenToggled;
  const factory SignInSignUpFormEvent.signInWithEmailAndPasswordPressed() = SignInWithEmailAndPasswordPressed;
  const factory SignInSignUpFormEvent.registerWithEmailAndPasswordPressed() = RegisterWithEmailAndPasswordPressed;
  const factory SignInSignUpFormEvent.signInWithGooglePressed() = SignInWithGooglePressed;
  const factory SignInSignUpFormEvent.signInWithApplePressed() = SignInWithApplePressed;
  const factory SignInSignUpFormEvent.signInWithTwitterPressed() = SignInWithTwitterPressed;
  const factory SignInSignUpFormEvent.signInWithFacebookPressed() = SignInWithFacebookPressed;
  const factory SignInSignUpFormEvent.resetResponsesToInitState() = ResetResponsesToInitState;
  const factory SignInSignUpFormEvent.resetPasswordUsingEmail() = ResetPasswordUsingEmail;
}
