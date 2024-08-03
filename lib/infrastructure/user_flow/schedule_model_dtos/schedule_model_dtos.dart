import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';
import 'package:ringo_media_management/domain/user_flow/schedule_model/schedule_model.dart';
import 'package:ringo_media_management/domain/user_flow/value_objects.dart';
import 'package:ringo_media_management/infrastructure/core/json_serializable_helper.dart';

part 'schedule_model_dtos.freezed.dart';
part 'schedule_model_dtos.g.dart';

@freezed
abstract class ScheduleModelDto implements _$ScheduleModelDto {
  const ScheduleModelDto._();

  const factory ScheduleModelDto({
    /// The model unique ID.
    required String id,

    /// The schedule title.
    required String title,

    /// The schedule url which may contains google meeting or zoom meeting or external link.
    required String? url,

    /// The schedule card color.
    required int color,

    /// The schedule starting date, for now iam considering the meeting is 1 hour long
    /// as for this project but later it could be updated in the logic.
    @TimestampConverter() required DateTime startDate,

    /// The schedule last update date.
    @TimestampConverter() required DateTime lastUpdate,

    /// The schedule creation date.
    @TimestampConverter() required DateTime creationDate,
  }) = _scheduleModelDto;

  /// Responsible to generate [ScheduleModelDto] from [ScheduleModel].
  factory ScheduleModelDto.fromDomain(ScheduleModel scheduleModel) {
    return ScheduleModelDto(
      id: scheduleModel.id.getOrCrash(),
      title: scheduleModel.title.getOrCrash(),
      url: scheduleModel.url.getOrCrash().fold(() => null, id),
      color: scheduleModel.color.getOrCrash().value,
      startDate: scheduleModel.startDate.getOrCrash(),
      lastUpdate: scheduleModel.lastUpdate.getOrCrash(),
      creationDate: scheduleModel.creationDate.getOrCrash(),
    );
  }

  /// Responsible to generate [ScheduleModel] from [ScheduleModelDto].
  ScheduleModel toDomain() {
    return ScheduleModel(
      id: UniqueId.fromUniqueString(this.id),
      title: ScheduleTitle(title),
      url: OptionWebsite(optionOf(url)),
      color: ValidatedColor(Color(color)),
      startDate: DuoDate(startDate),
      lastUpdate: DuoDate(lastUpdate),
      creationDate: DuoDate(creationDate),
    );
  }

  /// Responsible to generate `Json` format from [ScheduleModelDto].
  factory ScheduleModelDto.fromJson(Map<String, dynamic> json) => _$ScheduleModelDtoFromJson(json);

  /// Responsible to generate [ScheduleModelDto] from [DocumentSnapshot].
  factory ScheduleModelDto.fromFireStore(DocumentSnapshot doc) {
    return ScheduleModelDto.fromJson(doc.data()! as Map<String, dynamic>).copyWith(id: doc.id);
  }
}
