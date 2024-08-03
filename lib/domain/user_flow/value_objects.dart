import 'package:dartz/dartz.dart';
import 'package:ringo_media_management/domain/core/failures.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';
import 'package:ringo_media_management/domain/core/value_validators.dart';

/// [ValueObject] that represent the `String` in the valid form.
///
/// Uses [validateNullValue] and [validateStringNotEmpty] and [validateSingleLine]
/// to valid the input type `String`.
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.nullValue].
/// [ValueFailure.empty].
/// [ValueFailure.multiline].
class TaskTitle extends ValueObject<String> {
  const TaskTitle._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;

  factory TaskTitle(String? input) {
    return TaskTitle._(
      validateNullValue(input).flatMap(validateStringNotEmpty).flatMap(
            validateSingleLine,
          ),
    );
  }
}

/// [ValueObject] that represent the `String` in the valid form.
///
/// Uses [validateNullValue] and [validateStringNotEmpty] and [validateSingleLine]
/// to valid the input type `String`.
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.nullValue].
/// [ValueFailure.empty].
/// [ValueFailure.multiline].
class ScheduleTitle extends ValueObject<String> {
  const ScheduleTitle._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;

  factory ScheduleTitle(String? input) {
    return ScheduleTitle._(
      validateNullValue(input).flatMap(validateStringNotEmpty).flatMap(
            validateSingleLine,
          ),
    );
  }
}

/// [ValueObject] that represent the `String` in the valid form.
///
/// Uses [validateNullValue] and [validateStringNotEmpty] and [validateSingleLine]
/// to valid the input type `String`.
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.nullValue].
/// [ValueFailure.empty].
/// [ValueFailure.multiline].
class ProjectTitle extends ValueObject<String> {
  const ProjectTitle._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;

  factory ProjectTitle(String? input) {
    return ProjectTitle._(
      validateNullValue(input).flatMap(validateStringNotEmpty).flatMap(
            validateSingleLine,
          ),
    );
  }
}

/// [ValueObject] that represent the `String` in the valid form.
///
/// Uses [validateNullValue] and [validateStringNotEmpty]
/// to valid the input type `String`.
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.nullValue].
/// [ValueFailure.empty].
class ProjectDescription extends ValueObject<String> {
  const ProjectDescription._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;

  factory ProjectDescription(String? input) {
    return ProjectDescription._(
      validateNullValue(input).flatMap(validateStringNotEmpty),
    );
  }
}

/// [ValueObject] that represent the `Map<String, Map<String, ValidatedDouble>>` in the valid form.
///
/// Uses [validateNullValue]
/// to valid the input type `Map<String, Map<String, ValidatedDouble>>`.
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.nullValue].
/// [ValueFailure.unexpectedConversionError].
class AllProjectsStatistics extends ValueObject<Map<UniqueId, Map<String, ValidatedDouble>>> {
  const AllProjectsStatistics._(this.value);

  @override
  final Either<ValueFailure<Map<UniqueId, Map<String, ValidatedDouble>>>, Map<UniqueId, Map<String, ValidatedDouble>>> value;

  factory AllProjectsStatistics(Map<dynamic, Map<dynamic, dynamic>>? input) {
    if (input == null) {
      return AllProjectsStatistics._(left(const ValueFailure.nullValue()));
    } else {
      try {
        if (input.isEmpty) {
          return AllProjectsStatistics._(right({}));
        } else {
          final newInput = input as Map<String, Map<String, String>>;
          try {
            final outPutAfterConversion = newInput.map((key, value) {
              return MapEntry(UniqueId.fromUniqueString(key), value.map((key2, value2) {
                return MapEntry(key2, ValidatedDouble(value2));
              }));
            });
            return AllProjectsStatistics._(right(outPutAfterConversion));
          } catch (e) {
            return AllProjectsStatistics._(left(
              const ValueFailure.unexpectedConversionError(),
            ));
          }
        }
      } catch (e) {
        return AllProjectsStatistics._(left(const ValueFailure.nullValue()));
      }
    }
  }
}
