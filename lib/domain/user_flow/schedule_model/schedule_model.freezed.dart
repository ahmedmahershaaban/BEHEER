// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScheduleModel {
  UniqueId get id => throw _privateConstructorUsedError;
  ScheduleTitle get title => throw _privateConstructorUsedError;
  OptionWebsite get url => throw _privateConstructorUsedError;
  ValidatedColor get color => throw _privateConstructorUsedError;
  DuoDate get startDate => throw _privateConstructorUsedError;
  DuoDate get lastUpdate => throw _privateConstructorUsedError;
  DuoDate get creationDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScheduleModelCopyWith<ScheduleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleModelCopyWith<$Res> {
  factory $ScheduleModelCopyWith(
          ScheduleModel value, $Res Function(ScheduleModel) then) =
      _$ScheduleModelCopyWithImpl<$Res, ScheduleModel>;
  @useResult
  $Res call(
      {UniqueId id,
      ScheduleTitle title,
      OptionWebsite url,
      ValidatedColor color,
      DuoDate startDate,
      DuoDate lastUpdate,
      DuoDate creationDate});
}

/// @nodoc
class _$ScheduleModelCopyWithImpl<$Res, $Val extends ScheduleModel>
    implements $ScheduleModelCopyWith<$Res> {
  _$ScheduleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? url = null,
    Object? color = null,
    Object? startDate = null,
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
              as ScheduleTitle,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as OptionWebsite,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as ValidatedColor,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ScheduleModelImplCopyWith<$Res>
    implements $ScheduleModelCopyWith<$Res> {
  factory _$$ScheduleModelImplCopyWith(
          _$ScheduleModelImpl value, $Res Function(_$ScheduleModelImpl) then) =
      __$$ScheduleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id,
      ScheduleTitle title,
      OptionWebsite url,
      ValidatedColor color,
      DuoDate startDate,
      DuoDate lastUpdate,
      DuoDate creationDate});
}

/// @nodoc
class __$$ScheduleModelImplCopyWithImpl<$Res>
    extends _$ScheduleModelCopyWithImpl<$Res, _$ScheduleModelImpl>
    implements _$$ScheduleModelImplCopyWith<$Res> {
  __$$ScheduleModelImplCopyWithImpl(
      _$ScheduleModelImpl _value, $Res Function(_$ScheduleModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? url = null,
    Object? color = null,
    Object? startDate = null,
    Object? lastUpdate = null,
    Object? creationDate = null,
  }) {
    return _then(_$ScheduleModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as ScheduleTitle,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as OptionWebsite,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as ValidatedColor,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
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

class _$ScheduleModelImpl extends _ScheduleModel {
  const _$ScheduleModelImpl(
      {required this.id,
      required this.title,
      required this.url,
      required this.color,
      required this.startDate,
      required this.lastUpdate,
      required this.creationDate})
      : super._();

  @override
  final UniqueId id;
  @override
  final ScheduleTitle title;
  @override
  final OptionWebsite url;
  @override
  final ValidatedColor color;
  @override
  final DuoDate startDate;
  @override
  final DuoDate lastUpdate;
  @override
  final DuoDate creationDate;

  @override
  String toString() {
    return 'ScheduleModel(id: $id, title: $title, url: $url, color: $color, startDate: $startDate, lastUpdate: $lastUpdate, creationDate: $creationDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, url, color, startDate, lastUpdate, creationDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleModelImplCopyWith<_$ScheduleModelImpl> get copyWith =>
      __$$ScheduleModelImplCopyWithImpl<_$ScheduleModelImpl>(this, _$identity);
}

abstract class _ScheduleModel extends ScheduleModel {
  const factory _ScheduleModel(
      {required final UniqueId id,
      required final ScheduleTitle title,
      required final OptionWebsite url,
      required final ValidatedColor color,
      required final DuoDate startDate,
      required final DuoDate lastUpdate,
      required final DuoDate creationDate}) = _$ScheduleModelImpl;
  const _ScheduleModel._() : super._();

  @override
  UniqueId get id;
  @override
  ScheduleTitle get title;
  @override
  OptionWebsite get url;
  @override
  ValidatedColor get color;
  @override
  DuoDate get startDate;
  @override
  DuoDate get lastUpdate;
  @override
  DuoDate get creationDate;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleModelImplCopyWith<_$ScheduleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
