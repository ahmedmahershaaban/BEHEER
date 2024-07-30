import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_flow_menu_controller_event.freezed.dart';

@freezed
abstract class UserFlowMenuControllerEvent with _$UserFlowMenuControllerEvent {
  const factory UserFlowMenuControllerEvent.updatePageIndex({required int index}) = UpdatePageIndex;
  const factory UserFlowMenuControllerEvent.toggleIsDrawerCollapsed() = ToggleIsDrawerCollapsed;
}
