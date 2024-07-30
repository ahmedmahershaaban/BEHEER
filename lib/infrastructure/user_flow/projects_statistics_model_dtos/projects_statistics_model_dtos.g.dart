// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_statistics_model_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$projectsStatisticsModelDtoImpl _$$projectsStatisticsModelDtoImplFromJson(
        Map json) =>
    _$projectsStatisticsModelDtoImpl(
      id: json['id'] as String,
      projectsStatistics: (json['projectsStatistics'] as Map?)?.map(
        (k, e) => MapEntry(k, e as Map),
      ),
      lastUpdate: const TimestampConverter().fromJson(json['lastUpdate']),
      creationDate: const TimestampConverter().fromJson(json['creationDate']),
    );

Map<String, dynamic> _$$projectsStatisticsModelDtoImplToJson(
        _$projectsStatisticsModelDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectsStatistics': instance.projectsStatistics,
      'lastUpdate': const TimestampConverter().toJson(instance.lastUpdate),
      'creationDate': const TimestampConverter().toJson(instance.creationDate),
    };
