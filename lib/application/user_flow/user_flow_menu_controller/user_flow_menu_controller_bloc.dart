import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import 'user_flow_menu_controller_event.dart';
import 'user_flow_menu_controller_state.dart';

/// This File will be documented in the next steps, covering both the `Presentation Layer` and `Application Layer`.
/// The `Domain Layer` and `Infrastructure Layer` have already been documented.
@LazySingleton()
class UserFlowMenuControllerBloc extends Bloc<UserFlowMenuControllerEvent, UserFlowMenuControllerState> {
  UserFlowMenuControllerBloc() : super(UserFlowMenuControllerState.initial()) {
    on<UpdatePageIndex>(_onUpdatePageIndex, transformer: restartable());
    on<ToggleIsDrawerCollapsed>(_onToggleIsDrawerCollapsed, transformer: restartable());
  }

  final PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  _onUpdatePageIndex(UpdatePageIndex event, Emitter<UserFlowMenuControllerState> emit) {
    emit(state.copyWith(
      currentPage: event.index,
    ));
  }

  _onToggleIsDrawerCollapsed(ToggleIsDrawerCollapsed event, Emitter<UserFlowMenuControllerState> emit) {
    emit(state.copyWith(
      isDrawerCollapsed: !state.isDrawerCollapsed,
    ));
  }
}
