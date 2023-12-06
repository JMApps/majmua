import 'package:flutter/material.dart';
import 'package:majmua/core/styles/app_styles.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Nexa',
    useMaterial3: false,
    scaffoldBackgroundColor: const Color(0xFFE8EAF6),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: const Color(0xFF3F51B5),
    ),
    appBarTheme: const AppBarTheme(
      shape: AppStyles.bottomShape,
      backgroundColor: Color(0xFF3F51B5),
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
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: AppStyles.mardingHorizontal,
      alignLabelWithHint: true,
      floatingLabelAlignment: FloatingLabelAlignment.center,
      border: OutlineInputBorder(
        borderRadius: AppStyles.mainBorderRadius,
        borderSide: BorderSide(
          width: 0.5,
        ),
      ),
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
    fontFamily: 'Nexa',
    useMaterial3: false,
    scaffoldBackgroundColor: const Color(0xD9171821),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color(0xD93F51B5),
    ),
    appBarTheme: const AppBarTheme(
      shape: AppStyles.bottomShape,
      backgroundColor: Color(0xD93F51B5),
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
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: AppStyles.mardingHorizontal,
      alignLabelWithHint: true,
      floatingLabelAlignment: FloatingLabelAlignment.center,
      border: OutlineInputBorder(
        borderRadius: AppStyles.mainBorderRadius,
        borderSide: BorderSide(
          width: 0.5,
        ),
      ),
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
      : const Color(0xFF3949AB);

  Color get secondaryColor => brightness == Brightness.light
      ? const Color(0xFF009688)
      : const Color(0xFF00897B);

  Color get secterColor => brightness == Brightness.light
      ? const Color(0xFF009688)
      : const Color(0xBFF57C00);

  Color get tertiaryColor => brightness == Brightness.light
      ? const Color(0xFFFF9800)
      : const Color(0xBFF57C00);

  Color get quaternaryColor => brightness == Brightness.light
      ? const Color(0xFFEF5350)
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
