// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$userModelDtoImpl _$$userModelDtoImplFromJson(Map json) => _$userModelDtoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      emailAddress: json['emailAddress'] as String,
      address: json['address'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      website: json['website'] as String?,
      notificationToken: json['notificationToken'] as String?,
      photo: json['photo'] as String?,
      lastUpdate: const TimestampConverter().fromJson(json['lastUpdate']),
      creationDate: const TimestampConverter().fromJson(json['creationDate']),
      admin: json['admin'] as bool,
      isBlocked: json['isBlocked'] as bool,
    );

Map<String, dynamic> _$$userModelDtoImplToJson(_$userModelDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'emailAddress': instance.emailAddress,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'website': instance.website,
      'notificationToken': instance.notificationToken,
      'photo': instance.photo,
      'lastUpdate': const TimestampConverter().toJson(instance.lastUpdate),
      'creationDate': const TimestampConverter().toJson(instance.creationDate),
      'admin': instance.admin,
      'isBlocked': instance.isBlocked,
    };
