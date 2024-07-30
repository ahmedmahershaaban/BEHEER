import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:ringo_media_management/infrastructure/core/injection/injection.dart';
import 'package:ringo_media_management/main_common.dart';
import 'package:ringo_media_management/presentation/core/app_config.dart';
import 'package:ringo_media_management/presentation/core/app_widget.dart';

Future<void> main() async {
  // Main init of the app and needed packages! for all the environment [Common Init]
  await mainCommon(Environment.test);

  // Continue Init the needed packages and loading of files

  // Init the environment specific
  await configureInjection(Environment.test);

  final configureApp = AppConfig(
    appTitle: '[QA] BEHEER',
    buildFlavor: Environment.test,
    iconAssets: 'assets/launcher_icon/qa/logo_only_qa.png',
    child: AppWidget(),
  );

  runApp(configureApp);
}
