import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

abstract class ConfigReader {
  static Map<String, dynamic> _config = {};

  static Future<void> initialize(String env) async {
    String path = "config/app_config_prod.json";
    switch (env) {
      case Environment.prod:
        path = "config/app_config_prod.json";
      case Environment.dev:
        path = "config/app_config_dev.json";
      case Environment.test:
        path = "config/app_config_qa.json";
    }
    final configString = await rootBundle.loadString(path);
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  static String apiKeyKey() {
    return _config['apiKey'] as String;
  }

  static String authDomainKey() {
    return _config['authDomain'] as String;
  }

  static String projectIdKey() {
    return _config['projectId'] as String;
  }

  static String storageBucketKey() {
    return _config['storageBucket'] as String;
  }

  static String messagingSenderIdKey() {
    return _config['messagingSenderId'] as String;
  }

  static String appIdKey() {
    return _config['appId'] as String;
  }

  static String measurementIdKey() {
    return _config['measurementId'] as String;
  }

  static String applicationIDKey() {
    return _config['applicationID'] as String;
  }
}
