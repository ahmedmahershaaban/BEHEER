import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_media_management/application/auth_flow/sign_in_sign_up_form/sign_in_sign_up_form_bloc.dart';
import 'package:ringo_media_management/application/auth_flow/sign_in_sign_up_form/sign_in_sign_up_form_state.dart';
import 'package:ringo_media_management/presentation/auth_flow/forget_password/components/forget_password_form_section.dart';
import 'package:ringo_media_management/presentation/auth_flow/forget_password/components/forget_password_header_section.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInSignUpFormBloc, SignInSignUpFormState>(
      listener: (context, state) {
        // state.authFailureOrSuccessOption.fold(
        //     () {},
        //     (either) => either.fold((failures) {
        //           // handle the failure of reset password here
        //           IconSnackBar.show(
        //             context,
        //             snackBarType: SnackBarType.fail,
        //             label: getAuthFailureString(failures),
        //             duration: const Duration(minutes: 5),
        //           );
        //         }, (optionOfString) {
        //           optionOfString.fold(
        //             () {},
        //             (a) => IconSnackBar.show(
        //               context,
        //               snackBarType: SnackBarType.success,
        //               label: a,
        //             ),
        //           );
        //           return null;
        //         }));
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              50.verticalSpace,
              const ForgetPasswordHeaderSection(),
              const Spacer(),
              const ForgetPasswordFormSection(),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        );
      },
    );
  }
}
