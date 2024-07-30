import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ringo_media_management/domain/core/failures.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';
import 'package:ringo_media_management/domain/user_flow/value_objects.dart';

part 'schedule_model.freezed.dart';

@freezed
abstract class ScheduleModel implements _$ScheduleModel {
  const ScheduleModel._();

  const factory ScheduleModel({
    required UniqueId id,
    required ScheduleTitle title,
    required OptionWebsite url,
    required ValidatedColor color,
    required DuoDate startDate,
    required DuoDate lastUpdate,
    required DuoDate creationDate,
  }) = _ScheduleModel;

  factory ScheduleModel.create({
    required ScheduleTitle title,
    required OptionWebsite url,
    required ValidatedColor color,
    required DuoDate startDate,
  }) =>
      ScheduleModel(
        id: UniqueId(),
        title: title,
        url: url,
        color: color,
        startDate: startDate,
        lastUpdate: DuoDate.now(),
        creationDate: DuoDate.now(),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return title.failureOrUnit
        .andThen(startDate.failureOrUnit)
        .andThen(lastUpdate.failureOrUnit)
        .andThen(creationDate.failureOrUnit)
        .andThen(url.failureOrUnit)
        .andThen(color.failureOrUnit)
        .fold(
          (f) => some(f),
          (_) => none(),
        );
  }
}
