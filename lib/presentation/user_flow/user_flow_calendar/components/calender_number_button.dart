import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';

class CalenderNumberButton extends StatelessWidget {
  const CalenderNumberButton({
    super.key,
    required this.dateTime,
    required this.isSelected,
    required this.isActive,
    required this.onlClicked,
  });
  final DateTime dateTime;
  final bool isSelected;
  final bool isActive;
  final Function() onlClicked;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: BoxConstraints(
        minWidth: 36.w,
        maxWidth: 36.w,
        maxHeight: 36.w,
        minHeight: 36.w,
      ),
      style: IconButton.styleFrom(
        backgroundColor: isSelected ? kNeutralColors : null,
        hoverColor: isSelected ? kNeutralColors[0] : null,
        disabledBackgroundColor: Colors.transparent,
      ),
      onPressed: isActive ? onlClicked : null,
      icon: Text(
        dateTime.day.toString(),
        style: context.font16w600.copyWith(
          color: isActive
              ? isSelected
                  ? kNeutralColors[0]
                  : kNeutralColors
              : kNeutralColors[300],
        ),
      ),
    );
  }
}
