import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:ringo_media_management/domain/core/failures.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';
import 'package:ringo_media_management/domain/user_flow/schedule_model/schedule_model.dart';
import 'package:ringo_media_management/domain/user_flow/task_model/task_model.dart';

part 'calender_day_model.freezed.dart';

@freezed
abstract class CalenderDayModel implements _$CalenderDayModel {
  const CalenderDayModel._();

  const factory CalenderDayModel({
    required UniqueId id,
    required KtList<ScheduleModel> schedules,
    required KtList<TaskModel> tasks,
    required DuoDate lastUpdate,
    required DuoDate creationDate,
  }) = _CalenderDayModel;

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

  factory CalenderDayModel.empty() => CalenderDayModel(
        id: UniqueId.dateTimeStringFormat(),
        schedules: const KtList.empty(),
        tasks: const KtList.empty(),
        lastUpdate: DuoDate.now(),
        creationDate: DuoDate.now(),
      );

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
