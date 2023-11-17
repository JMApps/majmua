import 'package:flutter/material.dart';
import 'package:majmua/core/styles/app_styles.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: const Color(0xFF3F51B5),
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
    cardTheme: const CardTheme(
      shape: AppStyles.mainShape,
      elevation: 0,
      color: Color(0xD9E8EAF6),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      showDragHandle: true,
      backgroundColor: Color(0xD9E8EAF6),
      dragHandleSize: Size(64, 3),
      shape: AppStyles.mainShape,
    ),
    listTileTheme: const ListTileThemeData(
      shape: AppStyles.mainShape,
      titleTextStyle: TextStyle(
        fontFamily: 'Nexa',
        fontSize: 15,
        color: Colors.black,
      ),
      subtitleTextStyle: TextStyle(
        fontFamily: 'Nexa',
        fontSize: 14,
        color: Colors.black,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color(0xD93F51B5),
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
    cardTheme: const CardTheme(
      shape: AppStyles.mainShape,
      elevation: 0,
      color: Color(0xD9171821),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      showDragHandle: true,
      backgroundColor: Color(0xD9171821),
      dragHandleSize: Size(64, 3),
      shape: AppStyles.mainShape,
    ),
    listTileTheme: const ListTileThemeData(
      shape: AppStyles.mainShape,
      titleTextStyle: TextStyle(
        fontFamily: 'Nexa',
        fontSize: 15,
        color: Colors.white,
      ),
      subtitleTextStyle: TextStyle(
        fontFamily: 'Nexa',
        fontSize: 14,
        color: Colors.white,
      ),
    ),
  );
}

extension ColorSchemeS on ColorScheme {
  Color get primaryColor => brightness == Brightness.light
      ? const Color(0xFF3F51B5)
      : const Color(0xBF303F9F);

  Color get secondaryColor => brightness == Brightness.light
      ? const Color(0xFF009688)
      : const Color(0xBF00796B);

  Color get tertiaryColor => brightness == Brightness.light
      ? const Color(0xFFFF9800)
      : const Color(0xBFF57C00);

Color get quaternaryColor => brightness == Brightness.light
      ? const Color(0xFFF44336)
      : const Color(0xBFD32F2F);

  Color get glass => brightness == Brightness.light
      ? const Color(0xE6FFFFFF)
      : const Color(0xE60D0F1C);

  Color get springColor => brightness == Brightness.light
      ? const Color(0xFF43A047)
      : const Color(0xD91B5E20);

  Color get summerColor => brightness == Brightness.light
      ? const Color(0xFF00897B)
      : const Color(0xD9004D40);

  Color get fallColor => brightness == Brightness.light
      ? const Color(0xFFFB8C00)
      : const Color(0xD9E65100);

  Color get winterColor => brightness == Brightness.light
      ? const Color(0xFF1E88E5)
      : const Color(0xD90D47A1);
}
