import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';
import 'package:ringo_media_management/domain/user_flow/calender_day_model/calender_day_model.dart';
import 'package:ringo_media_management/infrastructure/core/json_serializable_helper.dart';
import 'package:ringo_media_management/infrastructure/user_flow/schedule_model_dtos/schedule_model_dtos.dart';
import 'package:ringo_media_management/infrastructure/user_flow/task_model_dtos/task_model_dtos.dart';

part 'calender_day_model_dtos.freezed.dart';
part 'calender_day_model_dtos.g.dart';

@freezed
abstract class CalenderDayModelDto implements _$CalenderDayModelDto {
  const CalenderDayModelDto._();

  const factory CalenderDayModelDto({
    /// The model unique ID.
    required String id,

    /// The user's schedules he made for this day.
    required List<ScheduleModelDto> schedules,

    /// The user's tasks he made for this day.
    required List<TaskModelDto> tasks,

    /// The calender day last update date.
    @TimestampConverter() required DateTime lastUpdate,

    /// The calender day creation date.
    @TimestampConverter() required DateTime creationDate,
  }) = _calenderDayModelDto;

  /// Responsible to generate [CalenderDayModelDto] from [CalenderDayModel].
  factory CalenderDayModelDto.fromDomain(CalenderDayModel calenderDayModel) {
    return CalenderDayModelDto(
      id: calenderDayModel.id.getOrCrash(),
      schedules: calenderDayModel.schedules.asList().map((v) => ScheduleModelDto.fromDomain(v)).toList(),
      tasks: calenderDayModel.tasks.asList().map((v) => TaskModelDto.fromDomain(v)).toList(),
      lastUpdate: calenderDayModel.lastUpdate.getOrCrash(),
      creationDate: calenderDayModel.creationDate.getOrCrash(),
    );
  }

  /// Responsible to generate [CalenderDayModel] from [CalenderDayModelDto].
  CalenderDayModel toDomain() {
    return CalenderDayModel(
      id: UniqueId.fromUniqueString(this.id),
      schedules: schedules.map((v) => v.toDomain()).toImmutableList(),
      tasks: tasks.map((v) => v.toDomain()).toImmutableList(),
      lastUpdate: DuoDate(creationDate),
      creationDate: DuoDate(creationDate),
    );
  }

  /// Responsible to generate `Json` format from [CalenderDayModelDto].
  factory CalenderDayModelDto.fromJson(Map<String, dynamic> json) => _$CalenderDayModelDtoFromJson(json);

  /// Responsible to generate [CalenderDayModelDto] from [DocumentSnapshot].
  factory CalenderDayModelDto.fromFireStore(DocumentSnapshot doc) {
    return CalenderDayModelDto.fromJson(doc.data()! as Map<String, dynamic>).copyWith(id: doc.id);
  }
}
