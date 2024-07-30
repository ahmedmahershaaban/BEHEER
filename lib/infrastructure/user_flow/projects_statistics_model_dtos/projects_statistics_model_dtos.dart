import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';
import 'package:ringo_media_management/domain/user_flow/projects_statistics_model/projects_statistics_model.dart';
import 'package:ringo_media_management/domain/user_flow/value_objects.dart';
import 'package:ringo_media_management/infrastructure/core/json_serializable_helper.dart';

part 'projects_statistics_model_dtos.freezed.dart';
part 'projects_statistics_model_dtos.g.dart';

@freezed
abstract class ProjectsStatisticsModelDto implements _$ProjectsStatisticsModelDto {
  const ProjectsStatisticsModelDto._();

  const factory ProjectsStatisticsModelDto({
    required String id,
    required Map<dynamic, Map<dynamic, dynamic>>? projectsStatistics,
    @TimestampConverter() required DateTime lastUpdate,
    @TimestampConverter() required DateTime creationDate,
  }) = _projectsStatisticsModelDto;

  factory ProjectsStatisticsModelDto.fromDomain(ProjectsStatisticsModel projectsStatisticsModel) {
    return ProjectsStatisticsModelDto(
      id: projectsStatisticsModel.id.getOrCrash(),
      projectsStatistics: projectsStatisticsModel.projectsStatistics.getOrCrash(),
      lastUpdate: projectsStatisticsModel.lastUpdate.getOrCrash(),
      creationDate: projectsStatisticsModel.creationDate.getOrCrash(),
    );
  }

  ProjectsStatisticsModel toDomain() {
    return ProjectsStatisticsModel(
      id: UniqueId.fromUniqueString(this.id),
      projectsStatistics: AllProjectsStatistics(projectsStatistics),
      lastUpdate: DuoDate(lastUpdate),
      creationDate: DuoDate(creationDate),
    );
  }

  factory ProjectsStatisticsModelDto.fromJson(Map<String, dynamic> json) => _$ProjectsStatisticsModelDtoFromJson(json);

  factory ProjectsStatisticsModelDto.fromFireStore(DocumentSnapshot doc) {
    return ProjectsStatisticsModelDto.fromJson(doc.data()! as Map<String, dynamic>).copyWith(id: doc.id);
  }
}
