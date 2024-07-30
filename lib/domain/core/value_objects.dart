import 'dart:math';

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

  /// Throws [UnexpectedValueFailure] containing the [ValueFailure]
  T getOrCrash() {
    // id = identity - same as writing (right)=> right
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

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

class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory UniqueId() {
    return UniqueId._(
      right(const Uuid().v1()),
    );
  }

  factory UniqueId.fromUniqueString(String uniqueId) {
    return UniqueId._(
      right(uniqueId),
    );
  }

  factory UniqueId.dateTimeStringFormat() {
    var formatter = DateFormat('yyyy-MM-dd');
    return UniqueId._(
      right(formatter.format(DateTime.now())),
    );
  }

  factory UniqueId.fromDateTime(DateTime dateTime) {
    var formatter = DateFormat('yyyy-MM-dd');
    return UniqueId._(
      right(formatter.format(dateTime)),
    );
  }

  const UniqueId._(this.value);
}

class UniqueShortCode extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory UniqueShortCode() {
    const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final rnd = Random();
    const lengthOfGeneratedCode = 6;
    String getRandomString(int length) => String.fromCharCodes(
          Iterable.generate(
            length,
            (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
          ),
        );
    return UniqueShortCode._(
      right(getRandomString(lengthOfGeneratedCode)),
    );
  }

  factory UniqueShortCode.fromUniqueString(String uniqueShortCode) {
    return UniqueShortCode._(
      right(uniqueShortCode),
    );
  }

  const UniqueShortCode._(this.value);
}

class ValidatedColor extends ValueObject<Color> {
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

class ValidatedInt extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ValidatedInt(String? input) {
    return ValidatedInt._(
      validateNullValue(input).flatMap(validateStringNotEmpty).flatMap(validateInt),
    );
  }
  const ValidatedInt._(this.value);

  int toInt() {
    return value.fold(
      (f) => throw UnexpectedValueError(f),
      (v) => int.parse(v),
    );
  }
}

class ValidatedDouble extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ValidatedDouble(String? input) {
    return ValidatedDouble._(
      validateNullValue(input).flatMap(validateStringNotEmpty).flatMap(validateDouble),
    );
  }
  const ValidatedDouble._(this.value);

  double toDouble() {
    return value.fold(
      (f) => throw UnexpectedValueError(f),
      (v) => double.parse(v),
    );
  }
}

class DuoDate extends ValueObject<DateTime> {
  @override
  final Either<ValueFailure<DateTime>, DateTime> value;

  factory DuoDate(DateTime input) {
    return DuoDate._(right(input));
  }
  const DuoDate._(this.value);

  factory DuoDate.now() => DuoDate(DateTime.now());

  String hoursWithZeroMinutes() {
    return DateFormat('hh.00').format(value.getOrElse(() => throw UnexpectedNullValueError()));
  }
}

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
