import 'package:dartz/dartz.dart';
import 'package:ringo_media_management/domain/core/failures.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';
import 'package:ringo_media_management/domain/core/value_validators.dart';

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

class AllProjectsStatistics extends ValueObject<Map<int, Map<String, ValidatedDouble>>> {
  const AllProjectsStatistics._(this.value);

  @override
  final Either<ValueFailure<Map<int, Map<String, ValidatedDouble>>>, Map<int, Map<String, ValidatedDouble>>> value;

  factory AllProjectsStatistics(Map<dynamic, Map<dynamic, dynamic>>? input) {
    if (input == null) {
      return AllProjectsStatistics._(left(const ValueFailure.nullValue()));
    } else {
      try {
        if (input.isEmpty) {
          return AllProjectsStatistics._(right({}));
        } else {
          final newInput = input as Map<int, Map<String, String>>;
          final outPutAfterConversion = newInput.map((key, value) {
            return MapEntry(key, value.map((key2, value2) => MapEntry(key2, ValidatedDouble(value2))));
          });
          return AllProjectsStatistics._(right(outPutAfterConversion));
        }
      } catch (e) {
        return AllProjectsStatistics._(left(const ValueFailure.nullValue()));
      }
    }
  }
}
