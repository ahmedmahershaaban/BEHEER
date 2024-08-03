import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ringo_media_management/domain/auth_flow/auth_failure/auth_failure.dart';
import 'package:ringo_media_management/domain/auth_flow/value_objects.dart';

part 'sign_in_sign_up_form_state.freezed.dart';

/// This File will be documented in the next steps, covering both the `Presentation Layer` and `Application Layer`.
/// The `Domain Layer` and `Infrastructure Layer` have already been documented.
@freezed
abstract class SignInSignUpFormState with _$SignInSignUpFormState {
  const factory SignInSignUpFormState({
    required Name name,
    required EmailAddress emailAddress,
    required Password password,
    required Password passwordConfirm,
    required bool shouldAutoValidateForm,
    required bool isLoginScreen,
    required bool isSubmitting,
    required Option<Either<AuthFailure, Option<String>>> authFailureOrSuccessOption,
  }) = _signInFormState;

  factory SignInSignUpFormState.initial() => SignInSignUpFormState(
        name: Name(null),
        emailAddress: EmailAddress(null),
        password: Password(null),
        passwordConfirm: Password(null),
        isLoginScreen: true,
        shouldAutoValidateForm: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );
}
