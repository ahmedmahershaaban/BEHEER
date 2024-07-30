// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_flow_menu_controller_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserFlowMenuControllerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) updatePageIndex,
    required TResult Function() toggleIsDrawerCollapsed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? updatePageIndex,
    TResult? Function()? toggleIsDrawerCollapsed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? updatePageIndex,
    TResult Function()? toggleIsDrawerCollapsed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdatePageIndex value) updatePageIndex,
    required TResult Function(ToggleIsDrawerCollapsed value)
        toggleIsDrawerCollapsed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdatePageIndex value)? updatePageIndex,
    TResult? Function(ToggleIsDrawerCollapsed value)? toggleIsDrawerCollapsed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdatePageIndex value)? updatePageIndex,
    TResult Function(ToggleIsDrawerCollapsed value)? toggleIsDrawerCollapsed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFlowMenuControllerEventCopyWith<$Res> {
  factory $UserFlowMenuControllerEventCopyWith(
          UserFlowMenuControllerEvent value,
          $Res Function(UserFlowMenuControllerEvent) then) =
      _$UserFlowMenuControllerEventCopyWithImpl<$Res,
          UserFlowMenuControllerEvent>;
}

/// @nodoc
class _$UserFlowMenuControllerEventCopyWithImpl<$Res,
        $Val extends UserFlowMenuControllerEvent>
    implements $UserFlowMenuControllerEventCopyWith<$Res> {
  _$UserFlowMenuControllerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UpdatePageIndexImplCopyWith<$Res> {
  factory _$$UpdatePageIndexImplCopyWith(_$UpdatePageIndexImpl value,
          $Res Function(_$UpdatePageIndexImpl) then) =
      __$$UpdatePageIndexImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$UpdatePageIndexImplCopyWithImpl<$Res>
    extends _$UserFlowMenuControllerEventCopyWithImpl<$Res,
        _$UpdatePageIndexImpl> implements _$$UpdatePageIndexImplCopyWith<$Res> {
  __$$UpdatePageIndexImplCopyWithImpl(
      _$UpdatePageIndexImpl _value, $Res Function(_$UpdatePageIndexImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$UpdatePageIndexImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UpdatePageIndexImpl implements UpdatePageIndex {
  const _$UpdatePageIndexImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'UserFlowMenuControllerEvent.updatePageIndex(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePageIndexImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePageIndexImplCopyWith<_$UpdatePageIndexImpl> get copyWith =>
      __$$UpdatePageIndexImplCopyWithImpl<_$UpdatePageIndexImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) updatePageIndex,
    required TResult Function() toggleIsDrawerCollapsed,
  }) {
    return updatePageIndex(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? updatePageIndex,
    TResult? Function()? toggleIsDrawerCollapsed,
  }) {
    return updatePageIndex?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? updatePageIndex,
    TResult Function()? toggleIsDrawerCollapsed,
    required TResult orElse(),
  }) {
    if (updatePageIndex != null) {
      return updatePageIndex(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdatePageIndex value) updatePageIndex,
    required TResult Function(ToggleIsDrawerCollapsed value)
        toggleIsDrawerCollapsed,
  }) {
    return updatePageIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdatePageIndex value)? updatePageIndex,
    TResult? Function(ToggleIsDrawerCollapsed value)? toggleIsDrawerCollapsed,
  }) {
    return updatePageIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdatePageIndex value)? updatePageIndex,
    TResult Function(ToggleIsDrawerCollapsed value)? toggleIsDrawerCollapsed,
    required TResult orElse(),
  }) {
    if (updatePageIndex != null) {
      return updatePageIndex(this);
    }
    return orElse();
  }
}

abstract class UpdatePageIndex implements UserFlowMenuControllerEvent {
  const factory UpdatePageIndex({required final int index}) =
      _$UpdatePageIndexImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$UpdatePageIndexImplCopyWith<_$UpdatePageIndexImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleIsDrawerCollapsedImplCopyWith<$Res> {
  factory _$$ToggleIsDrawerCollapsedImplCopyWith(
          _$ToggleIsDrawerCollapsedImpl value,
          $Res Function(_$ToggleIsDrawerCollapsedImpl) then) =
      __$$ToggleIsDrawerCollapsedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleIsDrawerCollapsedImplCopyWithImpl<$Res>
    extends _$UserFlowMenuControllerEventCopyWithImpl<$Res,
        _$ToggleIsDrawerCollapsedImpl>
    implements _$$ToggleIsDrawerCollapsedImplCopyWith<$Res> {
  __$$ToggleIsDrawerCollapsedImplCopyWithImpl(
      _$ToggleIsDrawerCollapsedImpl _value,
      $Res Function(_$ToggleIsDrawerCollapsedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ToggleIsDrawerCollapsedImpl implements ToggleIsDrawerCollapsed {
  const _$ToggleIsDrawerCollapsedImpl();

  @override
  String toString() {
    return 'UserFlowMenuControllerEvent.toggleIsDrawerCollapsed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleIsDrawerCollapsedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) updatePageIndex,
    required TResult Function() toggleIsDrawerCollapsed,
  }) {
    return toggleIsDrawerCollapsed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? updatePageIndex,
    TResult? Function()? toggleIsDrawerCollapsed,
  }) {
    return toggleIsDrawerCollapsed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? updatePageIndex,
    TResult Function()? toggleIsDrawerCollapsed,
    required TResult orElse(),
  }) {
    if (toggleIsDrawerCollapsed != null) {
      return toggleIsDrawerCollapsed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdatePageIndex value) updatePageIndex,
    required TResult Function(ToggleIsDrawerCollapsed value)
        toggleIsDrawerCollapsed,
  }) {
    return toggleIsDrawerCollapsed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdatePageIndex value)? updatePageIndex,
    TResult? Function(ToggleIsDrawerCollapsed value)? toggleIsDrawerCollapsed,
  }) {
    return toggleIsDrawerCollapsed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdatePageIndex value)? updatePageIndex,
    TResult Function(ToggleIsDrawerCollapsed value)? toggleIsDrawerCollapsed,
    required TResult orElse(),
  }) {
    if (toggleIsDrawerCollapsed != null) {
      return toggleIsDrawerCollapsed(this);
    }
    return orElse();
  }
}

abstract class ToggleIsDrawerCollapsed implements UserFlowMenuControllerEvent {
  const factory ToggleIsDrawerCollapsed() = _$ToggleIsDrawerCollapsedImpl;
}
