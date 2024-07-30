import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kt_dart/collection.dart';
import 'package:kt_dart/kt.dart';
import 'package:ringo_media_management/application/auth_flow/auth/auth_bloc.dart';
import 'package:ringo_media_management/application/auth_flow/auth/auth_event.dart';
import 'package:ringo_media_management/application/user_flow/user_flow/user_flow_bloc.dart';
import 'package:ringo_media_management/application/user_flow/user_flow/user_flow_state.dart';
import 'package:ringo_media_management/domain/user_flow/calender_day_model/calender_day_model.dart';
import 'package:ringo_media_management/infrastructure/core/injection/injection.dart';
import 'package:ringo_media_management/presentation/components/shimmer_loading.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/extensions/theme_mode_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_calendar/components/schedule_small_card.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_calendar/components/schedule_small_card_error.dart';

const numberOfHoursInTheDay = 24;

class ScheduleTabBarSection extends StatelessWidget {
  const ScheduleTabBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFlowBloc, UserFlowState>(
      builder: (context, state) {
        return Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            decoration: BoxDecoration(
              color: context.isDarkMode ? kNeutralColorsDarkMode[900] : kNeutralColors[0],
            ),
            child: state.calenderPageIsLoadingForCalenderDayModel
                ? ListView.builder(
                    itemCount: numberOfHoursInTheDay,
                    physics: state.calenderPageIsLoadingForCalenderDayModel ? const NeverScrollableScrollPhysics() : null,
                    itemBuilder: (context, index) {
                      final hoursText = '${index < 10 ? '0$index' : index}.00';
                      return Padding(
                        padding: EdgeInsets.only(
                          top: index == 0 ? 24.h : 0,
                          bottom: 23 == index ? 24.h : 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 40.w,
                                child: Text(
                                  hoursText,
                                  style: context.font12w500,
                                )),
                            9.horizontalSpace,
                            Expanded(
                              child: Container(
                                  height: 64.h,
                                  margin: EdgeInsets.symmetric(vertical: 8.h),
                                  padding: EdgeInsets.only(left: 16.w),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(color: kNeutralColors[200]!),
                                    ),
                                  ),
                                  child: ShimmerLoading(
                                    isLoading: state.calenderPageIsLoadingForCalenderDayModel,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: state.calenderPageIsLoadingForCalenderDayModel ? Colors.grey : kNeutralColors[0],
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      width: double.infinity,
                                      height: 64.h,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      );
                    })
                : state.calendarDayModel.fold(() {
                    return Center(child: ScheduleSmallCardError(onErrorTap: _onScheduleSmallCardErrorClicked));
                  }, (CalenderDayModel calenderDay) {
                    return calenderDay.failureOption.fold(() {
                      return ListView.builder(
                          itemCount: numberOfHoursInTheDay,
                          itemBuilder: (context, index) {
                            final hoursText = '${index < 10 ? '0$index' : index}.00';
                            bool widgetIsEmpty = true;
                            final widgetsList = calenderDay.schedules.map((schedules) {
                              if (hoursText == schedules.startDate.hoursWithZeroMinutes()) {
                                widgetIsEmpty = false;
                                return InkWell(
                                  onTap: () {},
                                  child: ScheduleSmallCard(
                                    isLoading: false,
                                    title: schedules.title.getOrCrash(),
                                    color: schedules.color.getOrCrash(),
                                    startDate: schedules.startDate.getOrCrash(),
                                    endDate: schedules.startDate.getOrCrash().add(const Duration(hours: 1)),
                                  ),
                                );
                              } else {
                                return const SizedBox();
                              }
                            }).asList();
                            return Padding(
                              padding: EdgeInsets.only(
                                top: index == 0 ? 24.h : 0,
                                bottom: 23 == index ? 24.h : 0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: 40.w,
                                      child: Text(
                                        hoursText,
                                        style: context.font12w500,
                                      )),
                                  9.horizontalSpace,
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 8.h),
                                      padding: EdgeInsets.only(left: 16.w),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          top: BorderSide(color: kNeutralColors[200]!),
                                        ),
                                      ),
                                      child: widgetIsEmpty
                                          ? SizedBox(
                                              width: double.infinity,
                                              height: 64.h,
                                            )
                                          : Column(
                                              children: widgetsList,
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    }, (failure) {
                      return Center(child: ScheduleSmallCardError(onErrorTap: _onScheduleSmallCardErrorClicked));
                    });
                  }));
      },
    );
  }

  void _onScheduleSmallCardErrorClicked() {
    getIt<AuthBloc>().add(AuthEvent.sendEmailForSupport(msg: "There was a problem happened wit the calender page task section ID"));
  }
}
