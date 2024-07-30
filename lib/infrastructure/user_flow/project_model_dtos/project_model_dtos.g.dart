// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$projectModelDtoImpl _$$projectModelDtoImplFromJson(Map json) =>
    _$projectModelDtoImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      projectCompleteness: (json['projectCompleteness'] as num).toDouble(),
      isDone: json['isDone'] as bool,
      deadLine: const TimestampConverter().fromJson(json['deadLine']),
      lastUpdate: const TimestampConverter().fromJson(json['lastUpdate']),
      creationDate: const TimestampConverter().fromJson(json['creationDate']),
    );

Map<String, dynamic> _$$projectModelDtoImplToJson(
        _$projectModelDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'projectCompleteness': instance.projectCompleteness,
      'isDone': instance.isDone,
      'deadLine': const TimestampConverter().toJson(instance.deadLine),
      'lastUpdate': const TimestampConverter().toJson(instance.lastUpdate),
      'creationDate': const TimestampConverter().toJson(instance.creationDate),
    };
