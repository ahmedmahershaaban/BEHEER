import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:ringo_media_management/domain/core/failures.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';
import 'package:ringo_media_management/domain/user_flow/schedule_model/schedule_model.dart';
import 'package:ringo_media_management/domain/user_flow/task_model/task_model.dart';

part 'calender_day_model.freezed.dart';

/// A Calender Day Model.
///
/// The main purpose of this model is to keep tract for all the
/// [TaskModel]s and [ScheduleModel]s in the each day.
///
/// most of the use for this model will be in the [UserFlowCalenderPage].
@freezed
abstract class CalenderDayModel implements _$CalenderDayModel {
  const CalenderDayModel._();

  const factory CalenderDayModel({
    /// The model unique ID.
    ///
    /// Contains `Either<ValueFailure<String> , String>`.
    required UniqueId id,

    /// The user's schedules he made for this day.
    ///
    /// Contains `KtList<ScheduleModel>`.
    required KtList<ScheduleModel> schedules,

    /// The user's tasks he made for this day.
    ///
    /// Contains `KtList<TaskModel>`.
    required KtList<TaskModel> tasks,

    /// The calender day last update date.
    ///
    /// Contains `Either<ValueFailure<DateTime> , DateTime>`.
    required DuoDate lastUpdate,

    /// The calender day creation date.
    ///
    /// Contains `Either<ValueFailure<DateTime> , DateTime>`.
    required DuoDate creationDate,
  }) = _CalenderDayModel;

  /// Return [CalenderDayModel].
  ///
  /// Easy creation for [CalenderDayModel] with only passing [schedules] and [tasks].
  factory CalenderDayModel.create({
    required KtList<ScheduleModel> schedules,
    required KtList<TaskModel> tasks,
  }) =>
      CalenderDayModel(
        id: UniqueId.dateTimeStringFormat(),
        schedules: schedules,
        tasks: tasks,
        lastUpdate: DuoDate.now(),
        creationDate: DuoDate.now(),
      );

  /// Return empty [CalenderDayModel].
  ///
  /// Easy creation of empty [CalenderDayModel] with no data inside [schedules] and [tasks].
  factory CalenderDayModel.empty() => CalenderDayModel(
        id: UniqueId.dateTimeStringFormat(),
        schedules: const KtList.empty(),
        tasks: const KtList.empty(),
        lastUpdate: DuoDate.now(),
        creationDate: DuoDate.now(),
      );

  /// Validate the data inside the [CalenderDayModel].
  ///
  /// return `none()` for valid data, and return `ValueFailure<T>` if the data is not valid!
  Option<ValueFailure<dynamic>> get failureOption {
    return creationDate.failureOrUnit
        .andThen(
          schedules
              // Getting the failureOption from the ScheduleModel ENTITY - NOT a failureOrUnit from a VALUE OBJECT
              .map((scheduleItem) => scheduleItem.failureOption)
              .filter((o) => o.isSome())
              // If we can't get the 0th element, the list is empty. In such a case, it's valid.
              .getOrElse(0, (_) => none())
              .fold(() => right(unit), (f) => left(f)),
        )
        .andThen(
          tasks
              // Getting the failureOption from the TaskModel ENTITY - NOT a failureOrUnit from a VALUE OBJECT
              .map((taskItem) => taskItem.failureOption)
              .filter((o) => o.isSome())
              // If we can't get the 0th element, the list is empty. In such a case, it's valid.
              .getOrElse(0, (_) => none())
              .fold(() => right(unit), (f) => left(f)),
        )
        .andThen(lastUpdate.failureOrUnit)
        .fold(
          (f) => some(f),
          (_) => none(),
        );
  }
}
