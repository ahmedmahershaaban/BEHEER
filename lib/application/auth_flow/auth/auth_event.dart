import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.authCheckRequest() = AuthCheckRequest;
  const factory AuthEvent.signedOut() = SignedOut;
  const factory AuthEvent.internetConnectionChanged() = InternetConnectionChanged;
  const factory AuthEvent.updateUserModelStream() = UpdateUserModelStream;
  const factory AuthEvent.checkStoreVersion() = CheckStoreVersion;
  const factory AuthEvent.sendEmailForSupport({required String msg}) = SendEmailForSupport;
}
