import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_media_management/application/auth_flow/auth/auth_bloc.dart';
import 'package:ringo_media_management/application/auth_flow/auth/auth_state.dart';
import 'package:ringo_media_management/application/core/internet_connection/internet_connection_bloc.dart';
import 'package:ringo_media_management/application/core/internet_connection/internet_connection_event.dart';
import 'package:ringo_media_management/application/core/internet_connection/internet_connection_state.dart';
import 'package:ringo_media_management/application/core/theme/theme_bloc.dart';
import 'package:ringo_media_management/application/core/theme/theme_state.dart';
import 'package:ringo_media_management/application/user_flow/user_flow/user_flow_bloc.dart';
import 'package:ringo_media_management/application/user_flow/user_flow/user_flow_event.dart';
import 'package:ringo_media_management/application/user_flow/user_flow/user_flow_state.dart';
import 'package:ringo_media_management/application/user_flow/user_flow_menu_controller/user_flow_menu_controller_bloc.dart';
import 'package:ringo_media_management/application/user_flow/user_flow_menu_controller/user_flow_menu_controller_event.dart';
import 'package:ringo_media_management/application/user_flow/user_flow_menu_controller/user_flow_menu_controller_state.dart';
import 'package:ringo_media_management/domain/core/errors.dart';
import 'package:ringo_media_management/domain/user_flow/user_flow_failure/user_flow_failure.dart';
import 'package:ringo_media_management/infrastructure/core/injection/injection.dart';
import 'package:ringo_media_management/presentation/components/custom_page_view_scroll_physics.dart';
import 'package:ringo_media_management/presentation/components/keep_page_a_live.dart';
import 'package:ringo_media_management/presentation/components/snackbar/snackbar.dart';
import 'package:ringo_media_management/presentation/core/extensions/string_extension.dart';
import 'package:ringo_media_management/presentation/core/routes/router.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';
import 'package:ringo_media_management/presentation/user_flow/components/user_flow_pop_up/add_calender_page_pop_up.dart';
import 'package:ringo_media_management/presentation/user_flow/components/user_flow_pop_up/add_project_page_pop_up.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_calendar/user_flow_calendar_page.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_home/user_flow_home_page.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_menu_controller/components/collapsing_navigation_drawer.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_menu_controller/components/user_flow_main_scaffold.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_menu_controller/components/user_flow_nav_bar.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_profile/user_flow_profile_page.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_project_summary/user_flow_project_summary_page.dart';

@RoutePage()
class UserFlowMenuControllerPage extends StatelessWidget {
  const UserFlowMenuControllerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>.value(
          value: getIt<AuthBloc>(),
        ),
        BlocProvider<UserFlowMenuControllerBloc>.value(
          value: getIt<UserFlowMenuControllerBloc>(),
        ),
        BlocProvider<UserFlowBloc>.value(
          value: getIt<UserFlowBloc>()
            ..add(
              const UserFlowEvent.loadAllNeededDataForUserFlow(),
            ),
        ),
        BlocProvider<InternetConnectionBloc>.value(
          value: getIt<InternetConnectionBloc>()
            ..add(
              const InternetConnectionEvent.registerListenerForDeviceConnectivity(),
            ),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is! Authenticated) {
                context.router.replaceAll([const SplashRoute()]);
              }
            },
          ),
          BlocListener<InternetConnectionBloc, InternetConnectionState>(
            listener: (context, state) {
              state.map(
                initial: (_) {},
                noInternetConnection: (_) {
                  IconSnackBar.show(
                    context: context,
                    snackBarType: SnackBarType.fail,
                    label: 'No Internet Connection!',
                  );
                },
                internetConnectionIsBack: (_) {
                  IconSnackBar.show(
                    context: context,
                    snackBarType: SnackBarType.save,
                    label: 'Internet Connection Back!',
                  );
                },
              );
            },
          ),
          BlocListener<UserFlowBloc, UserFlowState>(
            listener: (context, state) {
              state.userFlowFailureOrSuccessOption.fold(() {}, (eitherValue) {
                eitherValue.fold((f) {
                  IconSnackBar.show(
                    context: context,
                    snackBarType: SnackBarType.fail,
                    label: getUserFlowFailureString(f),
                  );
                }, (optionValue) {
                  optionValue.fold(() {}, (message) {
                    IconSnackBar.show(
                      context: context,
                      snackBarType: SnackBarType.save,
                      label: message,
                    );
                  });
                });
              });
            },
          ),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return BlocBuilder<UserFlowMenuControllerBloc, UserFlowMenuControllerState>(
              builder: (context, state) {
                return UserFlowMainScaffold(
                  appBarTitle: [
                    'Hi, ${getIt<AuthBloc>().userModelOption.getOrElse(() => throw UnexpectedNullValueError()).firstName.toCapitalized()}',
                    'Project Summary',
                    'Calendar',
                    'Profile',
                  ][state.currentPage],
                  appBarSubTitle: [
                    "Let’s finish your work today",
                    null,
                    null,
                    null,
                  ][state.currentPage],
                  body: Column(
                    children: [
                      Expanded(
                        child: PageView(
                          physics: const CustomPageViewScrollPhysics(),
                          controller: getIt<UserFlowMenuControllerBloc>().pageController,
                          onPageChanged: (index) {
                            getIt<UserFlowMenuControllerBloc>().pageController.jumpToPage(index);
                            getIt<UserFlowMenuControllerBloc>().add(
                              UserFlowMenuControllerEvent.updatePageIndex(index: index),
                            );
                          },
                          children: const [
                            KeepPageALive(child: UserFlowHomePage()),
                            KeepPageALive(child: UserFlowProjectSummaryPage()),
                            KeepPageALive(child: UserFlowCalendarPage()),
                            KeepPageALive(child: UserFlowProfilePage()),
                          ],
                        ),
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          UserFlowNavBar(
                            currentPageIndex: state.currentPage,
                            onIconPressed: (int index) {
                              getIt<UserFlowMenuControllerBloc>().pageController.jumpToPage(index);
                              getIt<UserFlowMenuControllerBloc>().add(
                                UserFlowMenuControllerEvent.updatePageIndex(index: index),
                              );
                            },
                          ),
                          Positioned(
                            bottom: 36.h,
                            left: MediaQuery.of(context).size.width / 2 - 28.w,
                            child: Padding(
                              padding: EdgeInsets.only(top: 25.h),
                              child: FloatingActionButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                backgroundColor: kNeutralColors,
                                child: Padding(
                                  padding: EdgeInsets.all(10.r),
                                  child: Icon(
                                    Icons.add,
                                    size: 32.sp,
                                    color: kNeutralColors[0],
                                  ),
                                ),
                                onPressed: () {
                                  switch (state.currentPage) {
                                    case 0:
                                      return;
                                    case 1:
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) => AddProjectPagePopUp(
                                          buttonText: 'Continue',
                                          initialDate: DateTime.now(),
                                          onDateChange: (DateTime date) {},
                                        ),
                                      );
                                      return;
                                    case 2:
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (popUpContext) => BlocProvider<UserFlowBloc>.value(
                                          value: context.read<UserFlowBloc>(),
                                          child: AddCalenderPagePopUp(
                                            buttonText: 'Add',
                                            initialDate: context.read<UserFlowBloc>().state.selectedDayForCalenderDayModel,
                                            onDateChange: (DateTime dateTime) {
                                              context
                                                  .read<UserFlowBloc>()
                                                  .add(UserFlowEvent.getCalenderDayModel(shouldUpdateScrollbar: true, date: dateTime));
                                            },
                                            // buttonText: 'Continue',
                                          ),
                                        ),
                                      );
                                    case 3:
                                      return;
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  drawer: const CollapsingNavigationDrawer(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
