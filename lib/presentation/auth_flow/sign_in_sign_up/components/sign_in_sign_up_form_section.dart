import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo_media_management/application/auth_flow/sign_in_sign_up_form/sign_in_sign_up_form_bloc.dart';
import 'package:ringo_media_management/application/auth_flow/sign_in_sign_up_form/sign_in_sign_up_form_event.dart';
import 'package:ringo_media_management/application/auth_flow/sign_in_sign_up_form/sign_in_sign_up_form_state.dart';
import 'package:ringo_media_management/presentation/components/default_text_form_field.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/routes/router.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';

class SignInSignUpFormSection extends HookWidget {
  const SignInSignUpFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    final showPassword = useState(true);
    final showPasswordConfirm = useState(true);
    return BlocBuilder<SignInSignUpFormBloc, SignInSignUpFormState>(
      bloc: context.read<SignInSignUpFormBloc>(),
      builder: (context, state) {
        return Form(
          autovalidateMode: state.shouldAutoValidateForm ? AutovalidateMode.always : AutovalidateMode.disabled,
          child: Column(
            children: [
              if (!state.isLoginScreen) ...[
                DefaultTextFormField(
                  initialValue: state.name.value.fold((_) => null, id),
                  onChanged: (v) => context.read<SignInSignUpFormBloc>().add(SignInSignUpFormEvent.nameChanged(v)),
                  validator: (v) => state.emailAddress.failureOrUnit.fold((f) => 'Name is not valid', (_) => null),
                  hintText: 'Enter name here',
                  labelText: 'Name',
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                24.verticalSpace,
              ],
              DefaultTextFormField(
                initialValue: state.emailAddress.value.fold((_) => null, id),
                onChanged: (v) => context.read<SignInSignUpFormBloc>().add(SignInSignUpFormEvent.emailChanged(v)),
                validator: (v) => state.emailAddress.failureOrUnit.fold((f) => 'Email is not valid', (_) => null),
                hintText: 'Enter username / email here',
                labelText: 'Username / Email',
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              24.verticalSpace,
              DefaultTextFormField(
                initialValue: state.password.value.fold((_) => null, id),
                onChanged: (v) => context.read<SignInSignUpFormBloc>().add(SignInSignUpFormEvent.passwordChanged(v)),
                validator: (v) => state.password.failureOrUnit
                    .fold((f) => 'Make sure the length is at least 8 characters\n with a mix of uppercase, lowercase and numbers', (_) => null),
                hintText: 'Enter password here',
                labelText: 'Password',
                keyboardType: TextInputType.visiblePassword,
                obscureText: showPassword.value,
                textInputAction: !state.isLoginScreen ? TextInputAction.next : TextInputAction.send,
                onFieldSubmitted: !state.isLoginScreen
                    ? null
                    : (v) => context.read<SignInSignUpFormBloc>().add(const SignInSignUpFormEvent.signInWithEmailAndPasswordPressed()),
                suffixIconConstraints: BoxConstraints(maxWidth: 16.sp, maxHeight: 16.sp),
                suffixIcon: GestureDetector(
                    child: showPassword.value ? SvgPicture.asset('assets/svgs/eye_slash.svg') : SvgPicture.asset('assets/svgs/eye.svg'),
                    // Icon(showPassword.value ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                    onTap: () {
                      showPassword.value = !showPassword.value;
                    }),
              ),
              24.verticalSpace,
              if (!state.isLoginScreen) ...[
                DefaultTextFormField(
                  initialValue: state.passwordConfirm.value.fold((_) => null, id),
                  onChanged: (v) => context.read<SignInSignUpFormBloc>().add(SignInSignUpFormEvent.passwordConfirmChanged(v)),
                  validator: (v) => state.passwordConfirm == state.password ? null : 'Make sure you entered the same password',
                  hintText: 'Enter confirm password here',
                  labelText: 'Confirm Password',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: showPasswordConfirm.value,
                  textInputAction: TextInputAction.send,
                  onFieldSubmitted: (v) =>
                      context.read<SignInSignUpFormBloc>().add(const SignInSignUpFormEvent.registerWithEmailAndPasswordPressed()),
                  suffixIconConstraints: BoxConstraints(maxWidth: 16.sp, maxHeight: 16.sp),
                  suffixIcon: GestureDetector(
                      child: showPassword.value ? SvgPicture.asset('assets/svgs/eye_slash.svg') : SvgPicture.asset('assets/svgs/eye.svg'),

                      // Icon(showPasswordConfirm.value ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                      onTap: () {
                        showPasswordConfirm.value = !showPasswordConfirm.value;
                      }),
                ),
                24.verticalSpace,
              ],
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    context.router.push(ForgetPasswordRoute(bloc: context.read<SignInSignUpFormBloc>()));
                  },
                  child: Text(
                    'Forgot Password ?',
                    style: context.font14w600,
                  ),
                ),
              ),
              24.verticalSpace,
              ElevatedButton(
                onPressed: () {
                  if (state.isLoginScreen) {
                    context.read<SignInSignUpFormBloc>().add(const SignInSignUpFormEvent.signInWithEmailAndPasswordPressed());
                  } else {
                    context.read<SignInSignUpFormBloc>().add(const SignInSignUpFormEvent.registerWithEmailAndPasswordPressed());
                  }
                },
                child: Text(
                  state.isLoginScreen ? 'Login' : 'Sign Up',
                  style: context.font16w700.copyWith(
                    color: kNeutralColors[0],
                  ),
                ),
              ),
              if (state.isSubmitting) const LinearProgressIndicator(),
            ],
          ),
        );
      },
    );
  }
}
