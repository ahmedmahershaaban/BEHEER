import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_media_management/application/core/theme/theme_bloc.dart';
import 'package:ringo_media_management/application/core/theme/theme_state.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/extensions/theme_mode_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_project_summary/components/bar_chart.dart';

class ProjectSummaryProductivitySection extends StatelessWidget {
  const ProjectSummaryProductivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return ColoredBox(
          color: context.isDarkMode ? kNeutralColorsDarkMode[900]! : kNeutralColors[0]!,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Productivity',
                      style: context.font18w700,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_horiz_outlined,
                      ),
                    ),
                  ],
                ),
                36.verticalSpace,
                BarChart(
                  months: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                  statistics: [1, 0.854, 0.408, 0.562, 0.09, 0.797],
                  selectedMonth: 5,
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
