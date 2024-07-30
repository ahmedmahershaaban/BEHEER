import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_media_management/presentation/core/extensions/theme_mode_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';

class CharCandle extends StatelessWidget {
  const CharCandle({
    super.key,
    required this.onTap,
    required this.statisticNumber,
    required this.widthOfBar,
    required this.isSelectedCandle,
  });
  final Function() onTap;
  final double statisticNumber;
  final double widthOfBar;
  final bool isSelectedCandle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.r),
        topRight: Radius.circular(8.r),
      ),
      onTap: onTap,
      child: Container(
        height: 152.h * statisticNumber,
        width: widthOfBar,
        decoration: BoxDecoration(
          color: isSelectedCandle
              ? context.isDarkMode
                  ? Colors.black
                  : kNeutralColors
              : null,
          gradient: isSelectedCandle
              ? null
              : LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: context.isDarkMode
                      ? [
                          const Color(0xFF808080).withOpacity(0.10),
                          const Color(0xFFFFFFFF).withOpacity(0.15),
                        ]
                      : [
                          const Color(0xFF191C2A).withOpacity(0.12),
                          const Color(0xFF191C2A).withOpacity(0.06),
                        ],
                ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.r),
            topRight: Radius.circular(8.r),
          ),
        ),
      ),
    );
  }
}
