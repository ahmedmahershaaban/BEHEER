import 'package:dartz/dartz.dart';
import 'package:ringo_media_management/domain/core/failures.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';
import 'package:ringo_media_management/domain/core/value_validators.dart';

class Name extends ValueObject<String> {
  const Name._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;

  factory Name(String? input) {
    return Name._(
      validateNullValue(input).flatMap(validateStringNotEmpty).flatMap(
            validateSingleLine,
          ),
    );
  }
}

class EmailAddress extends ValueObject<String> {
  const EmailAddress._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String? input) {
    return EmailAddress._(
      validateNullValue(input).flatMap(validateStringNotEmpty).flatMap(
            validateEmailAddress,
          ),
    );
  }
}

class NotificationToken extends ValueObject<Option<String>> {
  const NotificationToken._(this.value);

  @override
  final Either<ValueFailure<Option<String>>, Option<String>> value;

  factory NotificationToken(Option<String> input) {
    return NotificationToken._(input.fold(
      () => right(none()),
      (r) => validateSingleLine(r).flatMap(validateStringNotEmpty).fold(
            (f) => left(ValueFailure.invalidOptionString(failedValue: input)),
            (r) => right(some(r)),
          ),
    ));
  }
}

class PhoneNumber extends ValueObject<Option<String>> {
  const PhoneNumber._(this.value);

  @override
  final Either<ValueFailure<Option<String>>, Option<String>> value;

  factory PhoneNumber(Option<String> input) {
    return PhoneNumber._(input.fold(
        () => right(none()),
        (r) => validateStringNotEmpty(r).fold(
              (f) => right(none()),
              (r) => validateNullValue(r)
                  .flatMap(
                    validatePhoneNumber,
                  )
                  .fold(
                    (f) => left(ValueFailure.invalidPhoneNumber(failedValue: input)),
                    (r) => right(some(r)),
                  ),
            )));
  }
}

class Password extends ValueObject<String> {
  const Password._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String? input) {
    return Password._(
      validateNullValue(input).flatMap(validateStringNotEmpty).flatMap(
            validatePassword,
          ),
    );
  }
}

class Address extends ValueObject<Option<String>> {
  const Address._(this.value);

  @override
  final Either<ValueFailure<Option<String>>, Option<String>> value;

  factory Address(Option<String> input) {
    return Address._(input.fold(
        () => right(none()),
        (r) => validateStringNotEmpty(r).fold(
              (f) => right(none()),
              (r) => validateNullValue(r)
                  .flatMap(
                    validateSingleLine,
                  )
                  .fold(
                    (f) => left(ValueFailure.invalidOptionString(failedValue: input)),
                    (r) => right(some(r)),
                  ),
            )));
  }
}

class Photo extends ValueObject<Option<String>> {
  const Photo._(this.value);

  @override
  final Either<ValueFailure<Option<String>>, Option<String>> value;

  factory Photo(Option<String> input) {
    return Photo._(input.fold(
      () => right(none()),
      (r) => validateStringNotEmpty(r).fold(
          (f) => right(none()),
          (r) => validateSingleLine(r).flatMap(validateUrl).fold(
                (f) => left(ValueFailure.invalidOptionString(failedValue: input)),
                (r) => right(some(r)),
              )),
    ));
  }
}
