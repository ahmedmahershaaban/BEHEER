import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_calendar/components/calendar_schedule_and_task_section.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_calendar/components/calendar_select_date_section.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        24.verticalSpace,
        const CalendarSelectDateSection(),
        24.verticalSpace,
        const Expanded(
          child: CalendarScheduleAndTaskSection(),
        ),
      ],
    );
  }
}
