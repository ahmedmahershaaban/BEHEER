import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_flow_failure.freezed.dart';

@freezed
abstract class UserFlowFailure with _$UserFlowFailure {
  /// We could increase these failures depends on any errors or exceptions we want to add
  ///
  const factory UserFlowFailure.serverError() = ServerError;
  const factory UserFlowFailure.noInternetConnection() = NoInternetConnection;
  const factory UserFlowFailure.insufficientPermission() = InsufficientPermission;
  const factory UserFlowFailure.notImplementedFeature() = NotImplementedFeature;
}

String getUserFlowFailureString(UserFlowFailure value) {
  return value.map(
    serverError: (_) => 'Server Error!',
    noInternetConnection: (_) => 'No Internet Connection!',
    insufficientPermission: (_) => "You don't have enough permission!",
    notImplementedFeature: (_) => 'We are developing this feature, wait for the next update!',
  );
}
