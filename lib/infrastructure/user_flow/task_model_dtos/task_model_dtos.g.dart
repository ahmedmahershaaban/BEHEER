// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$taskModelDtoImpl _$$taskModelDtoImplFromJson(Map json) => _$taskModelDtoImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      isDone: json['isDone'] as bool,
      deadLine: const TimestampConverter().fromJson(json['deadLine']),
      lastUpdate: const TimestampConverter().fromJson(json['lastUpdate']),
      creationDate: const TimestampConverter().fromJson(json['creationDate']),
    );

Map<String, dynamic> _$$taskModelDtoImplToJson(_$taskModelDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isDone': instance.isDone,
      'deadLine': const TimestampConverter().toJson(instance.deadLine),
      'lastUpdate': const TimestampConverter().toJson(instance.lastUpdate),
      'creationDate': const TimestampConverter().toJson(instance.creationDate),
    };
