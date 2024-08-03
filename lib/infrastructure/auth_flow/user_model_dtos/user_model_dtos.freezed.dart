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
  /// The user's unique ID.
  String get id => throw _privateConstructorUsedError;

  /// The user's full name.
  String get name => throw _privateConstructorUsedError;

  /// The user's email address.
  String get emailAddress => throw _privateConstructorUsedError;

  /// The user's local address where he lives.
  String? get address => throw _privateConstructorUsedError;

  /// The user's phone number.
  String? get phoneNumber => throw _privateConstructorUsedError;

  /// The user's website url.
  String? get website => throw _privateConstructorUsedError;

  /// The user's personal photo.
  String? get photo => throw _privateConstructorUsedError;

  /// The user's notification token.
  String? get notificationToken => throw _privateConstructorUsedError;

  /// Returns whether the user is admin or not.
  bool get admin => throw _privateConstructorUsedError;

  /// Returns whether the user is blocked or not.
  bool get isBlocked => throw _privateConstructorUsedError;

  /// The user's account last update date.
  @TimestampConverter()
  DateTime get lastUpdate => throw _privateConstructorUsedError;

  /// The user's account creation date.
  @TimestampConverter()
  DateTime get creationDate => throw _privateConstructorUsedError;

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
      String? photo,
      String? notificationToken,
      bool admin,
      bool isBlocked,
      @TimestampConverter() DateTime lastUpdate,
      @TimestampConverter() DateTime creationDate});
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
    Object? photo = freezed,
    Object? notificationToken = freezed,
    Object? admin = null,
    Object? isBlocked = null,
    Object? lastUpdate = null,
    Object? creationDate = null,
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
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationToken: freezed == notificationToken
          ? _value.notificationToken
          : notificationToken // ignore: cast_nullable_to_non_nullable
              as String?,
      admin: null == admin
          ? _value.admin
          : admin // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
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
      String? photo,
      String? notificationToken,
      bool admin,
      bool isBlocked,
      @TimestampConverter() DateTime lastUpdate,
      @TimestampConverter() DateTime creationDate});
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
    Object? photo = freezed,
    Object? notificationToken = freezed,
    Object? admin = null,
    Object? isBlocked = null,
    Object? lastUpdate = null,
    Object? creationDate = null,
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
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationToken: freezed == notificationToken
          ? _value.notificationToken
          : notificationToken // ignore: cast_nullable_to_non_nullable
              as String?,
      admin: null == admin
          ? _value.admin
          : admin // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$userModelDtoImpl extends _userModelDto {
  const _$userModelDtoImpl(
      {required this.id,
      required this.name,
      required this.emailAddress,
      required this.address,
      required this.phoneNumber,
      required this.website,
      required this.photo,
      required this.notificationToken,
      required this.admin,
      required this.isBlocked,
      @TimestampConverter() required this.lastUpdate,
      @TimestampConverter() required this.creationDate})
      : super._();

  factory _$userModelDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$userModelDtoImplFromJson(json);

  /// The user's unique ID.
  @override
  final String id;

  /// The user's full name.
  @override
  final String name;

  /// The user's email address.
  @override
  final String emailAddress;

  /// The user's local address where he lives.
  @override
  final String? address;

  /// The user's phone number.
  @override
  final String? phoneNumber;

  /// The user's website url.
  @override
  final String? website;

  /// The user's personal photo.
  @override
  final String? photo;

  /// The user's notification token.
  @override
  final String? notificationToken;

  /// Returns whether the user is admin or not.
  @override
  final bool admin;

  /// Returns whether the user is blocked or not.
  @override
  final bool isBlocked;

  /// The user's account last update date.
  @override
  @TimestampConverter()
  final DateTime lastUpdate;

  /// The user's account creation date.
  @override
  @TimestampConverter()
  final DateTime creationDate;

  @override
  String toString() {
    return 'UserModelDto(id: $id, name: $name, emailAddress: $emailAddress, address: $address, phoneNumber: $phoneNumber, website: $website, photo: $photo, notificationToken: $notificationToken, admin: $admin, isBlocked: $isBlocked, lastUpdate: $lastUpdate, creationDate: $creationDate)';
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
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.notificationToken, notificationToken) ||
                other.notificationToken == notificationToken) &&
            (identical(other.admin, admin) || other.admin == admin) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked) &&
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
      name,
      emailAddress,
      address,
      phoneNumber,
      website,
      photo,
      notificationToken,
      admin,
      isBlocked,
      lastUpdate,
      creationDate);

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
          required final String? photo,
          required final String? notificationToken,
          required final bool admin,
          required final bool isBlocked,
          @TimestampConverter() required final DateTime lastUpdate,
          @TimestampConverter() required final DateTime creationDate}) =
      _$userModelDtoImpl;
  const _userModelDto._() : super._();

  factory _userModelDto.fromJson(Map<String, dynamic> json) =
      _$userModelDtoImpl.fromJson;

  @override

  /// The user's unique ID.
  String get id;
  @override

  /// The user's full name.
  String get name;
  @override

  /// The user's email address.
  String get emailAddress;
  @override

  /// The user's local address where he lives.
  String? get address;
  @override

  /// The user's phone number.
  String? get phoneNumber;
  @override

  /// The user's website url.
  String? get website;
  @override

  /// The user's personal photo.
  String? get photo;
  @override

  /// The user's notification token.
  String? get notificationToken;
  @override

  /// Returns whether the user is admin or not.
  bool get admin;
  @override

  /// Returns whether the user is blocked or not.
  bool get isBlocked;
  @override

  /// The user's account last update date.
  @TimestampConverter()
  DateTime get lastUpdate;
  @override

  /// The user's account creation date.
  @TimestampConverter()
  DateTime get creationDate;
  @override
  @JsonKey(ignore: true)
  _$$userModelDtoImplCopyWith<_$userModelDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
