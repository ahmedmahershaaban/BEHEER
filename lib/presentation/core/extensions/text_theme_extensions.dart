import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ringo_media_management/presentation/core/extensions/theme_mode_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';

extension TextThemeExtensions on BuildContext {
  TextStyle get font5w400 => GoogleFonts.urbanist(
        fontSize: 5.sp,
        fontWeight: FontWeight.w400,
        color: isDarkMode ? kNeutralColorsDarkMode : kNeutralColors,
      );
  TextStyle get font7w400 => GoogleFonts.urbanist(
        fontSize: 7.sp,
        fontWeight: FontWeight.w400,
        color: isDarkMode ? kNeutralColorsDarkMode : kNeutralColors,
      );
  TextStyle get font10w700 => GoogleFonts.urbanist(
        fontSize: 10.sp,
        fontWeight: FontWeight.w700,
        color: isDarkMode ? kNeutralColorsDarkMode : kNeutralColors,
      );
  TextStyle get font12w400 => GoogleFonts.urbanist(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: isDarkMode ? kNeutralColorsDarkMode : kNeutralColors,
      );
  TextStyle get font12w500 => GoogleFonts.urbanist(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: isDarkMode ? kNeutralColorsDarkMode : kNeutralColors,
      );
  TextStyle get font12w600 => GoogleFonts.urbanist(
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        color: isDarkMode ? kNeutralColorsDarkMode : kNeutralColors,
      );
  TextStyle get font12w700 => GoogleFonts.urbanist(
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        color: isDarkMode ? kNeutralColorsDarkMode : kNeutralColors,
      );
  TextStyle get font14w500 => GoogleFonts.urbanist(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: isDarkMode ? kNeutralColorsDarkMode : kNeutralColors,
      );
  TextStyle get font14w600 => GoogleFonts.urbanist(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: isDarkMode ? kNeutralColorsDarkMode : kNeutralColors,
      );
  TextStyle get font14w700 => GoogleFonts.urbanist(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: isDarkMode ? kNeutralColorsDarkMode : kNeutralColors,
      );

  TextStyle get font16w400 => GoogleFonts.urbanist(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: isDarkMode ? kNeutralColorsDarkMode : kNeutralColors,
      );
  TextStyle get font16w500 => GoogleFonts.urbanist(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: isDarkMode ? kNeutralColorsDarkMode : kNeutralColors,
      );
  TextStyle get font16w600 => GoogleFonts.urbanist(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: isDarkMode ? kNeutralColorsDarkMode : kNeutralColors,
      );
  TextStyle get font16w700 => GoogleFonts.urbanist(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: isDarkMode ? kNeutralColorsDarkMode : kNeutralColors,
      );
  TextStyle get font18w700 => GoogleFonts.urbanist(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: isDarkMode ? kNeutralColorsDarkMode : kNeutralColors,
      );
  TextStyle get font24W700 => GoogleFonts.urbanist(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: isDarkMode ? kNeutralColorsDarkMode : kNeutralColors,
      );
}
