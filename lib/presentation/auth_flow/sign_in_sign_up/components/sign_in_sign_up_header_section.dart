import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_media_management/application/auth_flow/sign_in_sign_up_form/sign_in_sign_up_form_bloc.dart';
import 'package:ringo_media_management/application/auth_flow/sign_in_sign_up_form/sign_in_sign_up_form_state.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';

class SignInSignUpHeaderSection extends StatelessWidget {
  const SignInSignUpHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInSignUpFormBloc, SignInSignUpFormState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              state.isLoginScreen ? 'Login' : 'Sign Up',
              style: context.font24W700,
            ),
            8.verticalSpace,
            Text(
              state.isLoginScreen ? 'Sign in to your account' : 'Create new account',
              style: context.font14w500.copyWith(
                color: kNeutralColors[500],
              ),
            ),
          ],
        );
      },
    );
  }
}
