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
    /// The model unique ID.
    ///
    /// Contains `Either<ValueFailure<String> , String>`.
    required UniqueId id,

    /// The schedule title.
    ///
    /// Contains `Either<ValueFailure<String> , String>`.
    ///
    ///
    /// A [ValueFailure] maybe returned with the following failures:
    /// [ValueFailure.nullValue].
    /// [ValueFailure.empty].
    /// [ValueFailure.multiline].
    required ScheduleTitle title,

    /// The schedule url which may contains google meeting or zoom meeting or external link.
    ///
    /// Contains `Either<ValueFailure<Option<String>> , Option<String>>`.
    ///
    ///
    /// A [ValueFailure] maybe returned with the following failures:
    /// [ValueFailure.empty].
    /// [ValueFailure.multiline].
    /// [ValueFailure.invalidUrl].
    /// [ValueFailure.invalidOptionString].
    required OptionWebsite url,

    /// The schedule card color.
    ///
    /// Contains `Either<ValueFailure<Color> , Color>`.
    ///
    ///
    /// A [ValueFailure] maybe returned with the following failures:
    /// [ValueFailure.invalidColorLength].
    required ValidatedColor color,

    /// The schedule starting date, for now iam considering the meeting is 1 hour long
    /// as for this project but later it could be updated in the logic.
    ///
    /// Contains `Either<ValueFailure<DateTime> , DateTime>`.
    required DuoDate startDate,

    /// The schedule last update date.
    ///
    /// Contains `Either<ValueFailure<DateTime> , DateTime>`.
    required DuoDate lastUpdate,

    /// The schedule creation date.
    ///
    /// Contains `Either<ValueFailure<DateTime> , DateTime>`.
    required DuoDate creationDate,
  }) = _ScheduleModel;

  /// Return [ScheduleModel].
  ///
  /// Easy creation for [ScheduleModel] with only passing [title] and [url] and [color] and [startDate].
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

  /// Validate the data inside the [ScheduleModel].
  ///
  /// return `none()` for valid data, and return `ValueFailure<T>` if the data is not valid!
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
