import 'dart:math';

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
import 'package:ringo_media_management/presentation/user_flow/user_flow_home/components/schedule_big_card.dart';

class TodayScheduleSection extends StatelessWidget {
  const TodayScheduleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return BlocBuilder<UserFlowBloc, UserFlowState>(
          builder: (context, state) {
            return ColoredBox(
              color: context.isDarkMode ? kNeutralColorsDarkMode[900]! : kNeutralColors[0]!,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Today Schedule',
                          style: context.font18w700,
                        ),
                        20.horizontalSpace,
                        Text(
                          'Today Task',
                          style: context.font18w700.copyWith(
                            color: kNeutralColors[500],
                          ),
                        ),
                      ],
                    ),
                    25.verticalSpace,
                    Column(
                      children: List.generate(
                          5,
                          (index) => ShimmerLoading(
                                isLoading: state.homePageIsLoadingWorkTodaySchedule,
                                child: ScheduleBigCard(
                                  numberOfLinks: Random().nextInt(20),
                                  numberOfComments: Random().nextInt(30),
                                  numberOfMembersSvgsAssets: List.generate(Random().nextInt(8) + 1, (index) => index).toList(),
                                  color: [
                                    kBlueColor,
                                    kOrangeColor,
                                    kPinkColor,
                                    kGreenColor,
                                    kPurpleColor,
                                  ][index],
                                  title: [
                                    'Sprint Review Period 02 in May 2022',
                                    'Post Shot Dribbble',
                                    'Sprint Review Period 02 in May 2022',
                                    'Post Shot Dribbble',
                                    'Sprint Review Period 02 in May 2022',
                                  ][index],
                                  subTitle: 'Sprint',
                                  startDate: DateTime.now(),
                                  endDate: DateTime.now().add(Duration(hours: 1)),
                                  location: 'Aksantara Office',
                                ),
                              )),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
