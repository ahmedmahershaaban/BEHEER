import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ringo_media_management/domain/core/errors.dart';
import 'package:ringo_media_management/domain/core/failures.dart';
import 'package:ringo_media_management/domain/core/value_transformers.dart';
import 'package:ringo_media_management/domain/core/value_validators.dart';
import 'package:uuid/uuid.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();

  Either<ValueFailure<T>, T> get value;

  /// Throws [UnexpectedValueFailure] containing the [ValueFailure].
  T getOrCrash() {
    // id = identity - same as writing (right)=> right
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  /// Return `Unit` if there is no error in the [ValueObject]
  /// else return [ValueFailure].
  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (f) => left(f),
      (r) => right(unit),
    );
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
  @override
  String toString() => 'Value($value)';
}

/// [ValueObject] that represent the ID .
///
/// should always contains `String` in it's value as it will be generated from
/// a string by [UniqueId.fromUniqueString] or create from automatically by
/// [Uuid] package when calling [UniqueId].
///
/// ```dart
///  final id = UniqueId();
///  final id2 = UniqueId.fromUniqueString(id);
///
///  print(id == id2) // true
/// ```
class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory UniqueId() {
    return UniqueId._(
      right(const Uuid().v1()),
    );
  }

  /// generate [UniqueId] from any `String`.
  factory UniqueId.fromUniqueString(String uniqueId) {
    return UniqueId._(
      right(uniqueId),
    );
  }

  /// generate [UniqueId] from `DateTime.now()` in form of string as `yyy-MM-dd`.
  ///
  /// ```dart
  /// final id = UniqueId.dateTimeStringFormat();
  ///
  /// print(id); // 2024-06-12
  /// ```
  factory UniqueId.dateTimeStringFormat() {
    var formatter = DateFormat('yyyy-MM-dd');
    return UniqueId._(
      right(formatter.format(DateTime.now())),
    );
  }

  /// generate [UniqueId] from input of `DateTime`.
  factory UniqueId.fromDateTime(DateTime dateTime) {
    var formatter = DateFormat('yyyy-MM-dd');
    return UniqueId._(
      right(formatter.format(dateTime)),
    );
  }

  const UniqueId._(this.value);
}

/// [ValueObject] that represent the `Color` in the valid form.
///
/// Uses [validateColorLength] to valid the length of the input.
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.invalidColorLength].
class ValidatedColor extends ValueObject<Color> {
  /// Some pre defined colors to be used with in the app.
  static const List<Color> predefinedColors = [
    Color(0xFFF54562),
    Color(0xFFFEAA67),
    Color(0xFF45BE91),
    Color(0xFF663ED4),
    Color(0xFF2838A4),
    Color(0xFF4AB8C3),
    Color(0xFFEA4C89),
    Color(0XFF09213B),
    Color(0XFFF45D4F),
    Color(0XFF63CFF5),
    Color(0XFF6376EF),
    Color(0XFF0283FF),
    Color(0XFF596386),
    Color(0XFFA2A7B8),
  ];

  @override
  final Either<ValueFailure<Color>, Color> value;

  factory ValidatedColor(Color input) {
    return ValidatedColor._(
      validateColorLength(input).andThen(right(makeColorOpaque(input))),
    );
  }

  const ValidatedColor._(this.value);
}

/// [ValueObject] that represent the `int` in the valid form.
///
/// Uses [validateNullValue] and [validateStringNotEmpty] and [validateInt]
/// to valid the input type `int`.
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.nullValue].
/// [ValueFailure.empty].
/// [ValueFailure.invalidNumber].
///
/// An [UnexpectedValueError] maybe thrown for the following seniors:
/// 1- the [toInt] function is called while the value inside the [ValidatedInt] is [ValueFailure].
class ValidatedInt extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ValidatedInt(String? input) {
    return ValidatedInt._(
      validateNullValue(input).flatMap(validateStringNotEmpty).flatMap(validateInt),
    );
  }
  const ValidatedInt._(this.value);

  /// Return the value of [ValueObject] in `int` format
  ///
  /// This function is like [getOrCrash] where it will throw [Error] not [ValueFailure].
  /// Throws [UnexpectedValueFailure] containing the [ValueFailure].
  int toInt() {
    return value.fold(
      (f) => throw UnexpectedValueError(f),
      (v) => int.parse(v),
    );
  }
}

/// [ValueObject] that represent the `double` in the valid form.
///
/// Uses [validateNullValue] and [validateStringNotEmpty] and [validateInt]
/// to valid the input type `double`.
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.nullValue].
/// [ValueFailure.empty].
/// [ValueFailure.invalidNumber].
///
/// An [UnexpectedValueError] maybe thrown for the following seniors:
/// 1- the [toDouble] function is called while the value inside the [ValidatedDouble] is [ValueFailure].
class ValidatedDouble extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ValidatedDouble(String? input) {
    return ValidatedDouble._(
      validateNullValue(input).flatMap(validateStringNotEmpty).flatMap(validateDouble),
    );
  }
  const ValidatedDouble._(this.value);

  /// Return the value of [ValueObject] in `double` format
  ///
  /// This function is like [getOrCrash] where it will throw [Error] not [ValueFailure].
  /// Throws [UnexpectedValueFailure] containing the [ValueFailure].
  double toDouble() {
    return value.fold(
      (f) => throw UnexpectedValueError(f),
      (v) => double.parse(v),
    );
  }
}

/// [ValueObject] that represent the `DateTime` in the valid form.
///
/// This value must always be `right()` side.
///
/// An [UnexpectedValueError] maybe thrown for the following seniors:
/// 1- the [hoursWithZeroMinutes] function is called while the value inside the [DuoDate] is [ValueFailure].
class DuoDate extends ValueObject<DateTime> {
  @override
  final Either<ValueFailure<DateTime>, DateTime> value;

  factory DuoDate(DateTime input) {
    return DuoDate._(right(input));
  }
  const DuoDate._(this.value);

  factory DuoDate.now() => DuoDate(DateTime.now());

  /// Return the value of [ValueObject] in `String` format
  ///
  /// This function is like [getOrCrash] where it will throw [Error] not [ValueFailure].
  /// Throws [UnexpectedValueFailure] containing the [ValueFailure].
  String hoursWithZeroMinutes() {
    return DateFormat('hh.00').format(value.fold(
      (f) => throw UnexpectedValueError(f),
      id,
    ));
  }
}

/// [ValueObject] that represent the `Option<String>` in the valid form.
///
/// Uses [validateStringNotEmpty] and [validateSingleLine] and [validateUrl]
/// to valid the input type `double`.
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.empty].
/// [ValueFailure.multiline].
/// [ValueFailure.invalidUrl].
/// [ValueFailure.invalidOptionString].
class OptionWebsite extends ValueObject<Option<String>> {
  const OptionWebsite._(this.value);

  @override
  final Either<ValueFailure<Option<String>>, Option<String>> value;

  factory OptionWebsite(Option<String> input) {
    return OptionWebsite._(input.fold(
        () => right(none()),
        (r) => validateStringNotEmpty(r).fold(
              (f) => right(none()),
              (r) => validateSingleLine(r).flatMap(validateUrl).fold(
                    (f) => left(ValueFailure.invalidOptionString(failedValue: input)),
                    (r) => right(some(r)),
                  ),
            )));
  }
}
