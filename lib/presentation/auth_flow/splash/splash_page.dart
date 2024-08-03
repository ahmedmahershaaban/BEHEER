import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:ringo_media_management/application/auth_flow/auth/auth_bloc.dart';
import 'package:ringo_media_management/application/auth_flow/auth/auth_event.dart';
import 'package:ringo_media_management/application/auth_flow/auth/auth_state.dart';
import 'package:ringo_media_management/application/user_flow/user_flow/user_flow_bloc.dart';
import 'package:ringo_media_management/infrastructure/core/injection/injection.dart';
import 'package:ringo_media_management/presentation/auth_flow/splash/components/body.dart';
import 'package:ringo_media_management/presentation/components/snackbar/snackbar.dart';
import 'package:ringo_media_management/presentation/core/routes/router.dart';

/// This Page and it's Components will be documented in the next steps, covering both the `Presentation Layer` and `Application Layer`.
/// The `Domain Layer` and `Infrastructure Layer` have already been documented.
@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getIt<AuthBloc>().add(const AuthEvent.checkStoreVersion());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: getIt<AuthBloc>(),
      listener: (context, state) {
        /// The delay [milliseconds: 200] here to show to logo of the app for more time in the splash screen
        Future.delayed(const Duration(milliseconds: 200)).then((value) {
          if (state is ShouldUpdateTheAppVersionFromStore) {
            if (!kIsWeb) {
              getIt<AuthBloc>().newVersion.showUpdateDialog(
                    context: context,
                    versionStatus: state.appVersion,
                    allowDismissal: false,
                    launchModeVersion: LaunchModeVersion.external,
                  );
            }
          } else {
            state.map(
              initial: (_) {},
              shouldUpdateTheAppVersionFromStore: (state) {},
              authenticated: (_) {
                getIt<AuthBloc>().userModelOption.fold(() {
                  debugPrint('[authenticated] [userModelOption] [Null]');
                  context.router.replaceAll([const SignInSignUpRoute()]);
                }, (userModel) {
                  // debugPrint('[authenticated] [userModelOption] [$userModel]');
                  if (userModel.isBlocked) {
                    IconSnackBar.show(
                      context: context,
                      snackBarType: SnackBarType.fail,
                      label: 'Your account has been blocked, contact support for more details',
                      duration: const Duration(minutes: 5),
                    );
                  } else {
                    BlocProvider<UserFlowBloc>(
                      create: (context) => getIt<UserFlowBloc>(),
                    );
                    Future.delayed(const Duration(milliseconds: 200)).then((value) {
                      context.router.replaceAll([const UserFlowMenuControllerRoute()]);
                    });
                  }
                });
              },
              unauthenticated: (_) {
                Future.delayed(const Duration(milliseconds: 200)).then((value) {
                  context.router.replaceAll([const SignInSignUpRoute()]);
                });
              },
            );
          }
        });
      },
      builder: (context, state) {
        return Scaffold(
          body: Body(),
        );
      },
    );
  }
}
