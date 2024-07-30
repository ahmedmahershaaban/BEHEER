import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_event.freezed.dart';

@freezed
abstract class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.themeChanged() = ThemeChanged;
  const factory ThemeEvent.initializeThemeData() = InitializeThemeData;
}
