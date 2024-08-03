// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_model_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScheduleModelDto _$ScheduleModelDtoFromJson(Map<String, dynamic> json) {
  return _scheduleModelDto.fromJson(json);
}

/// @nodoc
mixin _$ScheduleModelDto {
  /// The model unique ID.
  String get id => throw _privateConstructorUsedError;

  /// The schedule title.
  String get title => throw _privateConstructorUsedError;

  /// The schedule url which may contains google meeting or zoom meeting or external link.
  String? get url => throw _privateConstructorUsedError;

  /// The schedule card color.
  int get color => throw _privateConstructorUsedError;

  /// The schedule starting date, for now iam considering the meeting is 1 hour long
  /// as for this project but later it could be updated in the logic.
  @TimestampConverter()
  DateTime get startDate => throw _privateConstructorUsedError;

  /// The schedule last update date.
  @TimestampConverter()
  DateTime get lastUpdate => throw _privateConstructorUsedError;

  /// The schedule creation date.
  @TimestampConverter()
  DateTime get creationDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleModelDtoCopyWith<ScheduleModelDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleModelDtoCopyWith<$Res> {
  factory $ScheduleModelDtoCopyWith(
          ScheduleModelDto value, $Res Function(ScheduleModelDto) then) =
      _$ScheduleModelDtoCopyWithImpl<$Res, ScheduleModelDto>;
  @useResult
  $Res call(
      {String id,
      String title,
      String? url,
      int color,
      @TimestampConverter() DateTime startDate,
      @TimestampConverter() DateTime lastUpdate,
      @TimestampConverter() DateTime creationDate});
}

/// @nodoc
class _$ScheduleModelDtoCopyWithImpl<$Res, $Val extends ScheduleModelDto>
    implements $ScheduleModelDtoCopyWith<$Res> {
  _$ScheduleModelDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? url = freezed,
    Object? color = null,
    Object? startDate = null,
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
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
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
abstract class _$$scheduleModelDtoImplCopyWith<$Res>
    implements $ScheduleModelDtoCopyWith<$Res> {
  factory _$$scheduleModelDtoImplCopyWith(_$scheduleModelDtoImpl value,
          $Res Function(_$scheduleModelDtoImpl) then) =
      __$$scheduleModelDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String? url,
      int color,
      @TimestampConverter() DateTime startDate,
      @TimestampConverter() DateTime lastUpdate,
      @TimestampConverter() DateTime creationDate});
}

/// @nodoc
class __$$scheduleModelDtoImplCopyWithImpl<$Res>
    extends _$ScheduleModelDtoCopyWithImpl<$Res, _$scheduleModelDtoImpl>
    implements _$$scheduleModelDtoImplCopyWith<$Res> {
  __$$scheduleModelDtoImplCopyWithImpl(_$scheduleModelDtoImpl _value,
      $Res Function(_$scheduleModelDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? url = freezed,
    Object? color = null,
    Object? startDate = null,
    Object? lastUpdate = null,
    Object? creationDate = null,
  }) {
    return _then(_$scheduleModelDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
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
class _$scheduleModelDtoImpl extends _scheduleModelDto {
  const _$scheduleModelDtoImpl(
      {required this.id,
      required this.title,
      required this.url,
      required this.color,
      @TimestampConverter() required this.startDate,
      @TimestampConverter() required this.lastUpdate,
      @TimestampConverter() required this.creationDate})
      : super._();

  factory _$scheduleModelDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$scheduleModelDtoImplFromJson(json);

  /// The model unique ID.
  @override
  final String id;

  /// The schedule title.
  @override
  final String title;

  /// The schedule url which may contains google meeting or zoom meeting or external link.
  @override
  final String? url;

  /// The schedule card color.
  @override
  final int color;

  /// The schedule starting date, for now iam considering the meeting is 1 hour long
  /// as for this project but later it could be updated in the logic.
  @override
  @TimestampConverter()
  final DateTime startDate;

  /// The schedule last update date.
  @override
  @TimestampConverter()
  final DateTime lastUpdate;

  /// The schedule creation date.
  @override
  @TimestampConverter()
  final DateTime creationDate;

  @override
  String toString() {
    return 'ScheduleModelDto(id: $id, title: $title, url: $url, color: $color, startDate: $startDate, lastUpdate: $lastUpdate, creationDate: $creationDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$scheduleModelDtoImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, url, color, startDate, lastUpdate, creationDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$scheduleModelDtoImplCopyWith<_$scheduleModelDtoImpl> get copyWith =>
      __$$scheduleModelDtoImplCopyWithImpl<_$scheduleModelDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$scheduleModelDtoImplToJson(
      this,
    );
  }
}

abstract class _scheduleModelDto extends ScheduleModelDto {
  const factory _scheduleModelDto(
          {required final String id,
          required final String title,
          required final String? url,
          required final int color,
          @TimestampConverter() required final DateTime startDate,
          @TimestampConverter() required final DateTime lastUpdate,
          @TimestampConverter() required final DateTime creationDate}) =
      _$scheduleModelDtoImpl;
  const _scheduleModelDto._() : super._();

  factory _scheduleModelDto.fromJson(Map<String, dynamic> json) =
      _$scheduleModelDtoImpl.fromJson;

  @override

  /// The model unique ID.
  String get id;
  @override

  /// The schedule title.
  String get title;
  @override

  /// The schedule url which may contains google meeting or zoom meeting or external link.
  String? get url;
  @override

  /// The schedule card color.
  int get color;
  @override

  /// The schedule starting date, for now iam considering the meeting is 1 hour long
  /// as for this project but later it could be updated in the logic.
  @TimestampConverter()
  DateTime get startDate;
  @override

  /// The schedule last update date.
  @TimestampConverter()
  DateTime get lastUpdate;
  @override

  /// The schedule creation date.
  @TimestampConverter()
  DateTime get creationDate;
  @override
  @JsonKey(ignore: true)
  _$$scheduleModelDtoImplCopyWith<_$scheduleModelDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
