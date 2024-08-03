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
      photo: json['photo'] as String?,
      notificationToken: json['notificationToken'] as String?,
      admin: json['admin'] as bool,
      isBlocked: json['isBlocked'] as bool,
      lastUpdate: const TimestampConverter().fromJson(json['lastUpdate']),
      creationDate: const TimestampConverter().fromJson(json['creationDate']),
    );

Map<String, dynamic> _$$userModelDtoImplToJson(_$userModelDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'emailAddress': instance.emailAddress,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'website': instance.website,
      'photo': instance.photo,
      'notificationToken': instance.notificationToken,
      'admin': instance.admin,
      'isBlocked': instance.isBlocked,
      'lastUpdate': const TimestampConverter().toJson(instance.lastUpdate),
      'creationDate': const TimestampConverter().toJson(instance.creationDate),
    };
