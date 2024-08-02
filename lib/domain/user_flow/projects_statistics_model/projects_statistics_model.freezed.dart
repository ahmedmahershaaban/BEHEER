// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'projects_statistics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProjectsStatisticsModel {
  UniqueId get id => throw _privateConstructorUsedError;
  AllProjectsStatistics get projectsStatistics =>
      throw _privateConstructorUsedError;
  DuoDate get lastUpdate => throw _privateConstructorUsedError;
  DuoDate get creationDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectsStatisticsModelCopyWith<ProjectsStatisticsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectsStatisticsModelCopyWith<$Res> {
  factory $ProjectsStatisticsModelCopyWith(ProjectsStatisticsModel value,
          $Res Function(ProjectsStatisticsModel) then) =
      _$ProjectsStatisticsModelCopyWithImpl<$Res, ProjectsStatisticsModel>;
  @useResult
  $Res call(
      {UniqueId id,
      AllProjectsStatistics projectsStatistics,
      DuoDate lastUpdate,
      DuoDate creationDate});
}

/// @nodoc
class _$ProjectsStatisticsModelCopyWithImpl<$Res,
        $Val extends ProjectsStatisticsModel>
    implements $ProjectsStatisticsModelCopyWith<$Res> {
  _$ProjectsStatisticsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectsStatistics = null,
    Object? lastUpdate = null,
    Object? creationDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      projectsStatistics: null == projectsStatistics
          ? _value.projectsStatistics
          : projectsStatistics // ignore: cast_nullable_to_non_nullable
              as AllProjectsStatistics,
      lastUpdate: null == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DuoDate,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DuoDate,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectsStatisticsModelImplCopyWith<$Res>
    implements $ProjectsStatisticsModelCopyWith<$Res> {
  factory _$$ProjectsStatisticsModelImplCopyWith(
          _$ProjectsStatisticsModelImpl value,
          $Res Function(_$ProjectsStatisticsModelImpl) then) =
      __$$ProjectsStatisticsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id,
      AllProjectsStatistics projectsStatistics,
      DuoDate lastUpdate,
      DuoDate creationDate});
}

/// @nodoc
class __$$ProjectsStatisticsModelImplCopyWithImpl<$Res>
    extends _$ProjectsStatisticsModelCopyWithImpl<$Res,
        _$ProjectsStatisticsModelImpl>
    implements _$$ProjectsStatisticsModelImplCopyWith<$Res> {
  __$$ProjectsStatisticsModelImplCopyWithImpl(
      _$ProjectsStatisticsModelImpl _value,
      $Res Function(_$ProjectsStatisticsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectsStatistics = null,
    Object? lastUpdate = null,
    Object? creationDate = null,
  }) {
    return _then(_$ProjectsStatisticsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      projectsStatistics: null == projectsStatistics
          ? _value.projectsStatistics
          : projectsStatistics // ignore: cast_nullable_to_non_nullable
              as AllProjectsStatistics,
      lastUpdate: null == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DuoDate,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DuoDate,
    ));
  }
}

/// @nodoc

class _$ProjectsStatisticsModelImpl extends _ProjectsStatisticsModel {
  const _$ProjectsStatisticsModelImpl(
      {required this.id,
      required this.projectsStatistics,
      required this.lastUpdate,
      required this.creationDate})
      : super._();

  @override
  final UniqueId id;
  @override
  final AllProjectsStatistics projectsStatistics;
  @override
  final DuoDate lastUpdate;
  @override
  final DuoDate creationDate;

  @override
  String toString() {
    return 'ProjectsStatisticsModel(id: $id, projectsStatistics: $projectsStatistics, lastUpdate: $lastUpdate, creationDate: $creationDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectsStatisticsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectsStatistics, projectsStatistics) ||
                other.projectsStatistics == projectsStatistics) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, projectsStatistics, lastUpdate, creationDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectsStatisticsModelImplCopyWith<_$ProjectsStatisticsModelImpl>
      get copyWith => __$$ProjectsStatisticsModelImplCopyWithImpl<
          _$ProjectsStatisticsModelImpl>(this, _$identity);
}

abstract class _ProjectsStatisticsModel extends ProjectsStatisticsModel {
  const factory _ProjectsStatisticsModel(
      {required final UniqueId id,
      required final AllProjectsStatistics projectsStatistics,
      required final DuoDate lastUpdate,
      required final DuoDate creationDate}) = _$ProjectsStatisticsModelImpl;
  const _ProjectsStatisticsModel._() : super._();

  @override
  UniqueId get id;
  @override
  AllProjectsStatistics get projectsStatistics;
  @override
  DuoDate get lastUpdate;
  @override
  DuoDate get creationDate;
  @override
  @JsonKey(ignore: true)
  _$$ProjectsStatisticsModelImplCopyWith<_$ProjectsStatisticsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
