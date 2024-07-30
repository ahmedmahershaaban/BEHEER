import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ringo_media_management/domain/auth_flow/value_objects.dart';
import 'package:ringo_media_management/domain/core/failures.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';

part 'user_model.freezed.dart';

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required UniqueId id,
    required Name name,
    required EmailAddress emailAddress,
    required Address address,
    required PhoneNumber phoneNumber,
    required OptionWebsite website,
    required Photo photo,
    required NotificationToken notificationToken,
    @Default(false) bool admin,
    @Default(false) bool isBlocked,
    required DuoDate lastUpdate,
    required DuoDate creationDate,
  }) = _UserModel;

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

  String get firstName {
    return name.getOrCrash().split(" ")[0];
  }

  String get lastName {
    return name.getOrCrash().split(" ")[1];
  }
}
