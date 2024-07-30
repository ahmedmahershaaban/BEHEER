import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ringo_media_management/domain/core/failures.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';
import 'package:ringo_media_management/domain/user_flow/value_objects.dart';

part 'project_model.freezed.dart';

@freezed
abstract class ProjectModel implements _$ProjectModel {
  const ProjectModel._();

  const factory ProjectModel({
    required UniqueId id,
    required ProjectTitle title,
    required ProjectDescription description,
    required ValidatedDouble projectCompleteness,
    required bool isDone,
    required DuoDate deadLine,
    required DuoDate lastUpdate,
    required DuoDate creationDate,
  }) = _ProjectModel;

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
