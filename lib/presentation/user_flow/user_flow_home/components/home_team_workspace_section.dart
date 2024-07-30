import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_media_management/application/user_flow/user_flow/user_flow_bloc.dart';
import 'package:ringo_media_management/application/user_flow/user_flow/user_flow_state.dart';
import 'package:ringo_media_management/presentation/components/shimmer_loading.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_home/components/work_space_card.dart';

class HomeTeamWorkspaceSection extends StatelessWidget {
  const HomeTeamWorkspaceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFlowBloc, UserFlowState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Team Workspace',
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
              10.verticalSpace,
              ShimmerLoading(isLoading: state.homePageIsLoadingWorkSpaceSection, child: const WorkSpaceCard()),
            ],
          ),
        );
      },
    );
  }
}
