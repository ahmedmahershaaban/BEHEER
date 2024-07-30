// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProjectModel {
  UniqueId get id => throw _privateConstructorUsedError;
  ProjectTitle get title => throw _privateConstructorUsedError;
  ProjectDescription get description => throw _privateConstructorUsedError;
  ValidatedDouble get projectCompleteness => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;
  DuoDate get deadLine => throw _privateConstructorUsedError;
  DuoDate get lastUpdate => throw _privateConstructorUsedError;
  DuoDate get creationDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectModelCopyWith<ProjectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectModelCopyWith<$Res> {
  factory $ProjectModelCopyWith(
          ProjectModel value, $Res Function(ProjectModel) then) =
      _$ProjectModelCopyWithImpl<$Res, ProjectModel>;
  @useResult
  $Res call(
      {UniqueId id,
      ProjectTitle title,
      ProjectDescription description,
      ValidatedDouble projectCompleteness,
      bool isDone,
      DuoDate deadLine,
      DuoDate lastUpdate,
      DuoDate creationDate});
}

/// @nodoc
class _$ProjectModelCopyWithImpl<$Res, $Val extends ProjectModel>
    implements $ProjectModelCopyWith<$Res> {
  _$ProjectModelCopyWithImpl(this._value, this._then);

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
              as UniqueId,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as ProjectTitle,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as ProjectDescription,
      projectCompleteness: null == projectCompleteness
          ? _value.projectCompleteness
          : projectCompleteness // ignore: cast_nullable_to_non_nullable
              as ValidatedDouble,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      deadLine: null == deadLine
          ? _value.deadLine
          : deadLine // ignore: cast_nullable_to_non_nullable
              as DuoDate,
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
abstract class _$$ProjectModelImplCopyWith<$Res>
    implements $ProjectModelCopyWith<$Res> {
  factory _$$ProjectModelImplCopyWith(
          _$ProjectModelImpl value, $Res Function(_$ProjectModelImpl) then) =
      __$$ProjectModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id,
      ProjectTitle title,
      ProjectDescription description,
      ValidatedDouble projectCompleteness,
      bool isDone,
      DuoDate deadLine,
      DuoDate lastUpdate,
      DuoDate creationDate});
}

/// @nodoc
class __$$ProjectModelImplCopyWithImpl<$Res>
    extends _$ProjectModelCopyWithImpl<$Res, _$ProjectModelImpl>
    implements _$$ProjectModelImplCopyWith<$Res> {
  __$$ProjectModelImplCopyWithImpl(
      _$ProjectModelImpl _value, $Res Function(_$ProjectModelImpl) _then)
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
    return _then(_$ProjectModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as ProjectTitle,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as ProjectDescription,
      projectCompleteness: null == projectCompleteness
          ? _value.projectCompleteness
          : projectCompleteness // ignore: cast_nullable_to_non_nullable
              as ValidatedDouble,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      deadLine: null == deadLine
          ? _value.deadLine
          : deadLine // ignore: cast_nullable_to_non_nullable
              as DuoDate,
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

class _$ProjectModelImpl extends _ProjectModel {
  const _$ProjectModelImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.projectCompleteness,
      required this.isDone,
      required this.deadLine,
      required this.lastUpdate,
      required this.creationDate})
      : super._();

  @override
  final UniqueId id;
  @override
  final ProjectTitle title;
  @override
  final ProjectDescription description;
  @override
  final ValidatedDouble projectCompleteness;
  @override
  final bool isDone;
  @override
  final DuoDate deadLine;
  @override
  final DuoDate lastUpdate;
  @override
  final DuoDate creationDate;

  @override
  String toString() {
    return 'ProjectModel(id: $id, title: $title, description: $description, projectCompleteness: $projectCompleteness, isDone: $isDone, deadLine: $deadLine, lastUpdate: $lastUpdate, creationDate: $creationDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectModelImpl &&
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

  @override
  int get hashCode => Object.hash(runtimeType, id, title, description,
      projectCompleteness, isDone, deadLine, lastUpdate, creationDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectModelImplCopyWith<_$ProjectModelImpl> get copyWith =>
      __$$ProjectModelImplCopyWithImpl<_$ProjectModelImpl>(this, _$identity);
}

abstract class _ProjectModel extends ProjectModel {
  const factory _ProjectModel(
      {required final UniqueId id,
      required final ProjectTitle title,
      required final ProjectDescription description,
      required final ValidatedDouble projectCompleteness,
      required final bool isDone,
      required final DuoDate deadLine,
      required final DuoDate lastUpdate,
      required final DuoDate creationDate}) = _$ProjectModelImpl;
  const _ProjectModel._() : super._();

  @override
  UniqueId get id;
  @override
  ProjectTitle get title;
  @override
  ProjectDescription get description;
  @override
  ValidatedDouble get projectCompleteness;
  @override
  bool get isDone;
  @override
  DuoDate get deadLine;
  @override
  DuoDate get lastUpdate;
  @override
  DuoDate get creationDate;
  @override
  @JsonKey(ignore: true)
  _$$ProjectModelImplCopyWith<_$ProjectModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
