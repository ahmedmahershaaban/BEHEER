import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ringo_media_management/domain/core/failures.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';
import 'package:ringo_media_management/domain/user_flow/value_objects.dart';

part 'task_model.freezed.dart';

@freezed
abstract class TaskModel implements _$TaskModel {
  const TaskModel._();

  const factory TaskModel({
    required UniqueId id,
    required TaskTitle title,
    required bool isDone,
    required DuoDate deadLine,
    required DuoDate lastUpdate,
    required DuoDate creationDate,
  }) = _TaskModel;

  factory TaskModel.create({
    required TaskTitle title,
    required bool isDone,
    required DuoDate deadLine,
  }) =>
      TaskModel(
        id: UniqueId(),
        title: title,
        isDone: isDone,
        deadLine: deadLine,
        lastUpdate: DuoDate.now(),
        creationDate: DuoDate.now(),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return title.failureOrUnit
        .andThen(deadLine.failureOrUnit)
        .andThen(lastUpdate.failureOrUnit)
        .andThen(
          creationDate.failureOrUnit,
        )
        .fold(
          (f) => some(f),
          (_) => none(),
        );
  }
}
