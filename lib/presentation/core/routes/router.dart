import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ringo_media_management/application/auth_flow/sign_in_sign_up_form/sign_in_sign_up_form_bloc.dart';
import 'package:ringo_media_management/presentation/auth_flow/forget_password/forget_password_page.dart';
import 'package:ringo_media_management/presentation/auth_flow/sign_in_sign_up/sign_in_sign_up_page.dart';
import 'package:ringo_media_management/presentation/auth_flow/splash/splash_page.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_calendar/user_flow_calendar_page.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_home/user_flow_home_page.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_menu_controller/user_flow_menu_controller.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_profile/user_flow_profile_page.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_project_summary/user_flow_project_summary_page.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: SignInSignUpRoute.page),
        AutoRoute(page: ForgetPasswordRoute.page),
        AutoRoute(page: UserFlowProjectSummaryRoute.page),
        AutoRoute(page: UserFlowProfileRoute.page),
        AutoRoute(page: UserFlowHomeRoute.page),
        AutoRoute(page: UserFlowCalendarRoute.page),
        AutoRoute(page: UserFlowMenuControllerRoute.page),
      ];
}
