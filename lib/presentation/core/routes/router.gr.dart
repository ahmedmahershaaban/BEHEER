// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ForgetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ForgetPasswordRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ForgetPasswordPage(
          key: args.key,
          bloc: args.bloc,
        ),
      );
    },
    SignInSignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInSignUpPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    UserFlowCalendarRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserFlowCalendarPage(),
      );
    },
    UserFlowHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserFlowHomePage(),
      );
    },
    UserFlowMenuControllerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserFlowMenuControllerPage(),
      );
    },
    UserFlowProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserFlowProfilePage(),
      );
    },
    UserFlowProjectSummaryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserFlowProjectSummaryPage(),
      );
    },
  };
}

/// generated route for
/// [ForgetPasswordPage]
class ForgetPasswordRoute extends PageRouteInfo<ForgetPasswordRouteArgs> {
  ForgetPasswordRoute({
    Key? key,
    required SignInSignUpFormBloc bloc,
    List<PageRouteInfo>? children,
  }) : super(
          ForgetPasswordRoute.name,
          args: ForgetPasswordRouteArgs(
            key: key,
            bloc: bloc,
          ),
          initialChildren: children,
        );

  static const String name = 'ForgetPasswordRoute';

  static const PageInfo<ForgetPasswordRouteArgs> page =
      PageInfo<ForgetPasswordRouteArgs>(name);
}

class ForgetPasswordRouteArgs {
  const ForgetPasswordRouteArgs({
    this.key,
    required this.bloc,
  });

  final Key? key;

  final SignInSignUpFormBloc bloc;

  @override
  String toString() {
    return 'ForgetPasswordRouteArgs{key: $key, bloc: $bloc}';
  }
}

/// generated route for
/// [SignInSignUpPage]
class SignInSignUpRoute extends PageRouteInfo<void> {
  const SignInSignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignInSignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInSignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserFlowCalendarPage]
class UserFlowCalendarRoute extends PageRouteInfo<void> {
  const UserFlowCalendarRoute({List<PageRouteInfo>? children})
      : super(
          UserFlowCalendarRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserFlowCalendarRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserFlowHomePage]
class UserFlowHomeRoute extends PageRouteInfo<void> {
  const UserFlowHomeRoute({List<PageRouteInfo>? children})
      : super(
          UserFlowHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserFlowHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserFlowMenuControllerPage]
class UserFlowMenuControllerRoute extends PageRouteInfo<void> {
  const UserFlowMenuControllerRoute({List<PageRouteInfo>? children})
      : super(
          UserFlowMenuControllerRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserFlowMenuControllerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserFlowProfilePage]
class UserFlowProfileRoute extends PageRouteInfo<void> {
  const UserFlowProfileRoute({List<PageRouteInfo>? children})
      : super(
          UserFlowProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserFlowProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserFlowProjectSummaryPage]
class UserFlowProjectSummaryRoute extends PageRouteInfo<void> {
  const UserFlowProjectSummaryRoute({List<PageRouteInfo>? children})
      : super(
          UserFlowProjectSummaryRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserFlowProjectSummaryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
