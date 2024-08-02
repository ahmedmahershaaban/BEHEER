import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ringo_media_management/domain/auth_flow/value_objects.dart';
import 'package:ringo_media_management/domain/core/failures.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';

part 'user_model.freezed.dart';

/// A User Model Account.
@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    /// The user's unique ID.
    ///
    /// Contains only `String` Or `ValueFailure<String>`.
    required UniqueId id,

    /// The user's full name.
    ///
    /// Contains only `String` or `ValueFailure<String>`.
    ///
    ///
    /// A [ValueFailure] maybe returned with the following failures:
    /// [ValueFailure.nullValue].
    /// [ValueFailure.empty].
    /// [ValueFailure.multiline].
    required Name name,

    /// The user's email address.
    ///
    /// Contains only `String` or `ValueFailure<String>`.
    ///
    ///
    /// A [ValueFailure] maybe returned with the following failures:
    /// [ValueFailure.nullValue].
    /// [ValueFailure.empty].
    /// [ValueFailure.invalidEmail].
    required EmailAddress emailAddress,

    /// The user's local address where he lives.
    ///
    /// Contains `Option<String>` which means `String?`  or `ValueFailure<String>`.
    /// This property will have value of `none()` if the user has not update his profile.
    ///
    ///
    /// A [ValueFailure] maybe returned with the following failures:
    /// [ValueFailure.empty].
    /// [ValueFailure.nullValue].
    /// [ValueFailure.multiline].
    /// [ValueFailure.invalidOptionString].
    required Address address,

    /// The user's phone number.
    ///
    /// Contains `Option<String>` which means `String?`  or `ValueFailure<String>`.
    ///
    ///
    /// A [ValueFailure] maybe returned with the following failures:
    /// [ValueFailure.empty].
    /// [ValueFailure.nullValue].
    /// [ValueFailure.invalidPhoneNumber].
    required PhoneNumber phoneNumber,

    /// The user's website url.
    ///
    /// Contains `Option<String>` which means `String?`  or `ValueFailure<String>`.
    /// This property will have value of `none()` if the user has not update his profile.
    ///
    ///
    /// A [ValueFailure] maybe returned with the following failures:
    /// [ValueFailure.empty].
    /// [ValueFailure.multiline].
    /// [ValueFailure.invalidUrl].
    required OptionWebsite website,

    /// The user's personal photo
    ///
    /// Contains `Option<String>` which means `String?`  or `ValueFailure<String>`
    /// This property will have value of `none()` if the user has not update his profile.
    ///
    ///
    /// A [ValueFailure] maybe returned with the following failures:
    /// [ValueFailure.empty].
    /// [ValueFailure.multiline].
    /// [ValueFailure.invalidUrl].
    required Photo photo,

    /// The user's notification token
    ///
    /// Contains `Option<String>` which means `String?`  or `ValueFailure<String>`.
    /// This property will have value of `none()` if the user has not update his profile.
    ///
    /// A [ValueFailure] maybe returned with the following failures:
    /// [ValueFailure.multiline].
    /// [ValueFailure.empty].
    /// [ValueFailure.invalidOptionString].
    required NotificationToken notificationToken,

    /// Returns whether the user is admin or not.
    ///
    /// By default this property will be 'false'.
    @Default(false) bool admin,

    /// Returns whether the user is blocked or not.
    ///
    /// By default this property will be 'false'.
    @Default(false) bool isBlocked,

    /// The user's account last update date
    ///
    /// Contains only `DateTime` or `ValueFailure<DateTime>`.
    required DuoDate lastUpdate,

    /// The user's account creation date
    ///
    /// Contains only `DateTime` or `ValueFailure<DateTime>`.
    required DuoDate creationDate,
  }) = _UserModel;

  /// Validate the data inside the [UserModel].
  ///
  /// return `none()` for valid data, and return `ValueFailure<T>` if the data is not valid!
  Option<ValueFailure<dynamic>> get failureOption {
    return emailAddress.failureOrUnit
        .andThen(name.failureOrUnit)
        .andThen(address.failureOrUnit)
        .andThen(phoneNumber.failureOrUnit)
        .andThen(website.failureOrUnit)
        .andThen(notificationToken.failureOrUnit)
        .andThen(photo.failureOrUnit)
        .andThen(lastUpdate.failureOrUnit)
        .andThen(
          creationDate.failureOrUnit,
        )
        .fold(
          (f) => some(f),
          (_) => none(),
        );
  }

  /// Returns the user first name
  ///
  /// By splitting [name] property by `" "` and getting the first element of the array
  String get firstName {
    return name.getOrCrash().split(" ")[0];
  }

  /// Return the user last name
  ///
  /// By splitting [name] property by `" "` and getting the last element of the array
  ///
  /// If [name] has only one word, the last name will be empty string `''`
  String get lastName {
    String lastNameHolder = '';
    try {
      lastNameHolder = name.getOrCrash().split(" ")[1];
    } catch (e) {
      lastNameHolder = '';
    }
    return lastNameHolder;
  }
}
