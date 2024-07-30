import 'package:freezed_annotation/freezed_annotation.dart';

part 'internet_connection_event.freezed.dart';

@freezed
abstract class InternetConnectionEvent with _$InternetConnectionEvent {
  const factory InternetConnectionEvent.registerListenerForDeviceConnectivity() = RegisterListenerForDeviceConnectivity;
  const factory InternetConnectionEvent.checkInternetConnection() = CheckInternetConnection;
}
