import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo_media_management/application/core/theme/theme_bloc.dart';
import 'package:ringo_media_management/application/core/theme/theme_state.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/extensions/theme_mode_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';

final List<int> numberOfMembers = [1, 2, 3, 4, 5, 6, 7, 8];

class WorkSpaceCard extends StatelessWidget {
  const WorkSpaceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 15.h,
          ),
          decoration: BoxDecoration(
            color: context.isDarkMode ? kNeutralColorsDarkMode[900] : kNeutralColors[0],
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.w),
                child: SvgPicture.asset(
                  'assets/svgs/work_space.svg',
                  width: 27.w,
                  height: 27.w,
                  colorFilter: context.isDarkMode ? ColorFilter.mode(kNeutralColorsDarkMode, BlendMode.srcIn) : null,
                ),
              ),
              12.horizontalSpace,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Aksantara Digital',
                    style: context.font14w600,
                  ),
                  3.verticalSpace,
                  Text(
                    numberOfMembers.length < 2 ? "${numberOfMembers.length} Member" : "${numberOfMembers.length} Members",
                    style: context.font12w500.copyWith(
                      color: kNeutralColors[500],
                    ),
                  ),
                  5.verticalSpace,
                  Row(
                    children: [1, 2, 3, 4, 5, 6, 7, 8]
                        .map((svgNumber) => Padding(
                              padding: EdgeInsets.only(right: 3.w),
                              child: SvgPicture.asset('assets/svgs/home_team_workspace/$svgNumber.svg'),
                            ))
                        .toList(),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
