import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ringo_media_management/domain/auth_flow/auth_failure/auth_failure.dart';
import 'package:ringo_media_management/domain/auth_flow/i_auth_facade.dart';
import 'package:ringo_media_management/domain/auth_flow/value_objects.dart';

import 'sign_in_sign_up_form_event.dart';
import 'sign_in_sign_up_form_state.dart';

/// This File will be documented in the next steps, covering both the `Presentation Layer` and `Application Layer`.
/// The `Domain Layer` and `Infrastructure Layer` have already been documented.
@injectable
class SignInSignUpFormBloc extends Bloc<SignInSignUpFormEvent, SignInSignUpFormState> {
  final IAuthFacade _iAuthFacade;
  SignInSignUpFormBloc(this._iAuthFacade) : super(SignInSignUpFormState.initial()) {
    on<NameChanged>(_onNameChanged, transformer: restartable());
    on<EmailChanged>(_onEmailChanged, transformer: restartable());
    on<PasswordChanged>(_onPasswordChanged, transformer: restartable());
    on<PasswordConfirmChanged>(_onPasswordConfirmChanged, transformer: restartable());
    on<LoginScreenToggled>(_onLoginScreenToggled, transformer: restartable());

    // Used transformer [droppable] to only accept the first request and ignore any other request may happened like double click and click more than one time while handling the first request
    on<ResetPasswordUsingEmail>(_onResetPasswordUsingEmail, transformer: droppable());
    // Used transformer [droppable] to only accept the first request and ignore any other request may happened like double click and click more than one time while handling the first request
    on<SignInWithEmailAndPasswordPressed>(_onSignInWithEmailAndPasswordPressed, transformer: droppable());
    // Used transformer [droppable] to only accept the first request and ignore any other request may happened like double click and click more than one time while handling the first request
    on<RegisterWithEmailAndPasswordPressed>(_onRegisterWithEmailAndPasswordPressed, transformer: droppable());
    // Used transformer [droppable] to only accept the first request and ignore any other request may happened like double click and click more than one time while handling the first request
    on<SignInWithGooglePressed>(_onSignInWithGooglePressed, transformer: droppable());
    // Used transformer [droppable] to only accept the first request and ignore any other request may happened like double click and click more than one time while handling the first request
    on<SignInWithTwitterPressed>(_onSignInWithTwitterPressed, transformer: droppable());
    // Used transformer [droppable] to only accept the first request and ignore any other request may happened like double click and click more than one time while handling the first request
    on<SignInWithApplePressed>(_onSignInWithApplePressed, transformer: droppable());
    // Used transformer [droppable] to only accept the first request and ignore any other request may happened like double click and click more than one time while handling the first request
    on<SignInWithFacebookPressed>(_onSignInWithFacebookPressed, transformer: droppable());

    on<ResetResponsesToInitState>(_onResetResponsesToInitState, transformer: restartable());
  }

  void _onNameChanged(NameChanged event, Emitter<SignInSignUpFormState> emit) async {
    emit(state.copyWith(
      name: Name(event.nameStr),
      authFailureOrSuccessOption: none(),
    ));
  }

  void _onEmailChanged(EmailChanged event, Emitter<SignInSignUpFormState> emit) async {
    emit(state.copyWith(
      emailAddress: EmailAddress(event.emailStr),
      authFailureOrSuccessOption: none(),
    ));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<SignInSignUpFormState> emit) async {
    emit(state.copyWith(
      password: Password(event.passwordStr),
      authFailureOrSuccessOption: none(),
    ));
  }

  void _onPasswordConfirmChanged(PasswordConfirmChanged event, Emitter<SignInSignUpFormState> emit) async {
    emit(state.copyWith(
      passwordConfirm: Password(event.passwordConfirmStr),
      authFailureOrSuccessOption: none(),
    ));
  }

  void _onLoginScreenToggled(LoginScreenToggled event, Emitter<SignInSignUpFormState> emit) async {
    emit(state.copyWith(
      isLoginScreen: !state.isLoginScreen,
      authFailureOrSuccessOption: none(),
    ));
  }

  void _onResetPasswordUsingEmail(ResetPasswordUsingEmail event, Emitter<SignInSignUpFormState> emit) async {
    Either<AuthFailure, Unit>? failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();

    emit(state.copyWith(
      authFailureOrSuccessOption: none(),
    ));

    if (isEmailValid) {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));

      failureOrSuccess = await _iAuthFacade.resetPasswordUsingEmail(
        emailAddress: state.emailAddress,
      );
    }

    emit(state.copyWith(
      shouldAutoValidateForm: true,
      isSubmitting: false,
      authFailureOrSuccessOption: optionOf(failureOrSuccess?.fold(
          (l) => left(l),
          (r) => right(
                some('Check your inbox to reset your password, email sent successfully'),
              ))),
    ));
  }

  void _onSignInWithEmailAndPasswordPressed(SignInWithEmailAndPasswordPressed event, Emitter<SignInSignUpFormState> emit) async {
    Either<AuthFailure, Unit>? failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();

    if (isEmailValid && isPasswordValid) {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));

      failureOrSuccess = await _iAuthFacade.signInWithEmailAndPassword(
        emailAddress: state.emailAddress,
        password: state.password,
      );
    }

    emit(state.copyWith(
      shouldAutoValidateForm: true,
      isSubmitting: false,
      authFailureOrSuccessOption: optionOf(failureOrSuccess?.fold(
        (l) => left(l),
        (r) => right(none()),
      )),
    ));
  }

  void _onRegisterWithEmailAndPasswordPressed(RegisterWithEmailAndPasswordPressed event, Emitter<SignInSignUpFormState> emit) async {
    Either<AuthFailure, Unit>? failureOrSuccess;

    final isNameValid = state.name.isValid();
    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();
    final isPasswordConfirmValid = state.passwordConfirm.isValid();
    final isTwoPasswordTheSame = state.password == state.passwordConfirm;

    if (isNameValid && isEmailValid && isPasswordValid && isPasswordConfirmValid && isTwoPasswordTheSame) {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));

      failureOrSuccess = await _iAuthFacade.registerWithEmailAndPassword(
        name: state.name,
        emailAddress: state.emailAddress,
        password: state.password,
      );
    }

    emit(state.copyWith(
        shouldAutoValidateForm: true,
        isSubmitting: false,
        authFailureOrSuccessOption: optionOf(failureOrSuccess?.fold((l) => left(l), (r) => right(none())))));
  }

  void _onSignInWithGooglePressed(SignInWithGooglePressed event, Emitter<SignInSignUpFormState> emit) async {
    Either<AuthFailure, Unit>? failureOrSuccess;
    emit(state.copyWith(
      isSubmitting: true,
      authFailureOrSuccessOption: none(),
    ));

    failureOrSuccess = await _iAuthFacade.signInWithGoogle();

    emit(state.copyWith(
      isSubmitting: false,
      authFailureOrSuccessOption: optionOf(failureOrSuccess.fold(
        (l) => left(l),
        (r) => right(none()),
      )),
    ));
  }

  void _onSignInWithTwitterPressed(SignInWithTwitterPressed event, Emitter<SignInSignUpFormState> emit) async {
    Either<AuthFailure, Unit>? failureOrSuccess;
    emit(state.copyWith(
      isSubmitting: true,
      authFailureOrSuccessOption: none(),
    ));

    failureOrSuccess = await _iAuthFacade.signInWithTwitter();

    emit(state.copyWith(
      isSubmitting: false,
      authFailureOrSuccessOption: optionOf(failureOrSuccess.fold(
        (l) => left(l),
        (r) => right(none()),
      )),
    ));
  }

  void _onSignInWithApplePressed(SignInWithApplePressed event, Emitter<SignInSignUpFormState> emit) async {
    Either<AuthFailure, Unit>? failureOrSuccess;

    emit(state.copyWith(
      isSubmitting: true,
      authFailureOrSuccessOption: none(),
    ));

    failureOrSuccess = await _iAuthFacade.signInWithApple();

    emit(state.copyWith(
      isSubmitting: false,
      authFailureOrSuccessOption: optionOf(failureOrSuccess.fold(
        (l) => left(l),
        (r) => right(none()),
      )),
    ));
  }

  void _onSignInWithFacebookPressed(SignInWithFacebookPressed event, Emitter<SignInSignUpFormState> emit) async {
    Either<AuthFailure, Unit>? failureOrSuccess;

    emit(state.copyWith(
      isSubmitting: true,
      authFailureOrSuccessOption: none(),
    ));

    failureOrSuccess = await _iAuthFacade.signInWithFacebook();

    emit(state.copyWith(
      isSubmitting: false,
      authFailureOrSuccessOption: optionOf(failureOrSuccess.fold(
        (l) => left(l),
        (r) => right(none()),
      )),
    ));
  }

  void _onResetResponsesToInitState(ResetResponsesToInitState event, Emitter<SignInSignUpFormState> emit) async {
    emit(SignInSignUpFormState.initial());
  }
}
