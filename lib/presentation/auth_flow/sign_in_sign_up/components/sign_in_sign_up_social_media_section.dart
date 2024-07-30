import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_media_management/application/auth_flow/sign_in_sign_up_form/sign_in_sign_up_form_bloc.dart';
import 'package:ringo_media_management/application/auth_flow/sign_in_sign_up_form/sign_in_sign_up_form_event.dart';
import 'package:ringo_media_management/presentation/auth_flow/sign_in_sign_up/components/social_media_button.dart';

class SignInSignUpSocialMediaSection extends StatelessWidget {
  const SignInSignUpSocialMediaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialMediaButton(
          title: 'Continue with Google',
          svgAsset: 'assets/svgs/auth/google.svg',
          onPressed: () {
            context.read<SignInSignUpFormBloc>().add(const SignInSignUpFormEvent.signInWithGooglePressed());
          },
        ),
        16.verticalSpace,
        SocialMediaButton(
          title: 'Continue with Facebook',
          svgAsset: 'assets/svgs/auth/fb.svg',
          onPressed: () {
            context.read<SignInSignUpFormBloc>().add(const SignInSignUpFormEvent.signInWithFacebookPressed());
          },
        ),
        16.verticalSpace,
        SocialMediaButton(
          title: 'Continue with Apple',
          svgAsset: 'assets/svgs/auth/apple.svg',
          onPressed: () {
            context.read<SignInSignUpFormBloc>().add(const SignInSignUpFormEvent.signInWithApplePressed());
          },
        ),
      ],
    );
  }
}
