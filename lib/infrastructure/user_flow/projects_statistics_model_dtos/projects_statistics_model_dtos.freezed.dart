// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'projects_statistics_model_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProjectsStatisticsModelDto _$ProjectsStatisticsModelDtoFromJson(
    Map<String, dynamic> json) {
  return _projectsStatisticsModelDto.fromJson(json);
}

/// @nodoc
mixin _$ProjectsStatisticsModelDto {
  /// The model unique ID.
  String get id => throw _privateConstructorUsedError;

  /// All projects statistics should be added here for analysis purposes and easy display.
  Map<dynamic, Map<dynamic, dynamic>>? get projectsStatistics =>
      throw _privateConstructorUsedError;

  /// The model last update date.
  @TimestampConverter()
  DateTime get lastUpdate => throw _privateConstructorUsedError;

  /// The model creation date.
  @TimestampConverter()
  DateTime get creationDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectsStatisticsModelDtoCopyWith<ProjectsStatisticsModelDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectsStatisticsModelDtoCopyWith<$Res> {
  factory $ProjectsStatisticsModelDtoCopyWith(ProjectsStatisticsModelDto value,
          $Res Function(ProjectsStatisticsModelDto) then) =
      _$ProjectsStatisticsModelDtoCopyWithImpl<$Res,
          ProjectsStatisticsModelDto>;
  @useResult
  $Res call(
      {String id,
      Map<dynamic, Map<dynamic, dynamic>>? projectsStatistics,
      @TimestampConverter() DateTime lastUpdate,
      @TimestampConverter() DateTime creationDate});
}

/// @nodoc
class _$ProjectsStatisticsModelDtoCopyWithImpl<$Res,
        $Val extends ProjectsStatisticsModelDto>
    implements $ProjectsStatisticsModelDtoCopyWith<$Res> {
  _$ProjectsStatisticsModelDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectsStatistics = freezed,
    Object? lastUpdate = null,
    Object? creationDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      projectsStatistics: freezed == projectsStatistics
          ? _value.projectsStatistics
          : projectsStatistics // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, Map<dynamic, dynamic>>?,
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
abstract class _$$projectsStatisticsModelDtoImplCopyWith<$Res>
    implements $ProjectsStatisticsModelDtoCopyWith<$Res> {
  factory _$$projectsStatisticsModelDtoImplCopyWith(
          _$projectsStatisticsModelDtoImpl value,
          $Res Function(_$projectsStatisticsModelDtoImpl) then) =
      __$$projectsStatisticsModelDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Map<dynamic, Map<dynamic, dynamic>>? projectsStatistics,
      @TimestampConverter() DateTime lastUpdate,
      @TimestampConverter() DateTime creationDate});
}

/// @nodoc
class __$$projectsStatisticsModelDtoImplCopyWithImpl<$Res>
    extends _$ProjectsStatisticsModelDtoCopyWithImpl<$Res,
        _$projectsStatisticsModelDtoImpl>
    implements _$$projectsStatisticsModelDtoImplCopyWith<$Res> {
  __$$projectsStatisticsModelDtoImplCopyWithImpl(
      _$projectsStatisticsModelDtoImpl _value,
      $Res Function(_$projectsStatisticsModelDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectsStatistics = freezed,
    Object? lastUpdate = null,
    Object? creationDate = null,
  }) {
    return _then(_$projectsStatisticsModelDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      projectsStatistics: freezed == projectsStatistics
          ? _value._projectsStatistics
          : projectsStatistics // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, Map<dynamic, dynamic>>?,
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
class _$projectsStatisticsModelDtoImpl extends _projectsStatisticsModelDto {
  const _$projectsStatisticsModelDtoImpl(
      {required this.id,
      required final Map<dynamic, Map<dynamic, dynamic>>? projectsStatistics,
      @TimestampConverter() required this.lastUpdate,
      @TimestampConverter() required this.creationDate})
      : _projectsStatistics = projectsStatistics,
        super._();

  factory _$projectsStatisticsModelDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$projectsStatisticsModelDtoImplFromJson(json);

  /// The model unique ID.
  @override
  final String id;

  /// All projects statistics should be added here for analysis purposes and easy display.
  final Map<dynamic, Map<dynamic, dynamic>>? _projectsStatistics;

  /// All projects statistics should be added here for analysis purposes and easy display.
  @override
  Map<dynamic, Map<dynamic, dynamic>>? get projectsStatistics {
    final value = _projectsStatistics;
    if (value == null) return null;
    if (_projectsStatistics is EqualUnmodifiableMapView)
      return _projectsStatistics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// The model last update date.
  @override
  @TimestampConverter()
  final DateTime lastUpdate;

  /// The model creation date.
  @override
  @TimestampConverter()
  final DateTime creationDate;

  @override
  String toString() {
    return 'ProjectsStatisticsModelDto(id: $id, projectsStatistics: $projectsStatistics, lastUpdate: $lastUpdate, creationDate: $creationDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$projectsStatisticsModelDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._projectsStatistics, _projectsStatistics) &&
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
      const DeepCollectionEquality().hash(_projectsStatistics),
      lastUpdate,
      creationDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$projectsStatisticsModelDtoImplCopyWith<_$projectsStatisticsModelDtoImpl>
      get copyWith => __$$projectsStatisticsModelDtoImplCopyWithImpl<
          _$projectsStatisticsModelDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$projectsStatisticsModelDtoImplToJson(
      this,
    );
  }
}

abstract class _projectsStatisticsModelDto extends ProjectsStatisticsModelDto {
  const factory _projectsStatisticsModelDto(
      {required final String id,
      required final Map<dynamic, Map<dynamic, dynamic>>? projectsStatistics,
      @TimestampConverter() required final DateTime lastUpdate,
      @TimestampConverter()
      required final DateTime creationDate}) = _$projectsStatisticsModelDtoImpl;
  const _projectsStatisticsModelDto._() : super._();

  factory _projectsStatisticsModelDto.fromJson(Map<String, dynamic> json) =
      _$projectsStatisticsModelDtoImpl.fromJson;

  @override

  /// The model unique ID.
  String get id;
  @override

  /// All projects statistics should be added here for analysis purposes and easy display.
  Map<dynamic, Map<dynamic, dynamic>>? get projectsStatistics;
  @override

  /// The model last update date.
  @TimestampConverter()
  DateTime get lastUpdate;
  @override

  /// The model creation date.
  @TimestampConverter()
  DateTime get creationDate;
  @override
  @JsonKey(ignore: true)
  _$$projectsStatisticsModelDtoImplCopyWith<_$projectsStatisticsModelDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
