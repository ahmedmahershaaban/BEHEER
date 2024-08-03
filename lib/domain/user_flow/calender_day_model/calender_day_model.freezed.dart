// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calender_day_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalenderDayModel {
  /// The model unique ID.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  UniqueId get id => throw _privateConstructorUsedError;

  /// The user's schedules he made for this day.
  ///
  /// Contains `KtList<ScheduleModel>`.
  KtList<ScheduleModel> get schedules => throw _privateConstructorUsedError;

  /// The user's tasks he made for this day.
  ///
  /// Contains `KtList<TaskModel>`.
  KtList<TaskModel> get tasks => throw _privateConstructorUsedError;

  /// The calender day last update date.
  ///
  /// Contains `Either<ValueFailure<DateTime> , DateTime>`.
  DuoDate get lastUpdate => throw _privateConstructorUsedError;

  /// The calender day creation date.
  ///
  /// Contains `Either<ValueFailure<DateTime> , DateTime>`.
  DuoDate get creationDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalenderDayModelCopyWith<CalenderDayModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalenderDayModelCopyWith<$Res> {
  factory $CalenderDayModelCopyWith(
          CalenderDayModel value, $Res Function(CalenderDayModel) then) =
      _$CalenderDayModelCopyWithImpl<$Res, CalenderDayModel>;
  @useResult
  $Res call(
      {UniqueId id,
      KtList<ScheduleModel> schedules,
      KtList<TaskModel> tasks,
      DuoDate lastUpdate,
      DuoDate creationDate});
}

/// @nodoc
class _$CalenderDayModelCopyWithImpl<$Res, $Val extends CalenderDayModel>
    implements $CalenderDayModelCopyWith<$Res> {
  _$CalenderDayModelCopyWithImpl(this._value, this._then);

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
              as UniqueId,
      schedules: null == schedules
          ? _value.schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as KtList<ScheduleModel>,
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as KtList<TaskModel>,
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
abstract class _$$CalenderDayModelImplCopyWith<$Res>
    implements $CalenderDayModelCopyWith<$Res> {
  factory _$$CalenderDayModelImplCopyWith(_$CalenderDayModelImpl value,
          $Res Function(_$CalenderDayModelImpl) then) =
      __$$CalenderDayModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id,
      KtList<ScheduleModel> schedules,
      KtList<TaskModel> tasks,
      DuoDate lastUpdate,
      DuoDate creationDate});
}

/// @nodoc
class __$$CalenderDayModelImplCopyWithImpl<$Res>
    extends _$CalenderDayModelCopyWithImpl<$Res, _$CalenderDayModelImpl>
    implements _$$CalenderDayModelImplCopyWith<$Res> {
  __$$CalenderDayModelImplCopyWithImpl(_$CalenderDayModelImpl _value,
      $Res Function(_$CalenderDayModelImpl) _then)
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
    return _then(_$CalenderDayModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      schedules: null == schedules
          ? _value.schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as KtList<ScheduleModel>,
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as KtList<TaskModel>,
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

class _$CalenderDayModelImpl extends _CalenderDayModel {
  const _$CalenderDayModelImpl(
      {required this.id,
      required this.schedules,
      required this.tasks,
      required this.lastUpdate,
      required this.creationDate})
      : super._();

  /// The model unique ID.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  @override
  final UniqueId id;

  /// The user's schedules he made for this day.
  ///
  /// Contains `KtList<ScheduleModel>`.
  @override
  final KtList<ScheduleModel> schedules;

  /// The user's tasks he made for this day.
  ///
  /// Contains `KtList<TaskModel>`.
  @override
  final KtList<TaskModel> tasks;

  /// The calender day last update date.
  ///
  /// Contains `Either<ValueFailure<DateTime> , DateTime>`.
  @override
  final DuoDate lastUpdate;

  /// The calender day creation date.
  ///
  /// Contains `Either<ValueFailure<DateTime> , DateTime>`.
  @override
  final DuoDate creationDate;

  @override
  String toString() {
    return 'CalenderDayModel(id: $id, schedules: $schedules, tasks: $tasks, lastUpdate: $lastUpdate, creationDate: $creationDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalenderDayModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.schedules, schedules) ||
                other.schedules == schedules) &&
            (identical(other.tasks, tasks) || other.tasks == tasks) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, schedules, tasks, lastUpdate, creationDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalenderDayModelImplCopyWith<_$CalenderDayModelImpl> get copyWith =>
      __$$CalenderDayModelImplCopyWithImpl<_$CalenderDayModelImpl>(
          this, _$identity);
}

abstract class _CalenderDayModel extends CalenderDayModel {
  const factory _CalenderDayModel(
      {required final UniqueId id,
      required final KtList<ScheduleModel> schedules,
      required final KtList<TaskModel> tasks,
      required final DuoDate lastUpdate,
      required final DuoDate creationDate}) = _$CalenderDayModelImpl;
  const _CalenderDayModel._() : super._();

  @override

  /// The model unique ID.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  UniqueId get id;
  @override

  /// The user's schedules he made for this day.
  ///
  /// Contains `KtList<ScheduleModel>`.
  KtList<ScheduleModel> get schedules;
  @override

  /// The user's tasks he made for this day.
  ///
  /// Contains `KtList<TaskModel>`.
  KtList<TaskModel> get tasks;
  @override

  /// The calender day last update date.
  ///
  /// Contains `Either<ValueFailure<DateTime> , DateTime>`.
  DuoDate get lastUpdate;
  @override

  /// The calender day creation date.
  ///
  /// Contains `Either<ValueFailure<DateTime> , DateTime>`.
  DuoDate get creationDate;
  @override
  @JsonKey(ignore: true)
  _$$CalenderDayModelImplCopyWith<_$CalenderDayModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
