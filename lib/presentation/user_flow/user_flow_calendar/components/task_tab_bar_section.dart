import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_media_management/application/auth_flow/auth/auth_bloc.dart';
import 'package:ringo_media_management/application/auth_flow/auth/auth_event.dart';
import 'package:ringo_media_management/application/user_flow/user_flow/user_flow_bloc.dart';
import 'package:ringo_media_management/application/user_flow/user_flow/user_flow_state.dart';
import 'package:ringo_media_management/domain/core/errors.dart';
import 'package:ringo_media_management/infrastructure/core/injection/injection.dart';
import 'package:ringo_media_management/presentation/components/shimmer_loading.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/extensions/theme_mode_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_calendar/components/task_card.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_calendar/components/task_card_error.dart';

class TaskTabBarSection extends StatelessWidget {
  const TaskTabBarSection({super.key});

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
                    itemCount: 10,
                    physics: state.calenderPageIsLoadingForCalenderDayModel ? const NeverScrollableScrollPhysics() : null,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          top: index == 0 ? 24.h : 0,
                          bottom: 9 == index ? 24.h : 0,
                        ),
                        child: ShimmerLoading(
                          isLoading: state.calenderPageIsLoadingForCalenderDayModel,
                          child: TaskCard(
                            isDone: false,
                            onPressed: (value) {},
                            onLongPressed: () {},
                            title: 'Loading',
                            deadLine: DateTime.now(),
                          ),
                        ),
                      );
                    })
                : state.calendarDayModel.fold(
                    () => Center(
                      child: TaskCardError(
                        onErrorTap: _onTaskCardErrorClicked,
                      ),
                    ),
                    (calender) => calender.failureOption.fold(() {
                      return calender.tasks.isEmpty()
                          ? Center(
                              child: Container(
                              margin: EdgeInsets.symmetric(vertical: 8.h),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 16.w),
                                decoration: BoxDecoration(
                                  color: context.isDarkMode ? kNeutralColorsDarkMode[700] : kNeutralColors[0],
                                  borderRadius: BorderRadius.circular(8.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF00000014).withOpacity(0.08),
                                      offset: const Offset(4, 8),
                                      blurRadius: 24,
                                    )
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'There is no tasks added yet',
                                      style: context.font16w500,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    Text(
                                      'Add new task by clicking + icon',
                                      style: context.font12w400.copyWith(
                                        color: context.isDarkMode ? kNeutralColorsDarkMode[0] : kNeutralColors[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                          : ListView.builder(
                              itemCount: calender.tasks.size,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    top: index == 0 ? 24.h : 0,
                                    bottom: calender.tasks.size - 1 == index ? 24.h : 0,
                                  ),
                                  child: ShimmerLoading(
                                    isLoading: state.calenderPageIsLoadingForCalenderDayModel,
                                    child: TaskCard(
                                      isDone: state.calendarDayModel.getOrElse(() => throw UnexpectedNullValueError()).tasks[index].isDone,
                                      onPressed: (value) {},
                                      onLongPressed: () {},
                                      title: state.calendarDayModel.getOrElse(() => throw UnexpectedNullValueError()).tasks[index].title.getOrCrash(),
                                      deadLine:
                                          state.calendarDayModel.getOrElse(() => throw UnexpectedNullValueError()).tasks[index].deadLine.getOrCrash(),
                                    ),
                                  ),
                                );
                              });
                    }, (f) {
                      return Center(
                        child: TaskCardError(
                          onErrorTap: _onTaskCardErrorClicked,
                        ),
                      );
                    }),
                  ));
      },
    );
  }

  void _onTaskCardErrorClicked() {
    getIt<AuthBloc>().add(AuthEvent.sendEmailForSupport(msg: "There was a problem happened wit the calender page task section ID"));
  }
}
