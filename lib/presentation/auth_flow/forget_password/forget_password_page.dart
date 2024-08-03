import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ringo_media_management/application/auth_flow/sign_in_sign_up_form/sign_in_sign_up_form_bloc.dart';
import 'package:ringo_media_management/presentation/auth_flow/forget_password/components/body.dart';
import 'package:ringo_media_management/presentation/core/extensions/theme_mode_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';

/// This Page and it's Components will be documented in the next steps, covering both the `Presentation Layer` and `Application Layer`.
/// The `Domain Layer` and `Infrastructure Layer` have already been documented.
@RoutePage()
class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key, required this.bloc});

  final SignInSignUpFormBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInSignUpFormBloc>.value(
      value: bloc,
      child: Scaffold(
        backgroundColor: context.isDarkMode ? kNeutralColorsDarkMode[900]! : kNeutralColors[0]!,
        appBar: AppBar(),
        body: const SafeArea(
          child: Body(),
        ),
      ),
    );
  }
}
