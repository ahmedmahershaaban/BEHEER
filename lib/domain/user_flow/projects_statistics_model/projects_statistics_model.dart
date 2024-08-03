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
    /// The model unique ID.
    ///
    /// Contains `Either<ValueFailure<String> , String>`.
    required UniqueId id,

    /// All projects statistics should be added here for analysis purposes and easy display.
    ///
    /// Contains `Either<ValueFailure<Map<UniqueId, Map<String, ValidatedDouble>>>, Map<UniqueId, Map<String, ValidatedDouble>>>`.
    ///
    /// Which means the valid data will be 'Map<String, Map<String, ValidatedDouble>>`.
    /// In the first map the `key` will represent the `UniqueId` for the project
    /// The `value` will be a `map<String,ValidatedDouble>` which will contains specific keys that represent
    /// statistics for the project.
    ///
    /// A [ValueFailure] maybe returned with the following failures:
    /// [ValueFailure.nullValue].
    /// [ValueFailure.unexpectedConversionError].
    required AllProjectsStatistics projectsStatistics,

    /// The model last update date.
    ///
    /// Contains `Either<ValueFailure<DateTime> , DateTime>`.
    required DuoDate lastUpdate,

    /// The model creation date.
    ///
    /// Contains `Either<ValueFailure<DateTime> , DateTime>`.
    required DuoDate creationDate,
  }) = _ProjectsStatisticsModel;

  /// Return empty [ProjectsStatisticsModel].
  ///
  /// Easy creation of empty [ProjectsStatisticsModel] with no data inside [projectsStatistics]
  /// and creating the [id] to be `UniqueId.fromUniqueString('ProjectsStatisticsDocument')` as fixed document.
  factory ProjectsStatisticsModel.createEmpty() => ProjectsStatisticsModel(
        id: UniqueId.fromUniqueString('ProjectsStatisticsDocument'),
        projectsStatistics: AllProjectsStatistics(const {}),
        lastUpdate: DuoDate.now(),
        creationDate: DuoDate.now(),
      );

  /// Validate the data inside the [ProjectsStatisticsModel].
  ///
  /// return `none()` for valid data, and return `ValueFailure<T>` if the data is not valid!
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
