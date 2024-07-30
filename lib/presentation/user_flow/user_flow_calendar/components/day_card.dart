import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ringo_media_management/application/core/theme/theme_bloc.dart';
import 'package:ringo_media_management/application/core/theme/theme_state.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/extensions/theme_mode_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';

class DayCard extends StatelessWidget {
  const DayCard({
    super.key,
    required this.onPressed,
    required this.selected,
    required this.dateTime,
  });

  final Function() onPressed;
  final bool selected;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            minimumSize: Size(48.w, 68.h),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            foregroundColor: selected
                ? context.isDarkMode
                    ? kNeutralColorsDarkMode[900]
                    : kNeutralColors[0]
                : context.isDarkMode
                    ? kNeutralColorsDarkMode
                    : kNeutralColors,
            backgroundColor: selected
                ? context.isDarkMode
                    ? Colors.black
                    : kNeutralColors
                : context.isDarkMode
                    ? kNeutralColorsDarkMode[900]
                    : kNeutralColors[0],
          ),
          onPressed: onPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 12.h,
            ),
            child: Column(
              children: [
                Text(DateFormat('EEE').format(dateTime).toUpperCase(),
                    style: context.font12w700.copyWith(
                      color: selected ? kNeutralColors[0] : kNeutralColors[500],
                    )),
                const Spacer(),
                Text(dateTime.day.toString(),
                    style: context.font16w700.copyWith(
                      color: selected
                          ? kNeutralColors[0]
                          : context.isDarkMode
                              ? kNeutralColorsDarkMode
                              : kNeutralColors,
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
