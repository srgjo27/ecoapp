import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColorsTheme.background,
    colorScheme: const ColorScheme.light(
      primary: AppColorsTheme.primaryDark,
      secondary: AppColorsTheme.secondary,
      surface: AppColorsTheme.background,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
  );
}
