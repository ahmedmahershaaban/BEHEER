import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_media_management/application/user_flow/user_flow/user_flow_bloc.dart';
import 'package:ringo_media_management/application/user_flow/user_flow/user_flow_state.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_home/components/home_search_section.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_home/components/home_team_workspace_section.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_home/components/today_schedule_section.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFlowBloc, UserFlowState>(
      builder: (context, state) {
        return SingleChildScrollView(
          physics: state.homePageIsLoadingWorkTodaySchedule ? const NeverScrollableScrollPhysics() : null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.verticalSpace,
              HomeTeamWorkspaceSection(),
              30.verticalSpace,
              HomeSearchSection(),
              TodayScheduleSection(),
            ],
          ),
        );
      },
    );
  }
}
