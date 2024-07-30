// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_flow_menu_controller_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserFlowMenuControllerState {
  int get currentPage => throw _privateConstructorUsedError;
  bool get isDrawerCollapsed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserFlowMenuControllerStateCopyWith<UserFlowMenuControllerState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFlowMenuControllerStateCopyWith<$Res> {
  factory $UserFlowMenuControllerStateCopyWith(
          UserFlowMenuControllerState value,
          $Res Function(UserFlowMenuControllerState) then) =
      _$UserFlowMenuControllerStateCopyWithImpl<$Res,
          UserFlowMenuControllerState>;
  @useResult
  $Res call({int currentPage, bool isDrawerCollapsed});
}

/// @nodoc
class _$UserFlowMenuControllerStateCopyWithImpl<$Res,
        $Val extends UserFlowMenuControllerState>
    implements $UserFlowMenuControllerStateCopyWith<$Res> {
  _$UserFlowMenuControllerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? isDrawerCollapsed = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      isDrawerCollapsed: null == isDrawerCollapsed
          ? _value.isDrawerCollapsed
          : isDrawerCollapsed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserFlowMenuControllerStateImplCopyWith<$Res>
    implements $UserFlowMenuControllerStateCopyWith<$Res> {
  factory _$$UserFlowMenuControllerStateImplCopyWith(
          _$UserFlowMenuControllerStateImpl value,
          $Res Function(_$UserFlowMenuControllerStateImpl) then) =
      __$$UserFlowMenuControllerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentPage, bool isDrawerCollapsed});
}

/// @nodoc
class __$$UserFlowMenuControllerStateImplCopyWithImpl<$Res>
    extends _$UserFlowMenuControllerStateCopyWithImpl<$Res,
        _$UserFlowMenuControllerStateImpl>
    implements _$$UserFlowMenuControllerStateImplCopyWith<$Res> {
  __$$UserFlowMenuControllerStateImplCopyWithImpl(
      _$UserFlowMenuControllerStateImpl _value,
      $Res Function(_$UserFlowMenuControllerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? isDrawerCollapsed = null,
  }) {
    return _then(_$UserFlowMenuControllerStateImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      isDrawerCollapsed: null == isDrawerCollapsed
          ? _value.isDrawerCollapsed
          : isDrawerCollapsed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UserFlowMenuControllerStateImpl
    implements _UserFlowMenuControllerState {
  const _$UserFlowMenuControllerStateImpl(
      {required this.currentPage, required this.isDrawerCollapsed});

  @override
  final int currentPage;
  @override
  final bool isDrawerCollapsed;

  @override
  String toString() {
    return 'UserFlowMenuControllerState(currentPage: $currentPage, isDrawerCollapsed: $isDrawerCollapsed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserFlowMenuControllerStateImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.isDrawerCollapsed, isDrawerCollapsed) ||
                other.isDrawerCollapsed == isDrawerCollapsed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentPage, isDrawerCollapsed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserFlowMenuControllerStateImplCopyWith<_$UserFlowMenuControllerStateImpl>
      get copyWith => __$$UserFlowMenuControllerStateImplCopyWithImpl<
          _$UserFlowMenuControllerStateImpl>(this, _$identity);
}

abstract class _UserFlowMenuControllerState
    implements UserFlowMenuControllerState {
  const factory _UserFlowMenuControllerState(
          {required final int currentPage,
          required final bool isDrawerCollapsed}) =
      _$UserFlowMenuControllerStateImpl;

  @override
  int get currentPage;
  @override
  bool get isDrawerCollapsed;
  @override
  @JsonKey(ignore: true)
  _$$UserFlowMenuControllerStateImplCopyWith<_$UserFlowMenuControllerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
