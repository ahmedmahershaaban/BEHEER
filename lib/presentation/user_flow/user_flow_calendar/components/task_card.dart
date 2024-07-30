import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/extensions/theme_mode_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';

class TaskCard extends HookWidget {
  const TaskCard({
    super.key,
    required this.title,
    required this.deadLine,
    required this.isDone,
    required this.onLongPressed,
    required this.onPressed,
  });
  final String title;
  final DateTime deadLine;
  final bool isDone;
  final Function(bool? value) onPressed;
  final Function() onLongPressed;
  @override
  Widget build(BuildContext context) {
    final isDoneCheck = useState(isDone);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Material(
        borderRadius: BorderRadius.circular(8.r),
        color: context.isDarkMode ? kNeutralColorsDarkMode[900] : kNeutralColors[0],
        child: InkWell(
          /// Intended to use this design like this
          // borderRadius: BorderRadius.circular(8.r),
          splashColor: context.isDarkMode ? kNeutralColorsDarkMode : kNeutralColors,
          hoverColor: context.isDarkMode ? kNeutralColorsDarkMode : kNeutralColors,
          onLongPress: onLongPressed,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 16.w),
            decoration: BoxDecoration(
              color: context.isDarkMode ? kNeutralColorsDarkMode[700] : kNeutralColors[0],
              borderRadius: BorderRadius.circular(8.r),
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
                  children: [
                    Text(
                      title,
                      style: context.font16w500,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      'Due Date : ${DateFormat('EEE, d MMM, yyyy').format(deadLine)}',
                      style: context.font12w400.copyWith(
                        color: context.isDarkMode ? kNeutralColorsDarkMode[500] : kNeutralColors[600],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                10.horizontalSpace,
                Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  activeColor: kGreenColor,
                  value: isDoneCheck.value,
                  onChanged: (value) {
                    isDoneCheck.value = !isDoneCheck.value;
                    onPressed(value);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
