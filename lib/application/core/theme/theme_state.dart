import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';

part 'theme_state.freezed.dart';

/// This File will be documented in the next steps, covering both the `Presentation Layer` and `Application Layer`.
/// The `Domain Layer` and `Infrastructure Layer` have already been documented.
@freezed
abstract class ThemeState with _$ThemeState {
  const factory ThemeState({
    required ThemeData themeData,
    required bool isDarkMode,
  }) = _ThemeState;
  factory ThemeState.initial() => ThemeState(
        themeData: appThemeData[AppTheme.light]!,
        isDarkMode: appThemeData[AppTheme.light]!.brightness == Brightness.dark,
      );
}
