// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calender_day_model_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CalenderDayModelDto _$CalenderDayModelDtoFromJson(Map<String, dynamic> json) {
  return _calenderDayModelDto.fromJson(json);
}

/// @nodoc
mixin _$CalenderDayModelDto {
  String get id => throw _privateConstructorUsedError;
  List<ScheduleModelDto> get schedules => throw _privateConstructorUsedError;
  List<TaskModelDto> get tasks => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get lastUpdate => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get creationDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalenderDayModelDtoCopyWith<CalenderDayModelDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalenderDayModelDtoCopyWith<$Res> {
  factory $CalenderDayModelDtoCopyWith(
          CalenderDayModelDto value, $Res Function(CalenderDayModelDto) then) =
      _$CalenderDayModelDtoCopyWithImpl<$Res, CalenderDayModelDto>;
  @useResult
  $Res call(
      {String id,
      List<ScheduleModelDto> schedules,
      List<TaskModelDto> tasks,
      @TimestampConverter() DateTime lastUpdate,
      @TimestampConverter() DateTime creationDate});
}

/// @nodoc
class _$CalenderDayModelDtoCopyWithImpl<$Res, $Val extends CalenderDayModelDto>
    implements $CalenderDayModelDtoCopyWith<$Res> {
  _$CalenderDayModelDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? schedules = null,
    Object? tasks = null,
    Object? lastUpdate = null,
    Object? creationDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      schedules: null == schedules
          ? _value.schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<ScheduleModelDto>,
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModelDto>,
      lastUpdate: null == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$calenderDayModelDtoImplCopyWith<$Res>
    implements $CalenderDayModelDtoCopyWith<$Res> {
  factory _$$calenderDayModelDtoImplCopyWith(_$calenderDayModelDtoImpl value,
          $Res Function(_$calenderDayModelDtoImpl) then) =
      __$$calenderDayModelDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      List<ScheduleModelDto> schedules,
      List<TaskModelDto> tasks,
      @TimestampConverter() DateTime lastUpdate,
      @TimestampConverter() DateTime creationDate});
}

/// @nodoc
class __$$calenderDayModelDtoImplCopyWithImpl<$Res>
    extends _$CalenderDayModelDtoCopyWithImpl<$Res, _$calenderDayModelDtoImpl>
    implements _$$calenderDayModelDtoImplCopyWith<$Res> {
  __$$calenderDayModelDtoImplCopyWithImpl(_$calenderDayModelDtoImpl _value,
      $Res Function(_$calenderDayModelDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? schedules = null,
    Object? tasks = null,
    Object? lastUpdate = null,
    Object? creationDate = null,
  }) {
    return _then(_$calenderDayModelDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      schedules: null == schedules
          ? _value._schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<ScheduleModelDto>,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModelDto>,
      lastUpdate: null == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$calenderDayModelDtoImpl extends _calenderDayModelDto {
  const _$calenderDayModelDtoImpl(
      {required this.id,
      required final List<ScheduleModelDto> schedules,
      required final List<TaskModelDto> tasks,
      @TimestampConverter() required this.lastUpdate,
      @TimestampConverter() required this.creationDate})
      : _schedules = schedules,
        _tasks = tasks,
        super._();

  factory _$calenderDayModelDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$calenderDayModelDtoImplFromJson(json);

  @override
  final String id;
  final List<ScheduleModelDto> _schedules;
  @override
  List<ScheduleModelDto> get schedules {
    if (_schedules is EqualUnmodifiableListView) return _schedules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_schedules);
  }

  final List<TaskModelDto> _tasks;
  @override
  List<TaskModelDto> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  @TimestampConverter()
  final DateTime lastUpdate;
  @override
  @TimestampConverter()
  final DateTime creationDate;

  @override
  String toString() {
    return 'CalenderDayModelDto(id: $id, schedules: $schedules, tasks: $tasks, lastUpdate: $lastUpdate, creationDate: $creationDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$calenderDayModelDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._schedules, _schedules) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_schedules),
      const DeepCollectionEquality().hash(_tasks),
      lastUpdate,
      creationDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$calenderDayModelDtoImplCopyWith<_$calenderDayModelDtoImpl> get copyWith =>
      __$$calenderDayModelDtoImplCopyWithImpl<_$calenderDayModelDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$calenderDayModelDtoImplToJson(
      this,
    );
  }
}

abstract class _calenderDayModelDto extends CalenderDayModelDto {
  const factory _calenderDayModelDto(
          {required final String id,
          required final List<ScheduleModelDto> schedules,
          required final List<TaskModelDto> tasks,
          @TimestampConverter() required final DateTime lastUpdate,
          @TimestampConverter() required final DateTime creationDate}) =
      _$calenderDayModelDtoImpl;
  const _calenderDayModelDto._() : super._();

  factory _calenderDayModelDto.fromJson(Map<String, dynamic> json) =
      _$calenderDayModelDtoImpl.fromJson;

  @override
  String get id;
  @override
  List<ScheduleModelDto> get schedules;
  @override
  List<TaskModelDto> get tasks;
  @override
  @TimestampConverter()
  DateTime get lastUpdate;
  @override
  @TimestampConverter()
  DateTime get creationDate;
  @override
  @JsonKey(ignore: true)
  _$$calenderDayModelDtoImplCopyWith<_$calenderDayModelDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
