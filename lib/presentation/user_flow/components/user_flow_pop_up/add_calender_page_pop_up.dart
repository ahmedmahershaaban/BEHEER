import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:ringo_media_management/application/user_flow/user_flow/user_flow_bloc.dart';
import 'package:ringo_media_management/application/user_flow/user_flow/user_flow_event.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';
import 'package:ringo_media_management/domain/user_flow/value_objects.dart';
import 'package:ringo_media_management/presentation/components/default_text_form_field.dart';
import 'package:ringo_media_management/presentation/components/select_color_form.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';
import 'package:ringo_media_management/presentation/user_flow/components/user_flow_pop_up/calender_selection_pop_up.dart';

enum AddCalenderType {
  schedule('Schedule'),
  task('Task');

  const AddCalenderType(this.title);
  final String title;
}

class AddCalenderPagePopUp extends HookWidget {
  const AddCalenderPagePopUp({
    super.key,
    required this.buttonText,
    required this.initialDate,
    required this.onDateChange,
  });
  final String buttonText;
  final DateTime initialDate;
  final Function(DateTime) onDateChange;

  @override
  Widget build(BuildContext context) {
    final addedType = useState(AddCalenderType.schedule);
    final autoValidate = useState(false);
    // TaskModelFields
    final taskTitle = useState(TaskTitle(null));
    final taskIsDone = useState(false);
    final taskDeadLine = useState(DuoDate(initialDate));
    // ScheduleModel Fields
    final scheduleTitle = useState(ScheduleTitle(null));
    final scheduleUrl = useState(OptionWebsite(none()));
    final scheduleColor = useState(ValidatedColor(ValidatedColor.predefinedColors[0]));
    final scheduleStartDate = useState(DuoDate(initialDate));

    onSubmitClicked() {
      autoValidate.value = true;
      if (addedType.value == AddCalenderType.task) {
        if (taskTitle.value.isValid()) {
          context.read<UserFlowBloc>().add(UserFlowEvent.addNewCalenderTaskModel(
                title: taskTitle.value,
                isDone: taskIsDone.value,
                deadLine: taskDeadLine.value,
              ));
          Navigator.of(context).pop();
        }
      } else {
        if (scheduleTitle.value.isValid() && scheduleUrl.value.isValid()) {
          context.read<UserFlowBloc>().add(UserFlowEvent.addNewCalenderScheduleModel(
                title: scheduleTitle.value,
                url: scheduleUrl.value,
                color: scheduleColor.value,
                startDate: scheduleStartDate.value,
              ));
          Navigator.of(context).pop();
        }
      }
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 603.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kNeutralColors[0],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
          ),
          child: Form(
            autovalidateMode: autoValidate.value ? AutovalidateMode.always : AutovalidateMode.disabled,
            child: Column(
              children: [
                14.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            'Add Schedule / Task',
                            style: context.font16w700,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context.router.maybePop(null);
                        },
                        icon: Icon(
                          Icons.close,
                          size: 24.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: kNeutralColors[200],
                ),
                24.verticalSpace,
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Added Type',
                            style: context.font14w600,
                          ),
                          8.verticalSpace,
                          DropdownButton<AddCalenderType>(
                              value: addedType.value,
                              isExpanded: true,
                              items: AddCalenderType.values.map((type) {
                                return DropdownMenuItem<AddCalenderType>(
                                  value: type,
                                  child: Text(
                                    type.title,
                                    style: context.font16w600,
                                  ),
                                );
                              }).toList(),
                              onChanged: (v) {
                                if (v != null) {
                                  addedType.value = v;
                                }
                              }),
                          24.verticalSpace,
                          if (addedType.value case AddCalenderType.task) ...[
                            DefaultTextFormField(
                              initialValue: taskTitle.value.value.fold((_) => null, id),
                              onChanged: (v) {
                                taskTitle.value = TaskTitle(v);
                              },
                              validator: (v) => taskTitle.value.value.fold(
                                (f) => 'Task Title is not valid',
                                (_) => null,
                              ),
                              hintText: 'Enter task title here',
                              labelText: 'Task Title',
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                            ),
                            24.verticalSpace,
                            Row(
                              children: [
                                Text(
                                  'Done',
                                  style: context.font14w600,
                                ),
                                const Spacer(),
                                Checkbox(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  activeColor: kGreenColor,
                                  value: taskIsDone.value,
                                  onChanged: (value) {
                                    taskIsDone.value = !taskIsDone.value;
                                  },
                                ),
                              ],
                            ),
                            12.verticalSpace,
                            Divider(),
                            12.verticalSpace,
                            Row(
                              children: [
                                Text(
                                  'Due Date : ${DateFormat('EEE, d MMM, yyyy').format(taskDeadLine.value.getOrCrash())}',
                                  style: context.font14w600,
                                ),
                                const Spacer(),
                                IconButton(
                                    onPressed: () async {
                                      final DateTime? selectedDateTime = await showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) => CalenderSelectionPopUp(
                                          buttonText: 'Continue',
                                          initialDate: taskDeadLine.value.getOrCrash(),
                                        ),
                                      );
                                      if (selectedDateTime != null) {
                                        taskDeadLine.value = DuoDate(selectedDateTime);
                                        onDateChange(taskDeadLine.value.getOrCrash());
                                      }
                                    },
                                    icon: SvgPicture.asset(
                                      'assets/svgs/calender.svg',
                                      width: 25.w,
                                      height: 25.w,
                                    )),
                              ],
                            ),
                            12.verticalSpace,
                            Divider(),
                            12.verticalSpace,
                            ElevatedButton(
                              onPressed: onSubmitClicked,
                              child: Text(
                                buttonText,
                                style: context.font16w700.copyWith(
                                  color: kNeutralColors[0],
                                ),
                              ),
                            ),
                            24.verticalSpace,
                          ] else ...[
                            DefaultTextFormField(
                              initialValue: scheduleTitle.value.value.fold((_) => null, id),
                              onChanged: (v) {
                                scheduleTitle.value = ScheduleTitle(v);
                              },
                              validator: (v) => scheduleTitle.value.value.fold(
                                (f) => 'Schedule Title is not valid',
                                (_) => null,
                              ),
                              hintText: 'Enter schedule title here',
                              labelText: 'Schedule Title',
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                            ),
                            24.verticalSpace,
                            DefaultTextFormField(
                              initialValue: scheduleUrl.value.value.fold((_) => null, (v) => v.fold(() => null, id)),
                              onChanged: (v) {
                                scheduleUrl.value = OptionWebsite(optionOf(v));
                              },
                              validator: (v) => scheduleUrl.value.value.fold(
                                (f) => 'Url is not valid',
                                (_) => null,
                              ),
                              hintText: 'Enter website url here',
                              labelText: 'Url',
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                            ),
                            24.verticalSpace,
                            Row(
                              children: [
                                Text(
                                  'Start Date : ${DateFormat('EEE, d MMM, yyyy / h:mm a').format(scheduleStartDate.value.getOrCrash())}',
                                  style: context.font14w600,
                                ),
                                const Spacer(),
                                IconButton(
                                    onPressed: () async {
                                      final DateTime? selectedDateTime = await showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) => CalenderSelectionPopUp(
                                          buttonText: 'Continue',
                                          initialDate: scheduleStartDate.value.getOrCrash(),
                                        ),
                                      );
                                      if (selectedDateTime != null) {
                                        final TimeOfDay? selectedTime = await showTimePicker(
                                          context: context,
                                          initialTime: const TimeOfDay(hour: 0, minute: 0),
                                        );
                                        if (selectedTime != null) {
                                          scheduleStartDate.value = DuoDate(
                                            DateTime(selectedDateTime.year, selectedDateTime.month, selectedDateTime.day, selectedTime.hour,
                                                selectedTime.minute),
                                          );
                                          onDateChange(scheduleStartDate.value.getOrCrash());
                                        }
                                      }
                                    },
                                    icon: SvgPicture.asset(
                                      'assets/svgs/clock_light.svg',
                                      width: 25.w,
                                      height: 25.w,
                                    )),
                              ],
                            ),
                            12.verticalSpace,
                            Divider(),
                            12.verticalSpace,
                            SelectColorForm(
                                title: 'Schedule Color',
                                onChangeColor: (color) {
                                  scheduleColor.value = ValidatedColor(color);
                                }),
                            12.verticalSpace,
                            Divider(),
                            12.verticalSpace,
                            ElevatedButton(
                              onPressed: onSubmitClicked,
                              child: Text(
                                buttonText,
                                style: context.font16w700.copyWith(
                                  color: kNeutralColors[0],
                                ),
                              ),
                            ),
                            24.verticalSpace,
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
                12.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
