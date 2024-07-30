import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';

class TaskCardError extends StatelessWidget {
  const TaskCardError({
    super.key,
    required this.onErrorTap,
  });
  final Function() onErrorTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onErrorTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        child: Material(
          color: kNeutralColors[0],
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 16.w),
            decoration: BoxDecoration(
              color: kRedColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8.r),
              border: Border(
                left: BorderSide(color: kRedColor, width: 6),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF00000014).withOpacity(0.08),
                  offset: const Offset(4, 8),
                  blurRadius: 24,
                )
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Ops! There was an error!",
                      style: context.font16w500,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      'Click on the card to report it for support!',
                      style: context.font12w400.copyWith(
                        color: kNeutralColors[600],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
