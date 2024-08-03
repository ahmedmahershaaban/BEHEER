import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:ringo_media_management/domain/auth_flow/value_objects.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';
import 'package:ringo_media_management/domain/user_flow/calender_day_model/calender_day_model.dart';
import 'package:ringo_media_management/domain/user_flow/project_model/project_model.dart';
import 'package:ringo_media_management/domain/user_flow/user_flow_failure/user_flow_failure.dart';

part 'user_flow_state.freezed.dart';

/// For the User Bloc state management
/// We Could work it into [Two] Ways
/// 1- By creating individual [Bloc] s  for each page
/// 2- If there is no big logic we could combine all the logic into 1 [Bloc]
/// I will use here the second case By using Only 1 [Bloc]

/// This File will be documented in the next steps, covering both the `Presentation Layer` and `Application Layer`.
/// The `Domain Layer` and `Infrastructure Layer` have already been documented.
@freezed
abstract class UserFlowState with _$UserFlowState {
  const factory UserFlowState({
    // For Home page
    required bool homePageIsLoadingWorkSpaceSection,
    required bool homePageIsLoadingWorkTodaySchedule,
    // for Project Summary Page
    required KtList<ProjectModel> projectsModelFromSearchResult,
    required KtList<ProjectModel> allProjectsModel,
    required bool projectPageIsLoadingForProjectsSearch,
    required bool projectPageIsLoadingForAllProjectsSection,
    required bool projectPageIsLoadingForProjectsStatisticsModel,
    // For Calender Page
    required DateTime selectedDayForCalenderDayModel,
    required Option<CalenderDayModel> calendarDayModel,
    required bool calenderPageIsLoadingForCalenderDayModel,
    required ScrollController calenderDaysScrollController,
    // For Profile Page
    required bool profilePageIsSubmitting,
    required bool profilePageAutoValidateForm,
    required Name name,
    required EmailAddress emailAddress,
    required Address address,
    required OptionWebsite website,
    required PhoneNumber phoneNumber,
    // Global Properties
    required Option<Either<UserFlowFailure, Option<String>>> userFlowFailureOrSuccessOption,
  }) = _userFlowState;

  factory UserFlowState.initial() => UserFlowState(
        // For Home page
        homePageIsLoadingWorkSpaceSection: true,
        homePageIsLoadingWorkTodaySchedule: true,
        // for Project Summary Page
        projectsModelFromSearchResult: const KtList.empty(),
        allProjectsModel: const KtList.empty(),
        projectPageIsLoadingForProjectsSearch: false,
        projectPageIsLoadingForAllProjectsSection: false,
        projectPageIsLoadingForProjectsStatisticsModel: true,
        // For Calender Page
        selectedDayForCalenderDayModel: DateTime.now(),
        calendarDayModel: none(),
        calenderDaysScrollController: ScrollController(initialScrollOffset: DateTime.now().day * 48.w),
        calenderPageIsLoadingForCalenderDayModel: true,
        // For Profile Page
        profilePageIsSubmitting: false,
        profilePageAutoValidateForm: false,
        name: Name(null),
        emailAddress: EmailAddress(null),
        address: Address(none()),
        website: OptionWebsite(none()),
        phoneNumber: PhoneNumber(none()),
        // Global Properties
        userFlowFailureOrSuccessOption: none(),
      );
}
