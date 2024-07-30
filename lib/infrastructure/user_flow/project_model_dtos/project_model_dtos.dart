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
    required String id,
    required String title,
    required String description,
    required double projectCompleteness,
    required bool isDone,
    @TimestampConverter() required DateTime deadLine,
    @TimestampConverter() required DateTime lastUpdate,
    @TimestampConverter() required DateTime creationDate,
  }) = _projectModelDto;

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

  factory ProjectModelDto.fromJson(Map<String, dynamic> json) => _$ProjectModelDtoFromJson(json);

  factory ProjectModelDto.fromFireStore(DocumentSnapshot doc) {
    return ProjectModelDto.fromJson(doc.data()! as Map<String, dynamic>).copyWith(id: doc.id);
  }
}
