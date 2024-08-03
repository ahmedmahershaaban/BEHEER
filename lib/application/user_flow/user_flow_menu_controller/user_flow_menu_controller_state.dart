import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_flow_menu_controller_state.freezed.dart';

/// This File will be documented in the next steps, covering both the `Presentation Layer` and `Application Layer`.
/// The `Domain Layer` and `Infrastructure Layer` have already been documented.
@freezed
abstract class UserFlowMenuControllerState with _$UserFlowMenuControllerState {
  const factory UserFlowMenuControllerState({
    required int currentPage,
    required bool isDrawerCollapsed,
  }) = _UserFlowMenuControllerState;

  factory UserFlowMenuControllerState.initial() => const UserFlowMenuControllerState(
        currentPage: 0,
        isDrawerCollapsed: false,
      );
}
