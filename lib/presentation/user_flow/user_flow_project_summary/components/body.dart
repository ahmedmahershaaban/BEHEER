import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ringo_media_management/application/user_flow/user_flow/user_flow_bloc.dart';
import 'package:ringo_media_management/application/user_flow/user_flow/user_flow_state.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_project_summary/components/project_summary_productivity_section.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_project_summary/components/project_summary_search_section.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_project_summary/components/project_summary_statistics.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFlowBloc, UserFlowState>(
      builder: (context, state) {
        return SingleChildScrollView(
          physics: state.projectPageIsLoadingForProjectsStatisticsModel ? const NeverScrollableScrollPhysics() : null,
          child: const Column(
            children: [
              ProjectSummarySearchSection(),
              ProjectSummaryStatistics(),
              ProjectSummaryProductivitySection(),
            ],
          ),
        );
      },
    );
  }
}
