// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserModel {
  /// The user's unique ID.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  UniqueId get id => throw _privateConstructorUsedError;

  /// The user's full name.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.nullValue].
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  Name get name => throw _privateConstructorUsedError;

  /// The user's email address.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.nullValue].
  /// [ValueFailure.empty].
  /// [ValueFailure.invalidEmail].
  EmailAddress get emailAddress => throw _privateConstructorUsedError;

  /// The user's local address where he lives.
  ///
  /// Contains `Either<ValueFailure<Option<String>> , Option<String>>`.
  /// This property will have value of `none()` as default unless the user updates his profile.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.empty].
  /// [ValueFailure.nullValue].
  /// [ValueFailure.multiline].
  /// [ValueFailure.invalidOptionString].
  Address get address => throw _privateConstructorUsedError;

  /// The user's phone number.
  ///
  /// Contains `Either<ValueFailure<Option<String>> , Option<String>>`.
  /// This property will have value of `none()` as default unless the user updates his profile.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.empty].
  /// [ValueFailure.nullValue].
  /// [ValueFailure.invalidPhoneNumber].
  PhoneNumber get phoneNumber => throw _privateConstructorUsedError;

  /// The user's website url.
  ///
  /// Contains `Either<ValueFailure<Option<String>> , Option<String>>`.
  /// This property will have value of `none()` as default unless the user updates his profile.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  /// [ValueFailure.invalidUrl].
  OptionWebsite get website => throw _privateConstructorUsedError;

  /// The user's personal photo.
  ///
  /// Contains `Either<ValueFailure<Option<String>> , Option<String>>`.
  /// This property will have value of `none()` as default unless the user updates his profile.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  /// [ValueFailure.invalidUrl].
  Photo get photo => throw _privateConstructorUsedError;

  /// The user's notification token.
  ///
  /// Contains `Either<ValueFailure<Option<String>> , Option<String>>`.
  /// This property will have value of `none()` as default unless the user updates his profile.
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.multiline].
  /// [ValueFailure.empty].
  /// [ValueFailure.invalidOptionString].
  NotificationToken get notificationToken => throw _privateConstructorUsedError;

  /// Returns whether the user is admin or not.
  ///
  /// By default this property will be 'false'.
  bool get admin => throw _privateConstructorUsedError;

  /// Returns whether the user is blocked or not.
  ///
  /// By default this property will be 'false'.
  bool get isBlocked => throw _privateConstructorUsedError;

  /// The user's account last update date.
  ///
  /// Contains `Either<ValueFailure<DateTime> , DateTime>`.
  DuoDate get lastUpdate => throw _privateConstructorUsedError;

  /// The user's account creation date.
  ///
  /// Contains `Either<ValueFailure<DateTime> , DateTime>`.
  DuoDate get creationDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {UniqueId id,
      Name name,
      EmailAddress emailAddress,
      Address address,
      PhoneNumber phoneNumber,
      OptionWebsite website,
      Photo photo,
      NotificationToken notificationToken,
      bool admin,
      bool isBlocked,
      DuoDate lastUpdate,
      DuoDate creationDate});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

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
    Object? address = null,
    Object? phoneNumber = null,
    Object? website = null,
    Object? photo = null,
    Object? notificationToken = null,
    Object? admin = null,
    Object? isBlocked = null,
    Object? lastUpdate = null,
    Object? creationDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as OptionWebsite,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as Photo,
      notificationToken: null == notificationToken
          ? _value.notificationToken
          : notificationToken // ignore: cast_nullable_to_non_nullable
              as NotificationToken,
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
              as DuoDate,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DuoDate,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id,
      Name name,
      EmailAddress emailAddress,
      Address address,
      PhoneNumber phoneNumber,
      OptionWebsite website,
      Photo photo,
      NotificationToken notificationToken,
      bool admin,
      bool isBlocked,
      DuoDate lastUpdate,
      DuoDate creationDate});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? emailAddress = null,
    Object? address = null,
    Object? phoneNumber = null,
    Object? website = null,
    Object? photo = null,
    Object? notificationToken = null,
    Object? admin = null,
    Object? isBlocked = null,
    Object? lastUpdate = null,
    Object? creationDate = null,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as OptionWebsite,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as Photo,
      notificationToken: null == notificationToken
          ? _value.notificationToken
          : notificationToken // ignore: cast_nullable_to_non_nullable
              as NotificationToken,
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
              as DuoDate,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DuoDate,
    ));
  }
}

/// @nodoc

class _$UserModelImpl extends _UserModel {
  const _$UserModelImpl(
      {required this.id,
      required this.name,
      required this.emailAddress,
      required this.address,
      required this.phoneNumber,
      required this.website,
      required this.photo,
      required this.notificationToken,
      this.admin = false,
      this.isBlocked = false,
      required this.lastUpdate,
      required this.creationDate})
      : super._();

  /// The user's unique ID.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  @override
  final UniqueId id;

  /// The user's full name.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.nullValue].
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  @override
  final Name name;

  /// The user's email address.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.nullValue].
  /// [ValueFailure.empty].
  /// [ValueFailure.invalidEmail].
  @override
  final EmailAddress emailAddress;

  /// The user's local address where he lives.
  ///
  /// Contains `Either<ValueFailure<Option<String>> , Option<String>>`.
  /// This property will have value of `none()` as default unless the user updates his profile.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.empty].
  /// [ValueFailure.nullValue].
  /// [ValueFailure.multiline].
  /// [ValueFailure.invalidOptionString].
  @override
  final Address address;

  /// The user's phone number.
  ///
  /// Contains `Either<ValueFailure<Option<String>> , Option<String>>`.
  /// This property will have value of `none()` as default unless the user updates his profile.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.empty].
  /// [ValueFailure.nullValue].
  /// [ValueFailure.invalidPhoneNumber].
  @override
  final PhoneNumber phoneNumber;

  /// The user's website url.
  ///
  /// Contains `Either<ValueFailure<Option<String>> , Option<String>>`.
  /// This property will have value of `none()` as default unless the user updates his profile.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  /// [ValueFailure.invalidUrl].
  @override
  final OptionWebsite website;

  /// The user's personal photo.
  ///
  /// Contains `Either<ValueFailure<Option<String>> , Option<String>>`.
  /// This property will have value of `none()` as default unless the user updates his profile.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  /// [ValueFailure.invalidUrl].
  @override
  final Photo photo;

  /// The user's notification token.
  ///
  /// Contains `Either<ValueFailure<Option<String>> , Option<String>>`.
  /// This property will have value of `none()` as default unless the user updates his profile.
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.multiline].
  /// [ValueFailure.empty].
  /// [ValueFailure.invalidOptionString].
  @override
  final NotificationToken notificationToken;

  /// Returns whether the user is admin or not.
  ///
  /// By default this property will be 'false'.
  @override
  @JsonKey()
  final bool admin;

  /// Returns whether the user is blocked or not.
  ///
  /// By default this property will be 'false'.
  @override
  @JsonKey()
  final bool isBlocked;

  /// The user's account last update date.
  ///
  /// Contains `Either<ValueFailure<DateTime> , DateTime>`.
  @override
  final DuoDate lastUpdate;

  /// The user's account creation date.
  ///
  /// Contains `Either<ValueFailure<DateTime> , DateTime>`.
  @override
  final DuoDate creationDate;

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, emailAddress: $emailAddress, address: $address, phoneNumber: $phoneNumber, website: $website, photo: $photo, notificationToken: $notificationToken, admin: $admin, isBlocked: $isBlocked, lastUpdate: $lastUpdate, creationDate: $creationDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
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
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);
}

abstract class _UserModel extends UserModel {
  const factory _UserModel(
      {required final UniqueId id,
      required final Name name,
      required final EmailAddress emailAddress,
      required final Address address,
      required final PhoneNumber phoneNumber,
      required final OptionWebsite website,
      required final Photo photo,
      required final NotificationToken notificationToken,
      final bool admin,
      final bool isBlocked,
      required final DuoDate lastUpdate,
      required final DuoDate creationDate}) = _$UserModelImpl;
  const _UserModel._() : super._();

  @override

  /// The user's unique ID.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  UniqueId get id;
  @override

  /// The user's full name.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.nullValue].
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  Name get name;
  @override

  /// The user's email address.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.nullValue].
  /// [ValueFailure.empty].
  /// [ValueFailure.invalidEmail].
  EmailAddress get emailAddress;
  @override

  /// The user's local address where he lives.
  ///
  /// Contains `Either<ValueFailure<Option<String>> , Option<String>>`.
  /// This property will have value of `none()` as default unless the user updates his profile.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.empty].
  /// [ValueFailure.nullValue].
  /// [ValueFailure.multiline].
  /// [ValueFailure.invalidOptionString].
  Address get address;
  @override

  /// The user's phone number.
  ///
  /// Contains `Either<ValueFailure<Option<String>> , Option<String>>`.
  /// This property will have value of `none()` as default unless the user updates his profile.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.empty].
  /// [ValueFailure.nullValue].
  /// [ValueFailure.invalidPhoneNumber].
  PhoneNumber get phoneNumber;
  @override

  /// The user's website url.
  ///
  /// Contains `Either<ValueFailure<Option<String>> , Option<String>>`.
  /// This property will have value of `none()` as default unless the user updates his profile.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  /// [ValueFailure.invalidUrl].
  OptionWebsite get website;
  @override

  /// The user's personal photo.
  ///
  /// Contains `Either<ValueFailure<Option<String>> , Option<String>>`.
  /// This property will have value of `none()` as default unless the user updates his profile.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  /// [ValueFailure.invalidUrl].
  Photo get photo;
  @override

  /// The user's notification token.
  ///
  /// Contains `Either<ValueFailure<Option<String>> , Option<String>>`.
  /// This property will have value of `none()` as default unless the user updates his profile.
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.multiline].
  /// [ValueFailure.empty].
  /// [ValueFailure.invalidOptionString].
  NotificationToken get notificationToken;
  @override

  /// Returns whether the user is admin or not.
  ///
  /// By default this property will be 'false'.
  bool get admin;
  @override

  /// Returns whether the user is blocked or not.
  ///
  /// By default this property will be 'false'.
  bool get isBlocked;
  @override

  /// The user's account last update date.
  ///
  /// Contains `Either<ValueFailure<DateTime> , DateTime>`.
  DuoDate get lastUpdate;
  @override

  /// The user's account creation date.
  ///
  /// Contains `Either<ValueFailure<DateTime> , DateTime>`.
  DuoDate get creationDate;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
