import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_media_management/application/auth_flow/sign_in_sign_up_form/sign_in_sign_up_form_bloc.dart';
import 'package:ringo_media_management/application/auth_flow/sign_in_sign_up_form/sign_in_sign_up_form_event.dart';
import 'package:ringo_media_management/application/auth_flow/sign_in_sign_up_form/sign_in_sign_up_form_state.dart';
import 'package:ringo_media_management/presentation/components/default_text_form_field.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';

class ForgetPasswordFormSection extends StatelessWidget {
  const ForgetPasswordFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInSignUpFormBloc, SignInSignUpFormState>(
      builder: (context, state) {
        return Form(
          autovalidateMode: state.shouldAutoValidateForm ? AutovalidateMode.always : AutovalidateMode.disabled,
          child: Column(
            children: [
              DefaultTextFormField(
                initialValue: state.emailAddress.value.fold((_) => null, id),
                onChanged: (v) => context.read<SignInSignUpFormBloc>().add(SignInSignUpFormEvent.emailChanged(v)),
                validator: (v) => state.emailAddress.failureOrUnit.fold((f) => 'Email is not valid', (_) => null),
                hintText: 'Enter email here',
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.send,
                onFieldSubmitted: (v) => context.read<SignInSignUpFormBloc>().add(const SignInSignUpFormEvent.resetPasswordUsingEmail()),
              ),
              48.verticalSpace,
              ElevatedButton(
                onPressed: () => context.read<SignInSignUpFormBloc>().add(const SignInSignUpFormEvent.resetPasswordUsingEmail()),
                child: Text(
                  'Forget Password',
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
