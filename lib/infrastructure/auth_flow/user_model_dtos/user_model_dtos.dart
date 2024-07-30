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
    required String id,
    required String name,
    required String emailAddress,
    required String? address,
    required String? phoneNumber,
    required String? website,
    required String? notificationToken,
    required String? photo,
    @TimestampConverter() required DateTime lastUpdate,
    @TimestampConverter() required DateTime creationDate,
    required bool admin,
    required bool isBlocked,
  }) = _userModelDto;

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

  factory UserModelDto.fromJson(Map<String, dynamic> json) => _$UserModelDtoFromJson(json);

  factory UserModelDto.fromFireStore(DocumentSnapshot doc) {
    return UserModelDto.fromJson(doc.data()! as Map<String, dynamic>).copyWith(id: doc.id);
  }
}
