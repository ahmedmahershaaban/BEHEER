import 'package:ringo_media_management/domain/core/failures.dart';

class NotAuthenticatedError extends Error {}

class UnexpectedNullValueError extends Error {}

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;
  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explanation = 'Encountered a ValueFailure at an unrecoverable point. Terminating';
    return Error.safeToString('$explanation Failure was: $valueFailure');
  }
}
