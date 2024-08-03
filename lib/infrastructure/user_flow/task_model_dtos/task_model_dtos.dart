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
    /// The model unique ID.
    required String id,

    /// The task title.
    required String title,

    /// Returns whether the task is done or not.
    required bool isDone,

    /// The task dead line date.
    @TimestampConverter() required DateTime deadLine,

    /// The task last update date.
    @TimestampConverter() required DateTime lastUpdate,

    /// The task creation date.
    @TimestampConverter() required DateTime creationDate,
  }) = _taskModelDto;

  /// Responsible to generate [TaskModelDto] from [TaskModel].
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

  /// Responsible to generate [TaskModel] from [TaskModelDto].
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

  /// Responsible to generate `Json` format from [TaskModelDto].
  factory TaskModelDto.fromJson(Map<String, dynamic> json) => _$TaskModelDtoFromJson(json);

  /// Responsible to generate [TaskModelDto] from [DocumentSnapshot].
  factory TaskModelDto.fromFireStore(DocumentSnapshot doc) {
    return TaskModelDto.fromJson(doc.data()! as Map<String, dynamic>).copyWith(id: doc.id);
  }
}
