// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calender_day_model_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$calenderDayModelDtoImpl _$$calenderDayModelDtoImplFromJson(Map json) =>
    _$calenderDayModelDtoImpl(
      id: json['id'] as String,
      schedules: (json['schedules'] as List<dynamic>)
          .map((e) =>
              ScheduleModelDto.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      tasks: (json['tasks'] as List<dynamic>)
          .map(
              (e) => TaskModelDto.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      lastUpdate: const TimestampConverter().fromJson(json['lastUpdate']),
      creationDate: const TimestampConverter().fromJson(json['creationDate']),
    );

Map<String, dynamic> _$$calenderDayModelDtoImplToJson(
        _$calenderDayModelDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'schedules': instance.schedules.map((e) => e.toJson()).toList(),
      'tasks': instance.tasks.map((e) => e.toJson()).toList(),
      'lastUpdate': const TimestampConverter().toJson(instance.lastUpdate),
      'creationDate': const TimestampConverter().toJson(instance.creationDate),
    };
