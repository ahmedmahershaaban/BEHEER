import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ringo_media_management/infrastructure/core/injection/injection.config.dart';

final getIt = GetIt.instance;

/// Initializing [GetIt] for dependency injection.
@injectableInit
Future<void> configureInjection(String env) async {
  await getIt.init(environment: env);
}
