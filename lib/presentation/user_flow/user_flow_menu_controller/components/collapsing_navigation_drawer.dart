import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_media_management/application/auth_flow/auth/auth_bloc.dart';
import 'package:ringo_media_management/application/auth_flow/auth/auth_event.dart';
import 'package:ringo_media_management/application/core/theme/theme_bloc.dart';
import 'package:ringo_media_management/application/core/theme/theme_event.dart';
import 'package:ringo_media_management/application/core/theme/theme_state.dart';
import 'package:ringo_media_management/application/user_flow/user_flow_menu_controller/user_flow_menu_controller_bloc.dart';
import 'package:ringo_media_management/application/user_flow/user_flow_menu_controller/user_flow_menu_controller_event.dart';
import 'package:ringo_media_management/application/user_flow/user_flow_menu_controller/user_flow_menu_controller_state.dart';
import 'package:ringo_media_management/infrastructure/core/injection/injection.dart';
import 'package:ringo_media_management/presentation/core/constants.dart';
import 'package:ringo_media_management/presentation/core/extensions/theme_mode_extensions.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_menu_controller/components/collapsing_list_tile.dart';

class CollapsingNavigationDrawer extends HookWidget {
  const CollapsingNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDrawerCollapsed = useState(context.read<UserFlowMenuControllerBloc>().state.isDrawerCollapsed);
    final animationController = useAnimationController(duration: const Duration(milliseconds: 300));
    final widthAnimation = Tween<double>(begin: kDrawerMinWidth, end: kDrawerMaxWidth).animate(animationController);
    final iconAnimationRotation = Tween<double>(begin: 0.0, end: 0.5).animate(animationController);
    final iconAnimationPosition = Tween<double>(begin: 0.0, end: 1.1).animate(animationController);
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return BlocBuilder<UserFlowMenuControllerBloc, UserFlowMenuControllerState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                Navigator.maybePop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                margin: EdgeInsets.only(left: 24.w, top: 79.h, bottom: 269.h, right: 50.w),
                child: AnimatedBuilder(
                  animation: animationController,
                  builder: (context, widget) => Stack(
                    children: [
                      Container(
                        width: widthAnimation.value,
                        color: context.isDarkMode ? const Color(0xFF171A1F) : const Color(0xFFEDECF2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ListView.separated(
                                itemCount: navigationItems.length,
                                itemBuilder: (context, index) {
                                  return CollapsingListTile(
                                    title: navigationItems[index].title,
                                    svgAssetNotSelected: navigationItems[index].svgAssetNotSelected,
                                    svgAssetSelected: navigationItems[index].svgAssetSelected,
                                    animationController: animationController,
                                    isSelected: context.read<UserFlowMenuControllerBloc>().state.currentPage == index,
                                    onPress: () {
                                      if (context.read<UserFlowMenuControllerBloc>().state.currentPage != index) {
                                        /// this is how we will deal with the new tabs
                                        if (index == 0) {
                                          getIt<UserFlowMenuControllerBloc>().pageController.jumpToPage(0);
                                          getIt<UserFlowMenuControllerBloc>().add(
                                            UserFlowMenuControllerEvent.updatePageIndex(index: 0),
                                          );
                                          // context.router.maybePop(context);
                                        } else if (index == 1) {
                                          getIt<UserFlowMenuControllerBloc>().pageController.jumpToPage(1);
                                          getIt<UserFlowMenuControllerBloc>().add(
                                            UserFlowMenuControllerEvent.updatePageIndex(index: 1),
                                          );
                                        } else if (index == 2) {
                                          getIt<UserFlowMenuControllerBloc>().pageController.jumpToPage(2);
                                          getIt<UserFlowMenuControllerBloc>().add(
                                            UserFlowMenuControllerEvent.updatePageIndex(index: 2),
                                          ); // context.router.push(
                                          //   const ANYPAGEROUTE(),
                                          // );
                                        } else if (index == 3) {
                                          getIt<UserFlowMenuControllerBloc>().pageController.jumpToPage(3);
                                          getIt<UserFlowMenuControllerBloc>().add(
                                            UserFlowMenuControllerEvent.updatePageIndex(index: 3),
                                          );
                                        }
                                      }
                                    },
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Divider(
                                    color: context.isDarkMode ? const Color(0xFF3D3D3D) : const Color(0xFFE2E2E2),
                                    height: 16.h,
                                  );
                                },
                              ),
                            ),
                            Divider(
                              color: context.isDarkMode ? const Color(0xFF3D3D3D) : const Color(0xFFE2E2E2),
                              height: 16.h,
                            ),
                            CollapsingListTile(
                              title: context.isDarkMode ? 'Dark Mode' : 'Light Mode',
                              svgAssetNotSelected: 'assets/svgs/menu/dark_mode2.svg',
                              svgAssetSelected: 'assets/svgs/menu/dark_mode1.svg',
                              animationController: animationController,
                              isSelected: false,
                              onPress: () {
                                context.read<ThemeBloc>().add(const ThemeEvent.themeChanged());
                                // context.router.replace(const SignInRoute());
                              },
                            ),
                            Divider(
                              color: context.isDarkMode ? const Color(0xFF3D3D3D) : const Color(0xFFE2E2E2),
                              height: 16.h,
                            ),
                            CollapsingListTile(
                              title: 'Sign Out',
                              svgAssetNotSelected: 'assets/svgs/menu/logout2.svg',
                              svgAssetSelected: 'assets/svgs/menu/logout1.svg',
                              animationController: animationController,
                              isSelected: false,
                              onPress: () {
                                getIt<AuthBloc>().add(const AuthEvent.signedOut());
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: state.isDrawerCollapsed
                            ? Alignment(-0.63 + iconAnimationPosition.value, 0)
                            : Alignment(-0.35 + iconAnimationPosition.value, 0),
                        child: GestureDetector(
                          onTap: () {
                            isDrawerCollapsed.value = !isDrawerCollapsed.value;
                            context.read<UserFlowMenuControllerBloc>().add(const UserFlowMenuControllerEvent.toggleIsDrawerCollapsed());
                            isDrawerCollapsed.value ? animationController.reverse() : animationController.forward();
                          },
                          child: RotationTransition(
                            turns: iconAnimationRotation,
                            child: InkWell(
                              onTap: () {
                                isDrawerCollapsed.value = !isDrawerCollapsed.value;
                                context.read<UserFlowMenuControllerBloc>().add(const UserFlowMenuControllerEvent.toggleIsDrawerCollapsed());

                                isDrawerCollapsed.value ? animationController.reverse() : animationController.forward();
                              },
                              child: Container(
                                padding: EdgeInsets.all(10.r),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: context.isDarkMode ? const Color(0xFF31353B) : Colors.white,
                                ),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: context.isDarkMode ? Colors.white : Colors.black,
                                  size: 24.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class NavigationModel {
  String title;
  String svgAssetNotSelected;
  String svgAssetSelected;

  NavigationModel({
    required this.title,
    required this.svgAssetNotSelected,
    required this.svgAssetSelected,
  });
}

List<NavigationModel> navigationItems = [
  NavigationModel(
    title: 'Home',
    svgAssetNotSelected: 'assets/svgs/menu/home1.svg',
    svgAssetSelected: 'assets/svgs/menu/home2.svg',
  ),
  NavigationModel(
    title: 'Projects ',
    svgAssetNotSelected: 'assets/svgs/menu/folder1.svg',
    svgAssetSelected: 'assets/svgs/menu/folder2.svg',
  ),
  NavigationModel(
    title: 'Calender ',
    svgAssetNotSelected: 'assets/svgs/menu/calender1.svg',
    svgAssetSelected: 'assets/svgs/menu/calender2.svg',
  ),
  NavigationModel(
    title: 'Profile',
    svgAssetNotSelected: 'assets/svgs/menu/profile1.svg',
    svgAssetSelected: 'assets/svgs/menu/profile2.svg',
  ),
];
