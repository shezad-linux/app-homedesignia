import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:HomeDesignia/app/core/theme/themes.dart';

class AppTheme {
  /// for getting light theme
  ThemeData get lightTheme {
    return appLightTheme;
  }

  /// for getting dark theme
  ThemeData get darkTheme {
    return appLightTheme.copyWith(brightness: Brightness.dark);
  }
}

/// for providing app theme [AppTheme]
final appThemeProvider = Provider<AppTheme>((_) => AppTheme());
