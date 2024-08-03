import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_flow_menu_controller_event.freezed.dart';

/// This File will be documented in the next steps, covering both the `Presentation Layer` and `Application Layer`.
/// The `Domain Layer` and `Infrastructure Layer` have already been documented.
@freezed
abstract class UserFlowMenuControllerEvent with _$UserFlowMenuControllerEvent {
  const factory UserFlowMenuControllerEvent.updatePageIndex({required int index}) = UpdatePageIndex;
  const factory UserFlowMenuControllerEvent.toggleIsDrawerCollapsed() = ToggleIsDrawerCollapsed;
}
