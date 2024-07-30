import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_media_management/application/core/theme/theme_bloc.dart';
import 'package:ringo_media_management/application/core/theme/theme_state.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/extensions/theme_mode_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_calendar/components/schedule_tab_bar_section.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_calendar/components/task_tab_bar_section.dart';

class CalendarScheduleAndTaskSection extends StatefulWidget {
  const CalendarScheduleAndTaskSection({super.key});

  @override
  State<CalendarScheduleAndTaskSection> createState() => _CalendarScheduleAndTaskSectionState();
}

class _CalendarScheduleAndTaskSectionState extends State<CalendarScheduleAndTaskSection> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 1.5.sp,
                indicatorColor: context.isDarkMode ? kNeutralColorsDarkMode : kNeutralColors,
                dividerColor: Colors.transparent,
                onTap: (index) {
                  setState(() {});
                },
                tabs: [
                  Tab(
                    icon: Text(
                      'Schedule',
                      style: context.font18w700.copyWith(
                        color: _tabController.index == 0
                            ? context.isDarkMode
                                ? kNeutralColorsDarkMode
                                : kNeutralColors
                            : context.isDarkMode
                                ? kNeutralColorsDarkMode[400]
                                : kNeutralColors[500],
                      ),
                    ),
                  ),
                  Tab(
                    icon: Text(
                      'Task',
                      style: context.font18w700.copyWith(
                        color: _tabController.index == 1
                            ? context.isDarkMode
                                ? kNeutralColorsDarkMode
                                : kNeutralColors
                            : context.isDarkMode
                                ? kNeutralColorsDarkMode[400]
                                : kNeutralColors[500],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ScheduleTabBarSection(),
                  TaskTabBarSection(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
