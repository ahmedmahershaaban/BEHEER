import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo_media_management/presentation/core/constants.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/extensions/theme_mode_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';

class CollapsingListTile extends HookWidget {
  final String title;
  final String svgAssetNotSelected;
  final String svgAssetSelected;

  final AnimationController animationController;
  final bool isSelected;
  final Function() onPress;

  const CollapsingListTile({
    super.key,
    required this.title,
    required this.svgAssetNotSelected,
    required this.svgAssetSelected,
    required this.animationController,
    required this.isSelected,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final widthAnimation = Tween<double>(begin: kDrawerMinWidth, end: kDrawerMaxWidth).animate(animationController);
    final sizedBoxAnimation = Tween<double>(begin: 0, end: 10).animate(animationController);

    return InkWell(
      onTap: onPress,
      child: Container(
        width: widthAnimation.value,
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Row(
          children: [
            isSelected
                ? SvgPicture.asset(
                    svgAssetSelected,
                    width: 24.w,
                    height: 24.w,
                    colorFilter: context.isDarkMode ? ColorFilter.mode(kNeutralColorsDarkMode, BlendMode.srcIn) : null,
                  )
                : SvgPicture.asset(
                    svgAssetNotSelected,
                    width: 24.w,
                    height: 24.w,
                  ),
            SizedBox(
              width: sizedBoxAnimation.value,
            ),
            if (widthAnimation.value >= 200)
              Text(title,
                  style: isSelected
                      ? context.font16w500.copyWith()
                      : context.font16w500.copyWith(
                          color: context.isDarkMode ? Colors.white : Colors.black,
                        ))
            else
              const SizedBox(),
          ],
        ),
      ),
    );
  }
}
