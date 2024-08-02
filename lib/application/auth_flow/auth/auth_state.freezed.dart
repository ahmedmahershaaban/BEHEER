// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(VersionStatus appVersion)
        shouldUpdateTheAppVersionFromStore,
    required TResult Function(UserModel userModel) authenticated,
    required TResult Function() unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(VersionStatus appVersion)?
        shouldUpdateTheAppVersionFromStore,
    TResult? Function(UserModel userModel)? authenticated,
    TResult? Function()? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(VersionStatus appVersion)?
        shouldUpdateTheAppVersionFromStore,
    TResult Function(UserModel userModel)? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Inital value) initial,
    required TResult Function(ShouldUpdateTheAppVersionFromStore value)
        shouldUpdateTheAppVersionFromStore,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Inital value)? initial,
    TResult? Function(ShouldUpdateTheAppVersionFromStore value)?
        shouldUpdateTheAppVersionFromStore,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Inital value)? initial,
    TResult Function(ShouldUpdateTheAppVersionFromStore value)?
        shouldUpdateTheAppVersionFromStore,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitalImplCopyWith<$Res> {
  factory _$$InitalImplCopyWith(
          _$InitalImpl value, $Res Function(_$InitalImpl) then) =
      __$$InitalImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitalImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$InitalImpl>
    implements _$$InitalImplCopyWith<$Res> {
  __$$InitalImplCopyWithImpl(
      _$InitalImpl _value, $Res Function(_$InitalImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitalImpl implements Inital {
  const _$InitalImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitalImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(VersionStatus appVersion)
        shouldUpdateTheAppVersionFromStore,
    required TResult Function(UserModel userModel) authenticated,
    required TResult Function() unauthenticated,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(VersionStatus appVersion)?
        shouldUpdateTheAppVersionFromStore,
    TResult? Function(UserModel userModel)? authenticated,
    TResult? Function()? unauthenticated,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(VersionStatus appVersion)?
        shouldUpdateTheAppVersionFromStore,
    TResult Function(UserModel userModel)? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Inital value) initial,
    required TResult Function(ShouldUpdateTheAppVersionFromStore value)
        shouldUpdateTheAppVersionFromStore,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Inital value)? initial,
    TResult? Function(ShouldUpdateTheAppVersionFromStore value)?
        shouldUpdateTheAppVersionFromStore,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Inital value)? initial,
    TResult Function(ShouldUpdateTheAppVersionFromStore value)?
        shouldUpdateTheAppVersionFromStore,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Inital implements AuthState {
  const factory Inital() = _$InitalImpl;
}

/// @nodoc
abstract class _$$ShouldUpdateTheAppVersionFromStoreImplCopyWith<$Res> {
  factory _$$ShouldUpdateTheAppVersionFromStoreImplCopyWith(
          _$ShouldUpdateTheAppVersionFromStoreImpl value,
          $Res Function(_$ShouldUpdateTheAppVersionFromStoreImpl) then) =
      __$$ShouldUpdateTheAppVersionFromStoreImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VersionStatus appVersion});
}

/// @nodoc
class __$$ShouldUpdateTheAppVersionFromStoreImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res,
        _$ShouldUpdateTheAppVersionFromStoreImpl>
    implements _$$ShouldUpdateTheAppVersionFromStoreImplCopyWith<$Res> {
  __$$ShouldUpdateTheAppVersionFromStoreImplCopyWithImpl(
      _$ShouldUpdateTheAppVersionFromStoreImpl _value,
      $Res Function(_$ShouldUpdateTheAppVersionFromStoreImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appVersion = null,
  }) {
    return _then(_$ShouldUpdateTheAppVersionFromStoreImpl(
      appVersion: null == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as VersionStatus,
    ));
  }
}

/// @nodoc

class _$ShouldUpdateTheAppVersionFromStoreImpl
    implements ShouldUpdateTheAppVersionFromStore {
  const _$ShouldUpdateTheAppVersionFromStoreImpl({required this.appVersion});

  @override
  final VersionStatus appVersion;

  @override
  String toString() {
    return 'AuthState.shouldUpdateTheAppVersionFromStore(appVersion: $appVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShouldUpdateTheAppVersionFromStoreImpl &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appVersion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShouldUpdateTheAppVersionFromStoreImplCopyWith<
          _$ShouldUpdateTheAppVersionFromStoreImpl>
      get copyWith => __$$ShouldUpdateTheAppVersionFromStoreImplCopyWithImpl<
          _$ShouldUpdateTheAppVersionFromStoreImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(VersionStatus appVersion)
        shouldUpdateTheAppVersionFromStore,
    required TResult Function(UserModel userModel) authenticated,
    required TResult Function() unauthenticated,
  }) {
    return shouldUpdateTheAppVersionFromStore(appVersion);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(VersionStatus appVersion)?
        shouldUpdateTheAppVersionFromStore,
    TResult? Function(UserModel userModel)? authenticated,
    TResult? Function()? unauthenticated,
  }) {
    return shouldUpdateTheAppVersionFromStore?.call(appVersion);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(VersionStatus appVersion)?
        shouldUpdateTheAppVersionFromStore,
    TResult Function(UserModel userModel)? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (shouldUpdateTheAppVersionFromStore != null) {
      return shouldUpdateTheAppVersionFromStore(appVersion);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Inital value) initial,
    required TResult Function(ShouldUpdateTheAppVersionFromStore value)
        shouldUpdateTheAppVersionFromStore,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
  }) {
    return shouldUpdateTheAppVersionFromStore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Inital value)? initial,
    TResult? Function(ShouldUpdateTheAppVersionFromStore value)?
        shouldUpdateTheAppVersionFromStore,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
  }) {
    return shouldUpdateTheAppVersionFromStore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Inital value)? initial,
    TResult Function(ShouldUpdateTheAppVersionFromStore value)?
        shouldUpdateTheAppVersionFromStore,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (shouldUpdateTheAppVersionFromStore != null) {
      return shouldUpdateTheAppVersionFromStore(this);
    }
    return orElse();
  }
}

abstract class ShouldUpdateTheAppVersionFromStore implements AuthState {
  const factory ShouldUpdateTheAppVersionFromStore(
          {required final VersionStatus appVersion}) =
      _$ShouldUpdateTheAppVersionFromStoreImpl;

  VersionStatus get appVersion;
  @JsonKey(ignore: true)
  _$$ShouldUpdateTheAppVersionFromStoreImplCopyWith<
          _$ShouldUpdateTheAppVersionFromStoreImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthenticatedImplCopyWith<$Res> {
  factory _$$AuthenticatedImplCopyWith(
          _$AuthenticatedImpl value, $Res Function(_$AuthenticatedImpl) then) =
      __$$AuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel userModel});

  $UserModelCopyWith<$Res> get userModel;
}

/// @nodoc
class __$$AuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthenticatedImpl>
    implements _$$AuthenticatedImplCopyWith<$Res> {
  __$$AuthenticatedImplCopyWithImpl(
      _$AuthenticatedImpl _value, $Res Function(_$AuthenticatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userModel = null,
  }) {
    return _then(_$AuthenticatedImpl(
      userModel: null == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get userModel {
    return $UserModelCopyWith<$Res>(_value.userModel, (value) {
      return _then(_value.copyWith(userModel: value));
    });
  }
}

/// @nodoc

class _$AuthenticatedImpl implements Authenticated {
  const _$AuthenticatedImpl({required this.userModel});

  @override
  final UserModel userModel;

  @override
  String toString() {
    return 'AuthState.authenticated(userModel: $userModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatedImpl &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatedImplCopyWith<_$AuthenticatedImpl> get copyWith =>
      __$$AuthenticatedImplCopyWithImpl<_$AuthenticatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(VersionStatus appVersion)
        shouldUpdateTheAppVersionFromStore,
    required TResult Function(UserModel userModel) authenticated,
    required TResult Function() unauthenticated,
  }) {
    return authenticated(userModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(VersionStatus appVersion)?
        shouldUpdateTheAppVersionFromStore,
    TResult? Function(UserModel userModel)? authenticated,
    TResult? Function()? unauthenticated,
  }) {
    return authenticated?.call(userModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(VersionStatus appVersion)?
        shouldUpdateTheAppVersionFromStore,
    TResult Function(UserModel userModel)? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(userModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Inital value) initial,
    required TResult Function(ShouldUpdateTheAppVersionFromStore value)
        shouldUpdateTheAppVersionFromStore,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Inital value)? initial,
    TResult? Function(ShouldUpdateTheAppVersionFromStore value)?
        shouldUpdateTheAppVersionFromStore,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Inital value)? initial,
    TResult Function(ShouldUpdateTheAppVersionFromStore value)?
        shouldUpdateTheAppVersionFromStore,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class Authenticated implements AuthState {
  const factory Authenticated({required final UserModel userModel}) =
      _$AuthenticatedImpl;

  UserModel get userModel;
  @JsonKey(ignore: true)
  _$$AuthenticatedImplCopyWith<_$AuthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthenticatedImplCopyWith<$Res> {
  factory _$$UnauthenticatedImplCopyWith(_$UnauthenticatedImpl value,
          $Res Function(_$UnauthenticatedImpl) then) =
      __$$UnauthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$UnauthenticatedImpl>
    implements _$$UnauthenticatedImplCopyWith<$Res> {
  __$$UnauthenticatedImplCopyWithImpl(
      _$UnauthenticatedImpl _value, $Res Function(_$UnauthenticatedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnauthenticatedImpl implements Unauthenticated {
  const _$UnauthenticatedImpl();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnauthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(VersionStatus appVersion)
        shouldUpdateTheAppVersionFromStore,
    required TResult Function(UserModel userModel) authenticated,
    required TResult Function() unauthenticated,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(VersionStatus appVersion)?
        shouldUpdateTheAppVersionFromStore,
    TResult? Function(UserModel userModel)? authenticated,
    TResult? Function()? unauthenticated,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(VersionStatus appVersion)?
        shouldUpdateTheAppVersionFromStore,
    TResult Function(UserModel userModel)? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Inital value) initial,
    required TResult Function(ShouldUpdateTheAppVersionFromStore value)
        shouldUpdateTheAppVersionFromStore,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Inital value)? initial,
    TResult? Function(ShouldUpdateTheAppVersionFromStore value)?
        shouldUpdateTheAppVersionFromStore,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Inital value)? initial,
    TResult Function(ShouldUpdateTheAppVersionFromStore value)?
        shouldUpdateTheAppVersionFromStore,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class Unauthenticated implements AuthState {
  const factory Unauthenticated() = _$UnauthenticatedImpl;
}
