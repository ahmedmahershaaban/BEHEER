import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo_media_management/presentation/core/extensions/theme_mode_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';

class NotificationBill extends StatelessWidget {
  const NotificationBill({
    super.key,
    required this.onPressed,
  });
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
          minimumSize: Size(40.w, 40.w),
          maximumSize: Size(40.w, 40.w),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
              side: BorderSide(
                color: kNeutralColors[200]!,
                width: 1.5.sp,
              ))),
      onPressed: onPressed,
      icon: Stack(
        clipBehavior: Clip.none,
        children: [
          SvgPicture.asset(
            'assets/svgs/notification.svg',
            width: 24.w,
            height: 24.w,
            colorFilter: ColorFilter.mode(context.isDarkMode ? kNeutralColorsDarkMode : kNeutralColors[500]!, BlendMode.srcIn),
          ),
          Positioned(
            right: -7,
            top: -5,
            child: Container(
              margin: EdgeInsets.all(2.w),
              // padding: EdgeInsets.all(2.w),
              width: 12.w,
              height: 12.w,
              decoration: BoxDecoration(
                border: Border.all(
                  color: kNeutralColors[0]!,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xFFDD4A4A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
