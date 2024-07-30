import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_media_management/application/core/theme/theme_bloc.dart';
import 'package:ringo_media_management/application/core/theme/theme_state.dart';
import 'package:ringo_media_management/application/user_flow/user_flow/user_flow_bloc.dart';
import 'package:ringo_media_management/application/user_flow/user_flow/user_flow_state.dart';
import 'package:ringo_media_management/presentation/components/shimmer_loading.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/extensions/theme_mode_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_project_summary/components/project_statistics_card.dart';

class ProjectSummaryStatistics extends StatelessWidget {
  const ProjectSummaryStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return BlocBuilder<UserFlowBloc, UserFlowState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerLoading(
                        isLoading: state.projectPageIsLoadingForProjectsStatisticsModel,
                        child: ProjectStatisticsCard(
                          number: 10,
                          svgAsset: 'assets/svgs/clock.svg',
                          projectStatus: 'In Progress',
                          color1: Color(0xFF3A9ADE),
                          color2: Color(0xFF5EACE4),
                          isLoading: state.projectPageIsLoadingForProjectsStatisticsModel,
                        ),
                      ),
                      ShimmerLoading(
                        isLoading: state.projectPageIsLoadingForProjectsStatisticsModel,
                        child: ProjectStatisticsCard(
                          number: 24,
                          svgAsset: 'assets/svgs/verify.svg',
                          projectStatus: 'Completed',
                          color1: Color(0xFF3F8B8D),
                          color2: Color(0xFF58B2B4),
                          isLoading: state.projectPageIsLoadingForProjectsStatisticsModel,
                        ),
                      ),
                      ShimmerLoading(
                        isLoading: state.projectPageIsLoadingForProjectsStatisticsModel,
                        child: ProjectStatisticsCard(
                          number: 5,
                          svgAsset: 'assets/svgs/close_circle.svg',
                          projectStatus: 'Cancelled',
                          color1: Color(0xFFDD4A4A),
                          color2: Color(0xFFE87777),
                          isLoading: state.projectPageIsLoadingForProjectsStatisticsModel,
                        ),
                      ),
                    ],
                  ),
                  24.verticalSpace,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: context.isDarkMode ? kNeutralColorsDarkMode[0] : kNeutralColors,
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          side: BorderSide(color: context.isDarkMode ? kNeutralColorsDarkMode : kNeutralColors),
                        )),
                    onPressed: () {},
                    child: Text(
                      'View All Project',
                      style: context.font14w700,
                    ),
                  ),
                  20.verticalSpace,
                ],
              ),
            );
          },
        );
      },
    );
  }
}
