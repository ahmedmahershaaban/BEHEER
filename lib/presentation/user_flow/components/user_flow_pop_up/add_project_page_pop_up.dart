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
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';
import 'package:ringo_media_management/presentation/user_flow/components/user_flow_pop_up/calender_selection_pop_up.dart';

class AddProjectPagePopUp extends HookWidget {
  const AddProjectPagePopUp({
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
    final autoValidate = useState(false);

    final projectTitle = useState(ProjectTitle(null));
    final projectDescription = useState(ProjectDescription(null));
    final projectProjectCompleteness = useState(ValidatedDouble(null));
    final projectIsDone = useState(false);
    final projectDeadLine = useState(DuoDate(initialDate));
    onSubmitClicked() {
      autoValidate.value = true;

      if (projectTitle.value.isValid() && projectDescription.value.isValid() && projectProjectCompleteness.value.isValid()) {
        context.read<UserFlowBloc>().add(UserFlowEvent.addNewProjectModel(
              title: projectTitle.value,
              description: projectDescription.value,
              projectCompleteness: projectProjectCompleteness.value,
              isDone: projectIsDone.value,
              deadLine: projectDeadLine.value,
            ));
        Navigator.of(context).pop();
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
                            'Add Project',
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
                          DefaultTextFormField(
                            initialValue: projectTitle.value.value.fold((_) => null, id),
                            onChanged: (v) {
                              projectTitle.value = ProjectTitle(v);
                            },
                            validator: (v) => projectTitle.value.value.fold(
                              (f) => 'Project Title is not valid',
                              (_) => null,
                            ),
                            hintText: 'Enter project title here',
                            labelText: 'Project Title',
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                          ),
                          24.verticalSpace,
                          DefaultTextFormField(
                            initialValue: projectDescription.value.value.fold((_) => null, id),
                            onChanged: (v) {
                              projectDescription.value = ProjectDescription(v);
                            },
                            validator: (v) => projectDescription.value.value.fold(
                              (f) => 'Project Description is not valid',
                              (_) => null,
                            ),
                            hintText: 'Enter project description here',
                            labelText: 'Project Description',
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                          ),
                          24.verticalSpace,
                          DefaultTextFormField(
                            initialValue: projectProjectCompleteness.value.value.fold((_) => null, id),
                            onChanged: (v) {
                              projectProjectCompleteness.value = ValidatedDouble(v);
                            },
                            validator: (v) => projectProjectCompleteness.value.value.fold(
                              (f) => 'Project Completeness is not valid',
                              (_) => null,
                            ),
                            hintText: 'Enter project completeness here',
                            labelText: 'Project Completeness',
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
                                value: projectIsDone.value,
                                onChanged: (value) {
                                  projectIsDone.value = !projectIsDone.value;
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
                                'Due Date : ${DateFormat('EEE, d MMM, yyyy').format(projectDeadLine.value.getOrCrash())}',
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
                                        initialDate: projectDeadLine.value.getOrCrash(),
                                      ),
                                    );
                                    if (selectedDateTime != null) {
                                      projectDeadLine.value = DuoDate(selectedDateTime);
                                      onDateChange(projectDeadLine.value.getOrCrash());
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
