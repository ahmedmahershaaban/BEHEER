import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ringo_media_management/domain/auth_flow/user_model/user_model.dart';
import 'package:ringo_media_management/domain/auth_flow/value_objects.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';
import 'package:ringo_media_management/infrastructure/core/json_serializable_helper.dart';

part 'user_model_dtos.freezed.dart';
part 'user_model_dtos.g.dart';

@freezed
abstract class UserModelDto implements _$UserModelDto {
  const UserModelDto._();

  const factory UserModelDto({
    /// The user's unique ID.
    required String id,

    /// The user's full name.
    required String name,

    /// The user's email address.
    required String emailAddress,

    /// The user's local address where he lives.
    required String? address,

    /// The user's phone number.
    required String? phoneNumber,

    /// The user's website url.
    required String? website,

    /// The user's personal photo.
    required String? photo,

    /// The user's notification token.
    required String? notificationToken,

    /// Returns whether the user is admin or not.
    required bool admin,

    /// Returns whether the user is blocked or not.
    required bool isBlocked,

    /// The user's account last update date.
    @TimestampConverter() required DateTime lastUpdate,

    /// The user's account creation date.
    @TimestampConverter() required DateTime creationDate,
  }) = _userModelDto;

  /// Responsible to generate [UserModelDto] from [UserModel].
  factory UserModelDto.fromDomain(UserModel userModel) {
    return UserModelDto(
      id: userModel.id.getOrCrash(),
      name: userModel.name.getOrCrash(),
      emailAddress: userModel.emailAddress.getOrCrash(),
      address: userModel.address.getOrCrash().fold(() => null, id),
      phoneNumber: userModel.phoneNumber.getOrCrash().fold(() => null, id),
      website: userModel.website.getOrCrash().fold(() => null, id),
      notificationToken: userModel.notificationToken.getOrCrash().fold(() => null, id),
      photo: userModel.photo.getOrCrash().fold(() => null, id),
      admin: userModel.admin,
      isBlocked: userModel.isBlocked,
      lastUpdate: userModel.lastUpdate.getOrCrash(),
      creationDate: userModel.creationDate.getOrCrash(),
    );
  }

  /// Responsible to generate [UserModel] from [UserModelDto].
  UserModel toDomain() {
    return UserModel(
      id: UniqueId.fromUniqueString(this.id),
      name: Name(name),
      emailAddress: EmailAddress(emailAddress),
      address: Address(optionOf(address)),
      phoneNumber: PhoneNumber(optionOf(phoneNumber)),
      website: OptionWebsite(optionOf(website)),
      notificationToken: NotificationToken(optionOf(notificationToken)),
      photo: Photo(optionOf(photo)),
      admin: admin,
      isBlocked: isBlocked,
      lastUpdate: DuoDate(creationDate),
      creationDate: DuoDate(creationDate),
    );
  }

  /// Responsible to generate `Json` format from [UserModelDto].
  factory UserModelDto.fromJson(Map<String, dynamic> json) => _$UserModelDtoFromJson(json);

  /// Responsible to generate [UserModelDto] from [DocumentSnapshot].
  factory UserModelDto.fromFireStore(DocumentSnapshot doc) {
    return UserModelDto.fromJson(doc.data()! as Map<String, dynamic>).copyWith(id: doc.id);
  }
}
