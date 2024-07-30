import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo_media_management/application/user_flow/user_flow/user_flow_bloc.dart';
import 'package:ringo_media_management/application/user_flow/user_flow/user_flow_event.dart';
import 'package:ringo_media_management/application/user_flow/user_flow/user_flow_state.dart';
import 'package:ringo_media_management/presentation/components/default_text_form_field.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/extensions/theme_mode_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFlowBloc, UserFlowState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              autovalidateMode: state.profilePageAutoValidateForm ? AutovalidateMode.always : AutovalidateMode.disabled,
              child: Column(
                children: [
                  24.verticalSpace,
                  Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/menu/profile1.svg',
                          width: 65.w,
                          height: 65.w,
                        ),
                        Positioned(
                            top: 35.w,
                            left: 35.w,
                            child: IconButton.filled(
                              constraints: BoxConstraints(maxHeight: 25.w, maxWidth: 25.w),
                              style: IconButton.styleFrom(
                                backgroundColor: kNeutralColors,
                                foregroundColor: kNeutralColors[0],
                                hoverColor: kNeutralColors[0],
                                focusColor: kNeutralColors[0],
                              ),
                              onPressed: () {},
                              icon: Center(
                                child: RotatedBox(
                                  quarterTurns: 135,
                                  child: Icon(
                                    Icons.edit,
                                    color: kNeutralColors[0],
                                    size: 10.sp,
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  12.verticalSpace,
                  DefaultTextFormField(
                    initialValue: state.name.value.fold((_) => null, id),
                    onChanged: (v) => context.read<UserFlowBloc>().add(UserFlowEvent.profileInputsChanged(nameStr: v)),
                    validator: (v) => state.name.failureOrUnit.fold((f) => 'Name is not valid', (_) => null),
                    hintText: 'Enter name here',
                    labelText: 'Name',
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  24.verticalSpace,
                  DefaultTextFormField(
                    initialValue: state.emailAddress.value.fold((_) => null, id),
                    onChanged: (v) => context.read<UserFlowBloc>().add(UserFlowEvent.profileInputsChanged(emailStr: v)),
                    validator: (v) => state.emailAddress.failureOrUnit.fold((f) => 'Email is not valid', (_) => null),
                    hintText: 'Enter email here',
                    labelText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  24.verticalSpace,
                  DefaultTextFormField(
                    initialValue: state.address.value.fold((_) => null, (v) => v.fold(() => null, id)),
                    onChanged: (v) => context.read<UserFlowBloc>().add(UserFlowEvent.profileInputsChanged(addressStr: v)),
                    validator: (v) => state.address.failureOrUnit.fold((f) => 'Address is not valid', (_) => null),
                    hintText: 'Enter address here',
                    labelText: 'Address',
                    keyboardType: TextInputType.streetAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  24.verticalSpace,
                  DefaultTextFormField(
                    initialValue: state.website.value.fold((_) => null, (v) => v.fold(() => null, id)),
                    onChanged: (v) => context.read<UserFlowBloc>().add(UserFlowEvent.profileInputsChanged(webSiteStr: v)),
                    validator: (v) => state.website.failureOrUnit.fold((f) => 'Website is not valid', (_) => null),
                    hintText: 'Enter website here',
                    labelText: 'Website',
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.next,
                  ),
                  24.verticalSpace,
                  DefaultTextFormField(
                    initialValue: state.phoneNumber.value.fold((_) => null, (v) => v.fold(() => null, id)),
                    onChanged: (v) => context.read<UserFlowBloc>().add(UserFlowEvent.profileInputsChanged(phoneNumberStr: v)),
                    validator: (v) => state.phoneNumber.failureOrUnit.fold((f) => 'Phone Number is not valid', (_) => null),
                    hintText: 'Enter phone number here',
                    labelText: 'Phone Number',
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.send,
                    onFieldSubmitted: (v) => context.read<UserFlowBloc>().add(const UserFlowEvent.updateUserProfile()),
                  ),
                  24.verticalSpace,
                  ElevatedButton(
                    style: context.isDarkMode
                        ? ElevatedButton.styleFrom(
                            foregroundColor: context.isDarkMode ? kNeutralColorsDarkMode[0] : kNeutralColors,
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              side: BorderSide(color: context.isDarkMode ? kNeutralColorsDarkMode : kNeutralColors),
                            ))
                        : null,
                    onPressed: () {
                      context.read<UserFlowBloc>().add(const UserFlowEvent.updateUserProfile());
                    },
                    child: Text(
                      'Update Profile',
                      style: context.font16w700.copyWith(
                        color: kNeutralColors[0],
                      ),
                    ),
                  ),
                  if (state.profilePageIsSubmitting) const LinearProgressIndicator(),
                  24.verticalSpace,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
