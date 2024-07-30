import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo_media_management/application/core/theme/theme_bloc.dart';
import 'package:ringo_media_management/application/core/theme/theme_state.dart';
import 'package:ringo_media_management/presentation/components/default_text_form_field.dart';
import 'package:ringo_media_management/presentation/core/extensions/theme_mode_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';

class HomeSearchSection extends StatelessWidget {
  const HomeSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return ColoredBox(
          color: context.isDarkMode ? kNeutralColorsDarkMode[900]! : kNeutralColors[0]!,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                24.verticalSpace,
                DefaultTextFormField(
                  initialValue: null,
                  onChanged: (v) {},
                  validator: (v) {
                    return 'hi';
                  },
                  hintText: 'Search your tasks here',
                  labelText: 'Search',
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  suffixIcon: SvgPicture.asset(
                    'assets/svgs/normal_search.svg',
                    colorFilter: ColorFilter.mode(kNeutralColors[500]!, BlendMode.srcIn),
                  ),
                  suffixIconConstraints: BoxConstraints(maxWidth: 24.sp, maxHeight: 24.sp),
                ),
                24.verticalSpace,
              ],
            ),
          ),
        );
      },
    );
  }
}
