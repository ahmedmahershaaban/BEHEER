import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';
import 'package:ringo_media_management/domain/user_flow/project_model/project_model.dart';
import 'package:ringo_media_management/domain/user_flow/value_objects.dart';
import 'package:ringo_media_management/infrastructure/core/json_serializable_helper.dart';

part 'project_model_dtos.freezed.dart';
part 'project_model_dtos.g.dart';

@freezed
abstract class ProjectModelDto implements _$ProjectModelDto {
  const ProjectModelDto._();

  const factory ProjectModelDto({
    /// The model unique ID.
    required String id,

    /// The model title.
    required String title,

    /// The model description.
    required String description,

    /// The model completeness which is number from 0 to 1 as 0 = 0% and 1 = 100%.
    required double projectCompleteness,

    /// Returns whether the project is completed or not.
    required bool isDone,

    /// The project dead line date time.
    @TimestampConverter() required DateTime deadLine,

    /// The project last update date.
    @TimestampConverter() required DateTime lastUpdate,

    /// The project creation date.
    @TimestampConverter() required DateTime creationDate,
  }) = _projectModelDto;

  /// Responsible to generate [ProjectModelDto] from [ProjectModel].
  factory ProjectModelDto.fromDomain(ProjectModel projectModel) {
    return ProjectModelDto(
      id: projectModel.id.getOrCrash(),
      title: projectModel.title.getOrCrash(),
      description: projectModel.description.getOrCrash(),
      projectCompleteness: projectModel.projectCompleteness.toDouble(),
      isDone: projectModel.isDone,
      deadLine: projectModel.deadLine.getOrCrash(),
      lastUpdate: projectModel.lastUpdate.getOrCrash(),
      creationDate: projectModel.creationDate.getOrCrash(),
    );
  }

  /// Responsible to generate [ProjectModel] from [ProjectModelDto].
  ProjectModel toDomain() {
    return ProjectModel(
      id: UniqueId.fromUniqueString(this.id),
      title: ProjectTitle(title),
      description: ProjectDescription(description),
      projectCompleteness: ValidatedDouble(projectCompleteness.toString()),
      isDone: isDone,
      deadLine: DuoDate(deadLine),
      lastUpdate: DuoDate(lastUpdate),
      creationDate: DuoDate(creationDate),
    );
  }

  /// Responsible to generate `Json` format from [ProjectModelDto].
  factory ProjectModelDto.fromJson(Map<String, dynamic> json) => _$ProjectModelDtoFromJson(json);

  /// Responsible to generate [ProjectModelDto] from [DocumentSnapshot].
  factory ProjectModelDto.fromFireStore(DocumentSnapshot doc) {
    return ProjectModelDto.fromJson(doc.data()! as Map<String, dynamic>).copyWith(id: doc.id);
  }
}
