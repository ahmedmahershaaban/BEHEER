// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskModelDto _$TaskModelDtoFromJson(Map<String, dynamic> json) {
  return _taskModelDto.fromJson(json);
}

/// @nodoc
mixin _$TaskModelDto {
  /// The model unique ID.
  String get id => throw _privateConstructorUsedError;

  /// The task title.
  String get title => throw _privateConstructorUsedError;

  /// Returns whether the task is done or not.
  bool get isDone => throw _privateConstructorUsedError;

  /// The task dead line date.
  @TimestampConverter()
  DateTime get deadLine => throw _privateConstructorUsedError;

  /// The task last update date.
  @TimestampConverter()
  DateTime get lastUpdate => throw _privateConstructorUsedError;

  /// The task creation date.
  @TimestampConverter()
  DateTime get creationDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskModelDtoCopyWith<TaskModelDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskModelDtoCopyWith<$Res> {
  factory $TaskModelDtoCopyWith(
          TaskModelDto value, $Res Function(TaskModelDto) then) =
      _$TaskModelDtoCopyWithImpl<$Res, TaskModelDto>;
  @useResult
  $Res call(
      {String id,
      String title,
      bool isDone,
      @TimestampConverter() DateTime deadLine,
      @TimestampConverter() DateTime lastUpdate,
      @TimestampConverter() DateTime creationDate});
}

/// @nodoc
class _$TaskModelDtoCopyWithImpl<$Res, $Val extends TaskModelDto>
    implements $TaskModelDtoCopyWith<$Res> {
  _$TaskModelDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? isDone = null,
    Object? deadLine = null,
    Object? lastUpdate = null,
    Object? creationDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      deadLine: null == deadLine
          ? _value.deadLine
          : deadLine // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
abstract class _$$taskModelDtoImplCopyWith<$Res>
    implements $TaskModelDtoCopyWith<$Res> {
  factory _$$taskModelDtoImplCopyWith(
          _$taskModelDtoImpl value, $Res Function(_$taskModelDtoImpl) then) =
      __$$taskModelDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      bool isDone,
      @TimestampConverter() DateTime deadLine,
      @TimestampConverter() DateTime lastUpdate,
      @TimestampConverter() DateTime creationDate});
}

/// @nodoc
class __$$taskModelDtoImplCopyWithImpl<$Res>
    extends _$TaskModelDtoCopyWithImpl<$Res, _$taskModelDtoImpl>
    implements _$$taskModelDtoImplCopyWith<$Res> {
  __$$taskModelDtoImplCopyWithImpl(
      _$taskModelDtoImpl _value, $Res Function(_$taskModelDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? isDone = null,
    Object? deadLine = null,
    Object? lastUpdate = null,
    Object? creationDate = null,
  }) {
    return _then(_$taskModelDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      deadLine: null == deadLine
          ? _value.deadLine
          : deadLine // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
class _$taskModelDtoImpl extends _taskModelDto {
  const _$taskModelDtoImpl(
      {required this.id,
      required this.title,
      required this.isDone,
      @TimestampConverter() required this.deadLine,
      @TimestampConverter() required this.lastUpdate,
      @TimestampConverter() required this.creationDate})
      : super._();

  factory _$taskModelDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$taskModelDtoImplFromJson(json);

  /// The model unique ID.
  @override
  final String id;

  /// The task title.
  @override
  final String title;

  /// Returns whether the task is done or not.
  @override
  final bool isDone;

  /// The task dead line date.
  @override
  @TimestampConverter()
  final DateTime deadLine;

  /// The task last update date.
  @override
  @TimestampConverter()
  final DateTime lastUpdate;

  /// The task creation date.
  @override
  @TimestampConverter()
  final DateTime creationDate;

  @override
  String toString() {
    return 'TaskModelDto(id: $id, title: $title, isDone: $isDone, deadLine: $deadLine, lastUpdate: $lastUpdate, creationDate: $creationDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$taskModelDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.deadLine, deadLine) ||
                other.deadLine == deadLine) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, isDone, deadLine, lastUpdate, creationDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$taskModelDtoImplCopyWith<_$taskModelDtoImpl> get copyWith =>
      __$$taskModelDtoImplCopyWithImpl<_$taskModelDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$taskModelDtoImplToJson(
      this,
    );
  }
}

abstract class _taskModelDto extends TaskModelDto {
  const factory _taskModelDto(
          {required final String id,
          required final String title,
          required final bool isDone,
          @TimestampConverter() required final DateTime deadLine,
          @TimestampConverter() required final DateTime lastUpdate,
          @TimestampConverter() required final DateTime creationDate}) =
      _$taskModelDtoImpl;
  const _taskModelDto._() : super._();

  factory _taskModelDto.fromJson(Map<String, dynamic> json) =
      _$taskModelDtoImpl.fromJson;

  @override

  /// The model unique ID.
  String get id;
  @override

  /// The task title.
  String get title;
  @override

  /// Returns whether the task is done or not.
  bool get isDone;
  @override

  /// The task dead line date.
  @TimestampConverter()
  DateTime get deadLine;
  @override

  /// The task last update date.
  @TimestampConverter()
  DateTime get lastUpdate;
  @override

  /// The task creation date.
  @TimestampConverter()
  DateTime get creationDate;
  @override
  @JsonKey(ignore: true)
  _$$taskModelDtoImplCopyWith<_$taskModelDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
