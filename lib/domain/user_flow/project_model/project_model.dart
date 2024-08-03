import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ringo_media_management/domain/core/failures.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';
import 'package:ringo_media_management/domain/user_flow/value_objects.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_project_summary/user_flow_project_summary_page.dart';

part 'project_model.freezed.dart';

/// A Project Model.
///
/// The main purpose of this model is to keep tract for all the
/// projects the user is creating or joining.
///
/// most of the use for this model will be in the [UserFlowProjectSummaryPage].
@freezed
abstract class ProjectModel implements _$ProjectModel {
  const ProjectModel._();

  const factory ProjectModel({
    /// The model unique ID.
    ///
    /// Contains `Either<ValueFailure<String> , String>`.
    required UniqueId id,

    /// The model title.
    ///
    /// Contains `Either<ValueFailure<String>, String>`.
    ///
    ///
    /// A [ValueFailure] maybe returned with the following failures:
    /// [ValueFailure.nullValue].
    /// [ValueFailure.empty].
    /// [ValueFailure.multiline].
    required ProjectTitle title,

    /// The model description.
    ///
    /// Contains `Either<ValueFailure<String>, String>`.
    ///
    /// A [ValueFailure] maybe returned with the following failures:
    /// [ValueFailure.nullValue].
    /// [ValueFailure.empty].
    required ProjectDescription description,

    /// The model completeness which is number from 0 to 1 as 0 = 0% and 1 = 100%.
    ///
    /// Contains `Either<ValueFailure<String>, String>`.
    ///
    /// A [ValueFailure] maybe returned with the following failures:
    /// [ValueFailure.nullValue].
    /// [ValueFailure.empty].
    /// [ValueFailure.invalidNumber].
    ///
    /// An [UnexpectedValueError] maybe thrown for the following seniors:
    /// 1- the [toDouble] function is called while the value inside the [ValidatedDouble] is [ValueFailure].
    required ValidatedDouble projectCompleteness,

    /// Returns whether the project is completed or not.
    ///
    /// By default this property will be 'false'.
    required bool isDone,

    /// The project dead line date time.
    ///
    /// Contains `Either<ValueFailure<DateTime> , DateTime>`.
    required DuoDate deadLine,

    /// The project last update date.
    ///
    /// Contains `Either<ValueFailure<DateTime> , DateTime>`.
    required DuoDate lastUpdate,

    /// The project creation date.
    ///
    /// Contains `Either<ValueFailure<DateTime> , DateTime>`.
    required DuoDate creationDate,
  }) = _ProjectModel;

  /// Return [ProjectModel].
  ///
  /// Easy creation for [ProjectModel] with only passing [title] and [description]
  /// and [projectCompleteness] and [deadLine].
  factory ProjectModel.create({
    required ProjectTitle title,
    required ProjectDescription description,
    required ValidatedDouble projectCompleteness,
    required DuoDate deadLine,
  }) =>
      ProjectModel(
        id: UniqueId(),
        title: title,
        description: description,
        projectCompleteness: projectCompleteness,
        isDone: false,
        deadLine: deadLine,
        lastUpdate: DuoDate.now(),
        creationDate: DuoDate.now(),
      );

  /// Validate the data inside the [ProjectModel].
  ///
  /// return `none()` for valid data, and return `ValueFailure<T>` if the data is not valid!
  Option<ValueFailure<dynamic>> get failureOption {
    return title.failureOrUnit
        .andThen(description.failureOrUnit)
        .andThen(projectCompleteness.failureOrUnit)
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
