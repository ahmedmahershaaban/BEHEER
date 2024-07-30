import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_flow_menu_controller_state.freezed.dart';

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
