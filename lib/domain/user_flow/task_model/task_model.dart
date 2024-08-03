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
    /// The model unique ID.
    ///
    /// Contains `Either<ValueFailure<String> , String>`.
    required UniqueId id,

    /// The task title.
    ///
    /// Contains `Either<ValueFailure<String> , String>`.
    ///
    ///
    /// A [ValueFailure] maybe returned with the following failures:
    /// [ValueFailure.nullValue].
    /// [ValueFailure.empty].
    /// [ValueFailure.multiline].
    required TaskTitle title,

    /// Returns whether the task is done or not.
    ///
    /// By default this property will be 'false'.
    required bool isDone,

    /// The task dead line date.
    ///
    /// Contains `Either<ValueFailure<DateTime> , DateTime>`.
    required DuoDate deadLine,

    /// The task last update date.
    ///
    /// Contains `Either<ValueFailure<DateTime> , DateTime>`.
    required DuoDate lastUpdate,

    /// The task creation date.
    ///
    /// Contains `Either<ValueFailure<DateTime> , DateTime>`.
    required DuoDate creationDate,
  }) = _TaskModel;

  /// Return [TaskModel].
  ///
  /// Easy creation for [TaskModel] with only passing [title] and [isDone] and [deadLine].
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

  /// Validate the data inside the [TaskModel].
  ///
  /// return `none()` for valid data, and return `ValueFailure<T>` if the data is not valid!
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
