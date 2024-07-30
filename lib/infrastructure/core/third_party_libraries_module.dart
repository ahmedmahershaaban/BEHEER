import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class ThirdPartyLibrariesModule {
  @lazySingleton
  GoogleSignIn get googleSignIn => GoogleSignIn();

  /// We could all the rest of login platforms here
  // @lazySingleton
  // FacebookAuth get facebookLogin => FacebookAuth.instance;

  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @lazySingleton
  InternetConnection get internetConnection => InternetConnection();

  @preResolve
  Future<SharedPreferences> get sharedPreference => SharedPreferences.getInstance();
}
