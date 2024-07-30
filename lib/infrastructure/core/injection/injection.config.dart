// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:cloud_functions/cloud_functions.dart' as _i809;
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
import 'package:firebase_storage/firebase_storage.dart' as _i457;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i161;
import 'package:ringo_media_management/application/auth_flow/auth/auth_bloc.dart'
    as _i150;
import 'package:ringo_media_management/application/auth_flow/sign_in_sign_up_form/sign_in_sign_up_form_bloc.dart'
    as _i898;
import 'package:ringo_media_management/application/core/internet_connection/internet_connection_bloc.dart'
    as _i625;
import 'package:ringo_media_management/application/core/theme/theme_bloc.dart'
    as _i264;
import 'package:ringo_media_management/application/user_flow/user_flow/user_flow_bloc.dart'
    as _i837;
import 'package:ringo_media_management/application/user_flow/user_flow_menu_controller/user_flow_menu_controller_bloc.dart'
    as _i1047;
import 'package:ringo_media_management/domain/auth_flow/i_auth_facade.dart'
    as _i242;
import 'package:ringo_media_management/domain/user_flow/i_user_flow_facade.dart'
    as _i391;
import 'package:ringo_media_management/infrastructure/auth_flow/auth_facade.dart'
    as _i775;
import 'package:ringo_media_management/infrastructure/core/firebase_injectable_module.dart'
    as _i979;
import 'package:ringo_media_management/infrastructure/core/third_party_libraries_module.dart'
    as _i792;
import 'package:ringo_media_management/infrastructure/user_flow/user_flow_facade.dart'
    as _i590;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final thirdPartyLibrariesModule = _$ThirdPartyLibrariesModule();
    final firebaseInjectableModule = _$FirebaseInjectableModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => thirdPartyLibrariesModule.sharedPreference,
      preResolve: true,
    );
    gh.lazySingleton<_i1047.UserFlowMenuControllerBloc>(
        () => _i1047.UserFlowMenuControllerBloc());
    gh.lazySingleton<_i974.FirebaseFirestore>(
        () => firebaseInjectableModule.firebaseFirestore);
    gh.lazySingleton<_i59.FirebaseAuth>(
        () => firebaseInjectableModule.firebaseAuth);
    gh.lazySingleton<_i809.FirebaseFunctions>(
        () => firebaseInjectableModule.firebaseFunctions);
    gh.lazySingleton<_i457.FirebaseStorage>(
        () => firebaseInjectableModule.firebaseStorage);
    gh.lazySingleton<_i892.FirebaseMessaging>(
        () => firebaseInjectableModule.firebaseMessaging);
    gh.lazySingleton<_i116.GoogleSignIn>(
        () => thirdPartyLibrariesModule.googleSignIn);
    gh.lazySingleton<_i895.Connectivity>(
        () => thirdPartyLibrariesModule.connectivity);
    gh.lazySingleton<_i161.InternetConnection>(
        () => thirdPartyLibrariesModule.internetConnection);
    gh.lazySingleton<_i391.IUserFlowFacade>(() => _i590.UserFlowFacade(
          gh<_i974.FirebaseFirestore>(),
          gh<_i161.InternetConnection>(),
        ));
    gh.lazySingleton<_i242.IAuthFacade>(() => _i775.AuthFacade(
          gh<_i59.FirebaseAuth>(),
          gh<_i974.FirebaseFirestore>(),
          gh<_i892.FirebaseMessaging>(),
          gh<_i809.FirebaseFunctions>(),
          gh<_i161.InternetConnection>(),
          gh<_i116.GoogleSignIn>(),
        ));
    gh.singleton<_i625.InternetConnectionBloc>(
        () => _i625.InternetConnectionBloc(
              gh<_i895.Connectivity>(),
              gh<_i161.InternetConnection>(),
            ));
    gh.lazySingleton<_i264.ThemeBloc>(
        () => _i264.ThemeBloc(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i837.UserFlowBloc>(
        () => _i837.UserFlowBloc(gh<_i391.IUserFlowFacade>()));
    gh.factory<_i898.SignInSignUpFormBloc>(
        () => _i898.SignInSignUpFormBloc(gh<_i242.IAuthFacade>()));
    gh.singleton<_i150.AuthBloc>(() => _i150.AuthBloc(gh<_i242.IAuthFacade>()));
    return this;
  }
}

class _$ThirdPartyLibrariesModule extends _i792.ThirdPartyLibrariesModule {}

class _$FirebaseInjectableModule extends _i979.FirebaseInjectableModule {}
