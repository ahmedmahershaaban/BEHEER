// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_model_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProjectModelDto _$ProjectModelDtoFromJson(Map<String, dynamic> json) {
  return _projectModelDto.fromJson(json);
}

/// @nodoc
mixin _$ProjectModelDto {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get projectCompleteness => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get deadLine => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get lastUpdate => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get creationDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectModelDtoCopyWith<ProjectModelDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectModelDtoCopyWith<$Res> {
  factory $ProjectModelDtoCopyWith(
          ProjectModelDto value, $Res Function(ProjectModelDto) then) =
      _$ProjectModelDtoCopyWithImpl<$Res, ProjectModelDto>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      double projectCompleteness,
      bool isDone,
      @TimestampConverter() DateTime deadLine,
      @TimestampConverter() DateTime lastUpdate,
      @TimestampConverter() DateTime creationDate});
}

/// @nodoc
class _$ProjectModelDtoCopyWithImpl<$Res, $Val extends ProjectModelDto>
    implements $ProjectModelDtoCopyWith<$Res> {
  _$ProjectModelDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? projectCompleteness = null,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      projectCompleteness: null == projectCompleteness
          ? _value.projectCompleteness
          : projectCompleteness // ignore: cast_nullable_to_non_nullable
              as double,
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
abstract class _$$projectModelDtoImplCopyWith<$Res>
    implements $ProjectModelDtoCopyWith<$Res> {
  factory _$$projectModelDtoImplCopyWith(_$projectModelDtoImpl value,
          $Res Function(_$projectModelDtoImpl) then) =
      __$$projectModelDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      double projectCompleteness,
      bool isDone,
      @TimestampConverter() DateTime deadLine,
      @TimestampConverter() DateTime lastUpdate,
      @TimestampConverter() DateTime creationDate});
}

/// @nodoc
class __$$projectModelDtoImplCopyWithImpl<$Res>
    extends _$ProjectModelDtoCopyWithImpl<$Res, _$projectModelDtoImpl>
    implements _$$projectModelDtoImplCopyWith<$Res> {
  __$$projectModelDtoImplCopyWithImpl(
      _$projectModelDtoImpl _value, $Res Function(_$projectModelDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? projectCompleteness = null,
    Object? isDone = null,
    Object? deadLine = null,
    Object? lastUpdate = null,
    Object? creationDate = null,
  }) {
    return _then(_$projectModelDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      projectCompleteness: null == projectCompleteness
          ? _value.projectCompleteness
          : projectCompleteness // ignore: cast_nullable_to_non_nullable
              as double,
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
class _$projectModelDtoImpl extends _projectModelDto {
  const _$projectModelDtoImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.projectCompleteness,
      required this.isDone,
      @TimestampConverter() required this.deadLine,
      @TimestampConverter() required this.lastUpdate,
      @TimestampConverter() required this.creationDate})
      : super._();

  factory _$projectModelDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$projectModelDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final double projectCompleteness;
  @override
  final bool isDone;
  @override
  @TimestampConverter()
  final DateTime deadLine;
  @override
  @TimestampConverter()
  final DateTime lastUpdate;
  @override
  @TimestampConverter()
  final DateTime creationDate;

  @override
  String toString() {
    return 'ProjectModelDto(id: $id, title: $title, description: $description, projectCompleteness: $projectCompleteness, isDone: $isDone, deadLine: $deadLine, lastUpdate: $lastUpdate, creationDate: $creationDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$projectModelDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.projectCompleteness, projectCompleteness) ||
                other.projectCompleteness == projectCompleteness) &&
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
  int get hashCode => Object.hash(runtimeType, id, title, description,
      projectCompleteness, isDone, deadLine, lastUpdate, creationDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$projectModelDtoImplCopyWith<_$projectModelDtoImpl> get copyWith =>
      __$$projectModelDtoImplCopyWithImpl<_$projectModelDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$projectModelDtoImplToJson(
      this,
    );
  }
}

abstract class _projectModelDto extends ProjectModelDto {
  const factory _projectModelDto(
          {required final String id,
          required final String title,
          required final String description,
          required final double projectCompleteness,
          required final bool isDone,
          @TimestampConverter() required final DateTime deadLine,
          @TimestampConverter() required final DateTime lastUpdate,
          @TimestampConverter() required final DateTime creationDate}) =
      _$projectModelDtoImpl;
  const _projectModelDto._() : super._();

  factory _projectModelDto.fromJson(Map<String, dynamic> json) =
      _$projectModelDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  double get projectCompleteness;
  @override
  bool get isDone;
  @override
  @TimestampConverter()
  DateTime get deadLine;
  @override
  @TimestampConverter()
  DateTime get lastUpdate;
  @override
  @TimestampConverter()
  DateTime get creationDate;
  @override
  @JsonKey(ignore: true)
  _$$projectModelDtoImplCopyWith<_$projectModelDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
