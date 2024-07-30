import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_project_summary/components/char_candle.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_project_summary/components/char_candle_fire.dart';

class BarColumn extends StatelessWidget {
  const BarColumn({
    super.key,
    required this.onTap,
    required this.statisticNumber,
    required this.widthOfBar,
    required this.isSelectedCandle,
    required this.monthName,
  });
  final double statisticNumber;
  final double widthOfBar;
  final Function() onTap;
  final bool isSelectedCandle;
  final String monthName;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            CharCandle(
              onTap: onTap,
              statisticNumber: statisticNumber,
              widthOfBar: widthOfBar,
              isSelectedCandle: isSelectedCandle,
            ),
            if (isSelectedCandle)
              Positioned(
                top: -67,
                left: -32,
                child: CharCandleFire(
                  statisticNumber: statisticNumber,
                ),
              )
          ],
        ),
        12.verticalSpace,
        GestureDetector(
          onTap: onTap,
          child: SizedBox(
            width: widthOfBar,
            child: Text(
              monthName,
              style: context.font14w500.copyWith(
                color: isSelectedCandle ? kNeutralColors : kNeutralColors[500],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
