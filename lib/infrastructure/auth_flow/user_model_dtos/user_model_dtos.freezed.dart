// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModelDto _$UserModelDtoFromJson(Map<String, dynamic> json) {
  return _userModelDto.fromJson(json);
}

/// @nodoc
mixin _$UserModelDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get emailAddress => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;
  String? get notificationToken => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get lastUpdate => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get creationDate => throw _privateConstructorUsedError;
  bool get admin => throw _privateConstructorUsedError;
  bool get isBlocked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelDtoCopyWith<UserModelDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelDtoCopyWith<$Res> {
  factory $UserModelDtoCopyWith(
          UserModelDto value, $Res Function(UserModelDto) then) =
      _$UserModelDtoCopyWithImpl<$Res, UserModelDto>;
  @useResult
  $Res call(
      {String id,
      String name,
      String emailAddress,
      String? address,
      String? phoneNumber,
      String? website,
      String? notificationToken,
      String? photo,
      @TimestampConverter() DateTime lastUpdate,
      @TimestampConverter() DateTime creationDate,
      bool admin,
      bool isBlocked});
}

/// @nodoc
class _$UserModelDtoCopyWithImpl<$Res, $Val extends UserModelDto>
    implements $UserModelDtoCopyWith<$Res> {
  _$UserModelDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? emailAddress = null,
    Object? address = freezed,
    Object? phoneNumber = freezed,
    Object? website = freezed,
    Object? notificationToken = freezed,
    Object? photo = freezed,
    Object? lastUpdate = null,
    Object? creationDate = null,
    Object? admin = null,
    Object? isBlocked = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationToken: freezed == notificationToken
          ? _value.notificationToken
          : notificationToken // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdate: null == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      admin: null == admin
          ? _value.admin
          : admin // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$userModelDtoImplCopyWith<$Res>
    implements $UserModelDtoCopyWith<$Res> {
  factory _$$userModelDtoImplCopyWith(
          _$userModelDtoImpl value, $Res Function(_$userModelDtoImpl) then) =
      __$$userModelDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String emailAddress,
      String? address,
      String? phoneNumber,
      String? website,
      String? notificationToken,
      String? photo,
      @TimestampConverter() DateTime lastUpdate,
      @TimestampConverter() DateTime creationDate,
      bool admin,
      bool isBlocked});
}

/// @nodoc
class __$$userModelDtoImplCopyWithImpl<$Res>
    extends _$UserModelDtoCopyWithImpl<$Res, _$userModelDtoImpl>
    implements _$$userModelDtoImplCopyWith<$Res> {
  __$$userModelDtoImplCopyWithImpl(
      _$userModelDtoImpl _value, $Res Function(_$userModelDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? emailAddress = null,
    Object? address = freezed,
    Object? phoneNumber = freezed,
    Object? website = freezed,
    Object? notificationToken = freezed,
    Object? photo = freezed,
    Object? lastUpdate = null,
    Object? creationDate = null,
    Object? admin = null,
    Object? isBlocked = null,
  }) {
    return _then(_$userModelDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationToken: freezed == notificationToken
          ? _value.notificationToken
          : notificationToken // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdate: null == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      admin: null == admin
          ? _value.admin
          : admin // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$userModelDtoImpl extends _userModelDto {
  const _$userModelDtoImpl(
      {required this.id,
      required this.name,
      required this.emailAddress,
      required this.address,
      required this.phoneNumber,
      required this.website,
      required this.notificationToken,
      required this.photo,
      @TimestampConverter() required this.lastUpdate,
      @TimestampConverter() required this.creationDate,
      required this.admin,
      required this.isBlocked})
      : super._();

  factory _$userModelDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$userModelDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String emailAddress;
  @override
  final String? address;
  @override
  final String? phoneNumber;
  @override
  final String? website;
  @override
  final String? notificationToken;
  @override
  final String? photo;
  @override
  @TimestampConverter()
  final DateTime lastUpdate;
  @override
  @TimestampConverter()
  final DateTime creationDate;
  @override
  final bool admin;
  @override
  final bool isBlocked;

  @override
  String toString() {
    return 'UserModelDto(id: $id, name: $name, emailAddress: $emailAddress, address: $address, phoneNumber: $phoneNumber, website: $website, notificationToken: $notificationToken, photo: $photo, lastUpdate: $lastUpdate, creationDate: $creationDate, admin: $admin, isBlocked: $isBlocked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$userModelDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.notificationToken, notificationToken) ||
                other.notificationToken == notificationToken) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.admin, admin) || other.admin == admin) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      emailAddress,
      address,
      phoneNumber,
      website,
      notificationToken,
      photo,
      lastUpdate,
      creationDate,
      admin,
      isBlocked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$userModelDtoImplCopyWith<_$userModelDtoImpl> get copyWith =>
      __$$userModelDtoImplCopyWithImpl<_$userModelDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$userModelDtoImplToJson(
      this,
    );
  }
}

abstract class _userModelDto extends UserModelDto {
  const factory _userModelDto(
      {required final String id,
      required final String name,
      required final String emailAddress,
      required final String? address,
      required final String? phoneNumber,
      required final String? website,
      required final String? notificationToken,
      required final String? photo,
      @TimestampConverter() required final DateTime lastUpdate,
      @TimestampConverter() required final DateTime creationDate,
      required final bool admin,
      required final bool isBlocked}) = _$userModelDtoImpl;
  const _userModelDto._() : super._();

  factory _userModelDto.fromJson(Map<String, dynamic> json) =
      _$userModelDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get emailAddress;
  @override
  String? get address;
  @override
  String? get phoneNumber;
  @override
  String? get website;
  @override
  String? get notificationToken;
  @override
  String? get photo;
  @override
  @TimestampConverter()
  DateTime get lastUpdate;
  @override
  @TimestampConverter()
  DateTime get creationDate;
  @override
  bool get admin;
  @override
  bool get isBlocked;
  @override
  @JsonKey(ignore: true)
  _$$userModelDtoImplCopyWith<_$userModelDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
