import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_media_management/application/auth_flow/sign_in_sign_up_form/sign_in_sign_up_form_bloc.dart';
import 'package:ringo_media_management/application/auth_flow/sign_in_sign_up_form/sign_in_sign_up_form_event.dart';
import 'package:ringo_media_management/application/auth_flow/sign_in_sign_up_form/sign_in_sign_up_form_state.dart';
import 'package:ringo_media_management/domain/auth_flow/auth_failure/auth_failure.dart';
import 'package:ringo_media_management/presentation/auth_flow/sign_in_sign_up/components/sign_in_sign_up_form_section.dart';
import 'package:ringo_media_management/presentation/auth_flow/sign_in_sign_up/components/sign_in_sign_up_header_section.dart';
import 'package:ringo_media_management/presentation/auth_flow/sign_in_sign_up/components/sign_in_sign_up_social_media_section.dart';
import 'package:ringo_media_management/presentation/components/snackbar/snackbar.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/routes/router.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInSignUpFormBloc, SignInSignUpFormState>(
      bloc: context.read<SignInSignUpFormBloc>(),
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold((failures) {
                  // handle the failure of reset password here
                  IconSnackBar.show(
                    context: context,
                    snackBarType: SnackBarType.fail,
                    label: getAuthFailureString(failures),
                    duration: const Duration(minutes: 5),
                  );
                }, (optionOfString) {
                  optionOfString.fold(
                    () {
                      context.router.replaceAll([
                        const SplashRoute(),
                      ]);
                    },
                    (a) => IconSnackBar.show(
                      context: context,
                      snackBarType: SnackBarType.save,
                      label: a,
                    ),
                  );
                  return null;
                }));
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.verticalSpace,
                const SignInSignUpHeaderSection(),
                40.verticalSpace,
                const SignInSignUpFormSection(),
                24.verticalSpace,
                Center(
                  child: Text(
                    'Or login with account',
                    style: context.font12w600.copyWith(
                      color: kNeutralColors[500],
                    ),
                  ),
                ),
                24.verticalSpace,
                const SignInSignUpSocialMediaSection(),
                24.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.isLoginScreen ? 'Don’t have an account?' : 'Have account already?',
                      style: context.font14w500.copyWith(
                        color: kNeutralColors[500],
                      ),
                    ),
                    4.horizontalSpace,
                    GestureDetector(
                      onTap: () {
                        context.read<SignInSignUpFormBloc>().add(const SignInSignUpFormEvent.loginScreenToggled());
                      },
                      child: Text(
                        state.isLoginScreen ? 'Register Here' : 'Sign In',
                        style: context.font14w700,
                      ),
                    )
                  ],
                ),
                24.verticalSpace,
              ],
            ),
          ),
        );
      },
    );
  }
}
