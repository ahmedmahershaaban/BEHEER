import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';

class ProjectStatisticsCard extends StatelessWidget {
  const ProjectStatisticsCard({
    super.key,
    required this.number,
    required this.svgAsset,
    required this.projectStatus,
    required this.color1,
    required this.color2,
    required this.isLoading,
  });
  final int number;
  final String svgAsset;
  final String projectStatus;
  final Color color1;
  final Color color2;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            width: 104.w,
            height: 100.h,
            decoration: BoxDecoration(
              color: isLoading ? Colors.grey : null,
              borderRadius: BorderRadius.circular(8.r),
            ),
          )
        : Container(
            padding: EdgeInsets.all(16.w),
            width: 104.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                  color: color2.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(1, 10),
                ),
              ],
              gradient: RadialGradient(
                center: Alignment.centerLeft,
                radius: 1.0,
                // begin: Alignment.topLeft,
                // end: Alignment.bottomRight,
                transform: GradientRotation(
                  0.785398, // 45 degrees in radians to get diamond gradient
                ),
                colors: [
                  color1,
                  color2,
                  color2,
                ],
                stops: [0.0, 0.7, 1.0],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      number.toString(),
                      style: context.font24W700.copyWith(
                        color: kNeutralColors[0],
                      ),
                    ),
                    SvgPicture.asset(svgAsset),
                  ],
                ),
                8.verticalSpace,
                Text(
                  'Project\n$projectStatus',
                  style: context.font12w600.copyWith(
                    color: kNeutralColors[0],
                  ),
                ),
              ],
            ),
          );
  }
}
