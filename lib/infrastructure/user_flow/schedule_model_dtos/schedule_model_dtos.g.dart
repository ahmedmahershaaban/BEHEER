// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$scheduleModelDtoImpl _$$scheduleModelDtoImplFromJson(Map json) =>
    _$scheduleModelDtoImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      url: json['url'] as String?,
      color: (json['color'] as num).toInt(),
      startDate: const TimestampConverter().fromJson(json['startDate']),
      lastUpdate: const TimestampConverter().fromJson(json['lastUpdate']),
      creationDate: const TimestampConverter().fromJson(json['creationDate']),
    );

Map<String, dynamic> _$$scheduleModelDtoImplToJson(
        _$scheduleModelDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'color': instance.color,
      'startDate': const TimestampConverter().toJson(instance.startDate),
      'lastUpdate': const TimestampConverter().toJson(instance.lastUpdate),
      'creationDate': const TimestampConverter().toJson(instance.creationDate),
    };
