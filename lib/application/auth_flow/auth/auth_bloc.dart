import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:ringo_media_management/application/user_flow/user_flow_menu_controller/user_flow_menu_controller_bloc.dart';
import 'package:ringo_media_management/application/user_flow/user_flow_menu_controller/user_flow_menu_controller_event.dart';
import 'package:ringo_media_management/domain/auth_flow/auth_failure/auth_failure.dart';
import 'package:ringo_media_management/domain/auth_flow/i_auth_facade.dart';
import 'package:ringo_media_management/domain/auth_flow/user_model/user_model.dart';
import 'package:ringo_media_management/infrastructure/core/config_reader.dart';
import 'package:ringo_media_management/infrastructure/core/injection/injection.dart';

import 'auth_event.dart';
import 'auth_state.dart';

/// This File will be documented in the next steps, covering both the `Presentation Layer` and `Application Layer`.
/// The `Domain Layer` and `Infrastructure Layer` have already been documented.
@Singleton()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _iAuthFacade;

  Option<UserModel> userModelOption = none();

  /// Used [ConfigReader] to get the secret key depends on the environment we are using
  final newVersion = NewVersionPlus(
    androidId: ConfigReader.applicationIDKey(),
    iOSId: ConfigReader.applicationIDKey(),
  );
  Option<Either<bool, VersionStatus>> appVersionStatus = none();

  AuthBloc(
    this._iAuthFacade,
  ) : super(const AuthState.initial()) {
    on<AuthCheckRequest>((event, emit) async => await _onAuthCheckRequest(event, emit), transformer: restartable());
    on<UpdateUserModelStream>((event, emit) async => await _onUpdateUserModelStream(event, emit), transformer: restartable());
    on<CheckStoreVersion>((event, emit) async => await _onCheckStoreVersion(event, emit), transformer: restartable());
    on<SignedOut>((event, emit) async => await _onSignedOut(event, emit), transformer: droppable());
    on<SendEmailForSupport>(_onSendEmailForSupport, transformer: droppable());
  }

  _onAuthCheckRequest(AuthCheckRequest event, Emitter<AuthState> emit) async {
    final userIdOption = _iAuthFacade.getSignedInUserId();
    await userIdOption.fold(() {
      userModelOption = none();
      emit(const AuthState.unauthenticated());
    }, (userModel) async {
      add(const UpdateUserModelStream());
    });
  }

  _onUpdateUserModelStream(UpdateUserModelStream event, Emitter<AuthState> emit) async {
    emit(const AuthState.initial());
    await emit.forEach(
      _iAuthFacade.watchUserDate(),
      onData: (Either<AuthFailure, UserModel> newUserModelOption) {
        final emitState = newUserModelOption.fold((l) {
          userModelOption = none();
          return const AuthState.unauthenticated();
        }, (newUserModel) {
          userModelOption = some(newUserModel);
          return AuthState.authenticated(
            userModel: newUserModel,
          );
        });
        return emitState;
      },
      onError: (e, s) {
        userModelOption = none();
        return const AuthState.unauthenticated();
      },
    );
  }

  _onCheckStoreVersion(CheckStoreVersion event, Emitter<AuthState> emit) async {
    if (!kIsWeb) {
      try {
        final requestStatus = await newVersion.getVersionStatus();

        if (requestStatus == null) {
          appVersionStatus = some(left(false));
          add(const AuthEvent.authCheckRequest());
        } else {
          appVersionStatus = some(right(requestStatus));
          final storeVersion = requestStatus.storeVersion;
          final localVersion = requestStatus.localVersion;
          final storeVersionList = storeVersion.split('.').map<int>((e) => int.parse(e)).toList();
          final localVersionList = localVersion.split('.').map<int>((e) => int.parse(e)).toList();
          if (storeVersionList.length == 2) {
            storeVersionList.add(0);
          }
          // if the version number is X.X.Y >> X.X.Y will only compare the X.X and leave the Y for minor changes with out giving the user alert
          if (storeVersionList[0] > localVersionList[0] || storeVersionList[1] > localVersionList[1]) {
            emit(AuthState.shouldUpdateTheAppVersionFromStore(appVersion: requestStatus));
          } else {
            add(const AuthEvent.authCheckRequest());
          }
        }
      } catch (e) {
        appVersionStatus = some(left(false));
        add(const AuthEvent.authCheckRequest());
      }
    } else {
      add(const AuthEvent.authCheckRequest());
    }
  }

  _onSignedOut(SignedOut event, Emitter<AuthState> emit) async {
    emit(const AuthState.initial());
    await _iAuthFacade.signOutFromFirebaseOnly();
    _iAuthFacade.signOutFromAllExceptFirestore();
    userModelOption = none();

    // Clear the existing instance from GetIt
    await userModelOption.fold(() => null, (userModel) async {
      if (userModel.admin) {
        // await getIt.resetLazySingleton<AdminDashboardBloc>();
      } else {
        // await getIt.resetLazySingleton<UserFlowBloc>();
        getIt<UserFlowMenuControllerBloc>().pageController.jumpToPage(0);
        getIt<UserFlowMenuControllerBloc>().add(
          const UserFlowMenuControllerEvent.updatePageIndex(index: 0),
        );
      }
    });
  }

  _onSendEmailForSupport(SendEmailForSupport event, Emitter<AuthState> emit) async {
    try {
      await _iAuthFacade.sendEmailForSupport(message: event.msg);
    } catch (e) {
      debugPrint('Failed to send message for support in [AuthBloc] for [_onSendEmailForSupport] : $e');
    }
  }
}
