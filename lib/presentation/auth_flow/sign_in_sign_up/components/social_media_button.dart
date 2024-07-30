import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/extensions/theme_mode_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key,
    required this.title,
    required this.svgAsset,
    required this.onPressed,
  });
  final String title;
  final String svgAsset;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: context.isDarkMode
          ? ElevatedButton.styleFrom(
              foregroundColor: kNeutralColorsDarkMode[0],
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
                side: BorderSide(color: kNeutralColorsDarkMode),
              ))
          : ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: const Size(double.infinity, 32),
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
                side: BorderSide(color: kNeutralColors[200]!),
              ),
              foregroundColor: kNeutralColors,
              backgroundColor: kNeutralColors[0],
            ),
      child: Row(
        children: [
          SvgPicture.asset(
            svgAsset,
          ),
          Expanded(
              child: Center(
            child: Text(
              title,
              style: context.font16w700,
            ),
          ))
        ],
      ),
    );
  }
}
