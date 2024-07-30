import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';
import 'package:ringo_media_management/presentation/core/utilities.dart';

class ScheduleSmallCard extends StatelessWidget {
  const ScheduleSmallCard({
    super.key,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.color,
    required this.isLoading,
  });
  final String title;
  final DateTime startDate;
  final DateTime endDate;

  final Color color;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 16.w),
      decoration: BoxDecoration(
        color: isLoading ? Colors.grey : color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8.0),
        border: Border(
          left: BorderSide(color: color, width: 6),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.font14w600,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          4.verticalSpace,
          Row(
            children: [
              SvgPicture.asset(
                'assets/svgs/clock.svg',
                colorFilter: ColorFilter.mode(kNeutralColors[500]!, BlendMode.srcIn),
                semanticsLabel: 'clock',
              ),
              8.horizontalSpace,
              Text(
                '${extractHourWithPrefixFromDateTime(startDate)} - ${extractHourWithPrefixFromDateTime(endDate)}',
                style: context.font12w500.copyWith(
                  color: kNeutralColors[500],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
