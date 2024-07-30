import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/extensions/theme_mode_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';

class CharCandleFire extends StatelessWidget {
  const CharCandleFire({
    super.key,
    required this.statisticNumber,
  });
  final double statisticNumber;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/svgs/productivity_number_shape.svg',
          colorFilter: context.isDarkMode ? ColorFilter.mode(Colors.black, BlendMode.srcIn) : null,
        ),
        Positioned(
          top: 21,
          left: (statisticNumber * 100).round() == 100
              ? 39
              : (statisticNumber * 100).round() > 10
                  ? 42
                  : 46,
          child: Text(
            '${(statisticNumber * 100).round().toStringAsFixed(0)} %',
            style: context.font14w700.copyWith(
              color: context.isDarkMode ? kNeutralColorsDarkMode : kNeutralColors[0],
            ),
          ),
        ),
      ],
    );
  }
}
