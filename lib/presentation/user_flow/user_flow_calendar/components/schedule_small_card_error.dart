import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';

class ScheduleSmallCardError extends StatelessWidget {
  const ScheduleSmallCardError({
    super.key,
    required this.onErrorTap,
  });
  final Function() onErrorTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onErrorTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 16.w),
        decoration: BoxDecoration(
          color: kRedColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8.0),
          border: Border(
            left: BorderSide(color: kRedColor, width: 6),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Ops! There was an error!",
              style: context.font14w600,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            4.verticalSpace,
            Text(
              'Click on the card to report it for support!',
              style: context.font12w500.copyWith(
                color: kNeutralColors[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
