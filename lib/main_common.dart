import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ringo_media_management/infrastructure/core/config_reader.dart';

Future<void> mainCommon(String env) async {
  // Always call this if the main method is asynchronous
  WidgetsFlutterBinding.ensureInitialized();

  // Load the JSON config into memory
  await ConfigReader.initialize(env);

  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: ConfigReader.apiKeyKey(),
        authDomain: ConfigReader.authDomainKey(),
        projectId: ConfigReader.projectIdKey(),
        storageBucket: ConfigReader.storageBucketKey(),
        messagingSenderId: ConfigReader.messagingSenderIdKey(),
        appId: ConfigReader.appIdKey(),
        measurementId: ConfigReader.measurementIdKey()),
  );
}
