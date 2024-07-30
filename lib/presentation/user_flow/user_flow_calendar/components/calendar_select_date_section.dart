import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:in_date_utils/in_date_utils.dart';
import 'package:intl/intl.dart';
import 'package:ringo_media_management/application/core/theme/theme_bloc.dart';
import 'package:ringo_media_management/application/core/theme/theme_state.dart';
import 'package:ringo_media_management/application/user_flow/user_flow/user_flow_bloc.dart';
import 'package:ringo_media_management/application/user_flow/user_flow/user_flow_event.dart';
import 'package:ringo_media_management/application/user_flow/user_flow/user_flow_state.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/extensions/theme_mode_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';
import 'package:ringo_media_management/presentation/user_flow/components/user_flow_pop_up/calender_selection_pop_up.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_calendar/components/day_card.dart';

class CalendarSelectDateSection extends StatelessWidget {
  const CalendarSelectDateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return BlocBuilder<UserFlowBloc, UserFlowState>(
          builder: (context, state) {
            final daysOfSelectedMoth = DTU.getDaysInMonth(state.selectedDayForCalenderDayModel.year, state.selectedDayForCalenderDayModel.month);
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.w, left: 10.w),
                  child: Row(
                    children: [
                      TextButton(
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          )),
                          onPressed: () async {
                            final DateTime? selectedDate = await showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => CalenderSelectionPopUp(
                                buttonText: 'Select Date',
                                initialDate: state.selectedDayForCalenderDayModel,
                              ),
                            );

                            if (selectedDate != null) {
                              context.read<UserFlowBloc>().add(UserFlowEvent.getCalenderDayModel(
                                    shouldUpdateScrollbar: true,
                                    date: selectedDate,
                                  ));
                            }
                          },
                          child: Row(
                            children: [
                              Text(
                                DateFormat('MMMM yyyy').format(state.selectedDayForCalenderDayModel),
                                style: context.font18w700,
                              ),
                              8.horizontalSpace,
                              SvgPicture.asset(
                                'assets/svgs/arrow_down.svg',
                                width: 16.w,
                                height: 16.w,
                                colorFilter: context.isDarkMode ? ColorFilter.mode(kNeutralColorsDarkMode, BlendMode.srcIn) : null,
                              ),
                            ],
                          )),
                      const Spacer(),
                      IconButton(
                        style: IconButton.styleFrom(
                            minimumSize: Size(32.w, 32.w),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                side: BorderSide(
                                  color: kNeutralColors[200]!,
                                  width: 1.5.sp,
                                ))),
                        onPressed: () {
                          context.read<UserFlowBloc>().add(UserFlowEvent.getCalenderDayModel(
                                shouldUpdateScrollbar: true,
                                date: state.selectedDayForCalenderDayModel.add(const Duration(days: -1)),
                              ));
                        },
                        icon: Center(
                          child: SvgPicture.asset(
                            'assets/svgs/arrow_left.svg',
                            width: 16.w,
                            height: 16.w,
                            colorFilter: context.isDarkMode ? ColorFilter.mode(kNeutralColorsDarkMode, BlendMode.srcIn) : null,
                          ),
                        ),
                      ),
                      IconButton(
                        style: IconButton.styleFrom(
                            minimumSize: Size(32.w, 32.w),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                side: BorderSide(
                                  color: kNeutralColors[200]!,
                                  width: 1.5.sp,
                                ))),
                        onPressed: () {
                          context.read<UserFlowBloc>().add(UserFlowEvent.getCalenderDayModel(
                                shouldUpdateScrollbar: true,
                                date: state.selectedDayForCalenderDayModel.add(const Duration(days: 1)),
                              ));
                        },
                        icon: Center(
                          child: SvgPicture.asset(
                            'assets/svgs/arrow_right.svg',
                            width: 16.w,
                            height: 16.w,
                            colorFilter: context.isDarkMode ? ColorFilter.mode(kNeutralColorsDarkMode, BlendMode.srcIn) : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                24.verticalSpace,
                SizedBox(
                  width: double.infinity,
                  height: 69.h,
                  child: ListView.builder(
                    controller: state.calenderDaysScrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: daysOfSelectedMoth,
                    itemBuilder: (context, index) {
                      final dayDateTime = DateTime(state.selectedDayForCalenderDayModel.year, state.selectedDayForCalenderDayModel.month, index + 1);
                      return Padding(
                        padding: EdgeInsets.only(
                          left: index == 0 ? 20.w : 8.w,
                          right: index == daysOfSelectedMoth - 1 ? 20.w : 0,
                        ),
                        child: DayCard(
                          onPressed: () {
                            context.read<UserFlowBloc>().add(UserFlowEvent.getCalenderDayModel(shouldUpdateScrollbar: true, date: dayDateTime));
                          },
                          dateTime: dayDateTime,
                          selected: DTU.isSameDay(
                            state.selectedDayForCalenderDayModel,
                            dayDateTime,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
