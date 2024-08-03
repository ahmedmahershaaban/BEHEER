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

/// [ValueObject] that represent the `String` in the valid format for email address.
///
/// Uses [validateNullValue] and [validateStringNotEmpty] and [validateEmailAddress]
/// to valid the input type `String` for email address.
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.nullValue].
/// [ValueFailure.empty].
/// [ValueFailure.invalidEmail].
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

/// [ValueObject] that represent the `Option<String>` in the valid form.
///
/// Uses [validateSingleLine] and [validateStringNotEmpty] and [Option.fold]
/// to valid the input type `Option<String>`.
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.multiline].
/// [ValueFailure.empty].
/// [ValueFailure.invalidOptionString].
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

/// [ValueObject] that represent the `Option<String>` in the valid form.
///
/// Uses [validateStringNotEmpty] and [validateNullValue] and [validatePhoneNumber] and [Option.fold]
/// to valid the input type `Option<String>`.
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.empty].
/// [ValueFailure.nullValue].
/// [ValueFailure.invalidPhoneNumber].
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

/// [ValueObject] that represent the `String` in the valid format for password.
///
/// Uses [validateNullValue] and [validateStringNotEmpty] and [validatePassword]
/// to valid the input type `String` for password.
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.nullValue].
/// [ValueFailure.empty].
/// [ValueFailure.invalidPassword].
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

/// [ValueObject] that represent the `Option<String>` in the valid form.
///
/// Uses [validateStringNotEmpty] and [validateNullValue] and [validateSingleLine] and [Option.fold]
/// to valid the input type `Option<String>`.
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.empty].
/// [ValueFailure.nullValue].
/// [ValueFailure.multiline].
/// [ValueFailure.invalidOptionString].
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

/// [ValueObject] that represent the `Option<String>` in the valid form.
///
/// Uses [validateStringNotEmpty] and [validateSingleLine] and [validateUrl] and [Option.fold]
/// to valid the input type `Option<String>`.
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.empty].
/// [ValueFailure.multiline].
/// [ValueFailure.invalidUrl].
/// [ValueFailure.invalidOptionString].
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
