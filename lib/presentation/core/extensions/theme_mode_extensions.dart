import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ringo_media_management/application/core/theme/theme_bloc.dart';

extension DarkMode on BuildContext {
  /// Check dark mode
  bool get isDarkMode {
    return read<ThemeBloc>().state.isDarkMode;
  }
}
