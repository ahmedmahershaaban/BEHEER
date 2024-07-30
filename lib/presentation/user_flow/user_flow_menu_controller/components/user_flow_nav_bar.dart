import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo_media_management/presentation/core/extensions/theme_mode_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';

class UserFlowNavBar extends StatelessWidget {
  const UserFlowNavBar({
    super.key,
    required this.onIconPressed,
    required this.currentPageIndex,
  });
  final Function(int index) onIconPressed;
  final int currentPageIndex;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      padding: EdgeInsets.zero,
      elevation: 0,
      shadowColor: kNeutralColors[0],
      child: Container(
        height: 88.h,
        decoration: BoxDecoration(
          color: context.isDarkMode ? kNeutralColors : kNeutralColors[0],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
          boxShadow: [
            BoxShadow(
              color: context.isDarkMode ? kNeutralColors[0]!.withOpacity(0.15) : Color(0xFF00000014).withOpacity(0.15),
              offset: const Offset(0, -2),
              blurRadius: 24,
            ),
          ],
        ),
        child: Row(
          children: [
            navItem(
              svgAssetNotSelected: 'assets/svgs/menu/home1.svg',
              svgAssetSelected: 'assets/svgs/menu/home2.svg',
              selected: currentPageIndex == 0,
              onTap: () => onIconPressed(0),
              isDarkMode: context.isDarkMode,
            ),
            navItem(
              svgAssetNotSelected: 'assets/svgs/menu/folder1.svg',
              svgAssetSelected: 'assets/svgs/menu/folder2.svg',
              selected: currentPageIndex == 1,
              onTap: () => onIconPressed(1),
              isDarkMode: context.isDarkMode,
            ),
            60.horizontalSpace,
            navItem(
              svgAssetNotSelected: 'assets/svgs/menu/calender1.svg',
              svgAssetSelected: 'assets/svgs/menu/calender2.svg',
              selected: currentPageIndex == 2,
              onTap: () => onIconPressed(2),
              isDarkMode: context.isDarkMode,
            ),
            navItem(
              svgAssetNotSelected: 'assets/svgs/menu/profile1.svg',
              svgAssetSelected: 'assets/svgs/menu/profile2.svg',
              selected: currentPageIndex == 3,
              onTap: () => onIconPressed(3),
              isDarkMode: false,
            ),
          ],
        ),
      ),
    );
  }
}

Widget navItem({
  required String svgAssetSelected,
  required String svgAssetNotSelected,
  required bool selected,
  required bool isDarkMode,
  required Function() onTap,
}) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(15.r),
        child: selected
            ? SvgPicture.asset(
                svgAssetSelected,
                colorFilter: isDarkMode ? ColorFilter.mode(kNeutralColorsDarkMode, BlendMode.srcIn) : null,
              )
            : SvgPicture.asset(
                svgAssetNotSelected,
                // colorFilter: isDarkMode ? ColorFilter.mode(kNeutralColorsDarkMode, BlendMode.srcIn) : null,
              ),
      ),
    ),
  );
}
