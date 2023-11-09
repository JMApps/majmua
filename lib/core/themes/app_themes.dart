import 'package:flutter/material.dart';
import 'package:majmua/core/styles/app_styles.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: const Color(0xFF3F51B5),
      secondary: const Color(0xFF009688),
      tertiary: const Color(0xFFFF9800),
    ),
    fontFamily: 'Next',
    appBarTheme: const AppBarTheme(
      shape: AppStyles.bottomShape,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: 'Nexa',
        fontSize: 20,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color(0xFF3F51B5),
      secondary: const Color(0xFF009688),
      tertiary: const Color(0xFFFF9800),
    ),
    fontFamily: 'Next',
    appBarTheme: const AppBarTheme(
      shape: AppStyles.bottomShape,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: 'Nexa',
        fontSize: 20,
      ),
    ),
  );
}
