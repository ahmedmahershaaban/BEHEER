import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';
import 'package:ringo_media_management/domain/user_flow/task_model/task_model.dart';
import 'package:ringo_media_management/domain/user_flow/value_objects.dart';
import 'package:ringo_media_management/infrastructure/core/json_serializable_helper.dart';

part 'task_model_dtos.freezed.dart';
part 'task_model_dtos.g.dart';

@freezed
abstract class TaskModelDto implements _$TaskModelDto {
  const TaskModelDto._();

  const factory TaskModelDto({
    required String id,
    required String title,
    required bool isDone,
    @TimestampConverter() required DateTime deadLine,
    @TimestampConverter() required DateTime lastUpdate,
    @TimestampConverter() required DateTime creationDate,
  }) = _taskModelDto;

  factory TaskModelDto.fromDomain(TaskModel taskModel) {
    return TaskModelDto(
      id: taskModel.id.getOrCrash(),
      title: taskModel.title.getOrCrash(),
      isDone: taskModel.isDone,
      deadLine: taskModel.deadLine.getOrCrash(),
      lastUpdate: taskModel.lastUpdate.getOrCrash(),
      creationDate: taskModel.creationDate.getOrCrash(),
    );
  }

  TaskModel toDomain() {
    return TaskModel(
      id: UniqueId.fromUniqueString(this.id),
      title: TaskTitle(title),
      isDone: isDone,
      deadLine: DuoDate(deadLine),
      lastUpdate: DuoDate(lastUpdate),
      creationDate: DuoDate(creationDate),
    );
  }

  factory TaskModelDto.fromJson(Map<String, dynamic> json) => _$TaskModelDtoFromJson(json);

  factory TaskModelDto.fromFireStore(DocumentSnapshot doc) {
    return TaskModelDto.fromJson(doc.data()! as Map<String, dynamic>).copyWith(id: doc.id);
  }
}
