import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:ringo_media_management/domain/auth_flow/user_model/user_model.dart';

part 'auth_state.freezed.dart';

/// This File will be documented in the next steps, covering both the `Presentation Layer` and `Application Layer`.
/// The `Domain Layer` and `Infrastructure Layer` have already been documented.
@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = Inital;
  const factory AuthState.shouldUpdateTheAppVersionFromStore({required VersionStatus appVersion}) = ShouldUpdateTheAppVersionFromStore;
  const factory AuthState.authenticated({required UserModel userModel}) = Authenticated;
  const factory AuthState.unauthenticated() = Unauthenticated;
}
