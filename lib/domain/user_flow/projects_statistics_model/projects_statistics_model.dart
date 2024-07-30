import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ringo_media_management/domain/core/failures.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';
import 'package:ringo_media_management/domain/user_flow/value_objects.dart';

part 'projects_statistics_model.freezed.dart';

@freezed
abstract class ProjectsStatisticsModel implements _$ProjectsStatisticsModel {
  const ProjectsStatisticsModel._();

  const factory ProjectsStatisticsModel({
    required UniqueId id,
    required AllProjectsStatistics projectsStatistics,
    required DuoDate lastUpdate,
    required DuoDate creationDate,
  }) = _ProjectsStatisticsModel;

  factory ProjectsStatisticsModel.createEmpty() => ProjectsStatisticsModel(
        id: UniqueId.fromUniqueString('ProjectsStatisticsDocument'),
        projectsStatistics: AllProjectsStatistics(const {}),
        lastUpdate: DuoDate.now(),
        creationDate: DuoDate.now(),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return lastUpdate.failureOrUnit
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
