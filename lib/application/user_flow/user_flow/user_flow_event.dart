import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';
import 'package:ringo_media_management/domain/user_flow/schedule_model/schedule_model.dart';
import 'package:ringo_media_management/domain/user_flow/task_model/task_model.dart';
import 'package:ringo_media_management/domain/user_flow/value_objects.dart';

part 'user_flow_event.freezed.dart';

/// This File will be documented in the next steps, covering both the `Presentation Layer` and `Application Layer`.
/// The `Domain Layer` and `Infrastructure Layer` have already been documented.
@freezed
abstract class UserFlowEvent with _$UserFlowEvent {
  // General Events
  const factory UserFlowEvent.normalUpdateForStateWithNoChange() = NormalUpdateForStateWithNoChange;
  const factory UserFlowEvent.loadAllNeededDataForUserFlow() = LoadAllNeededDataForUserFlow;

  // Home Page

  // Project Summary Page
  const factory UserFlowEvent.searchForProjects(String? valueStr) = SearchForProjects;
  const factory UserFlowEvent.getAllProjects() = GetAllProjects;
  const factory UserFlowEvent.addNewProjectModel({
    required ProjectTitle title,
    required ProjectDescription description,
    required ValidatedDouble projectCompleteness,
    required bool isDone,
    required DuoDate deadLine,
  }) = AddNewProjectModel;

  // Calender Page
  const factory UserFlowEvent.getCalenderDayModel({
    required DateTime date,
    required bool shouldUpdateScrollbar,
  }) = GetCalenderDayModel;
  const factory UserFlowEvent.calenderDaysScrollControllerJumpToDay({
    required int dayNumber,
  }) = CalenderDaysScrollControllerJumpToDay;
  const factory UserFlowEvent.addNewCalenderTaskModel({
    required TaskTitle title,
    required bool isDone,
    required DuoDate deadLine,
  }) = AddNewCalenderTaskModel;
  const factory UserFlowEvent.addNewCalenderScheduleModel({
    required ScheduleTitle title,
    required OptionWebsite url,
    required ValidatedColor color,
    required DuoDate startDate,
  }) = AddNewCalenderScheduleModel;
  const factory UserFlowEvent.addNewCalenderDayModel({
    required List<ScheduleModel> scheduleList,
    required List<TaskModel> taskList,
  }) = AddNewCalenderDayModel;
  const factory UserFlowEvent.updateCalenderDayModel({
    required List<ScheduleModel> scheduleList,
    required List<TaskModel> taskList,
  }) = UpdateCalenderDayModel;
  // Profile Page

  const factory UserFlowEvent.updateUserProfile() = UpdateUserProfile;
  const factory UserFlowEvent.profileInputsChanged({
    String? nameStr,
    String? emailStr,
    String? addressStr,
    String? webSiteStr,
    String? phoneNumberStr,
  }) = ProfileInputsChanged;
}
