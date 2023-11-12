import 'package:flutter/material.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/styles/custom_colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: CustomColors.indigo,
      secondary: CustomColors.orange,
      tertiary: CustomColors.teal,
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
      color: CustomColors.cardLightColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: CustomColors.indigo,
      secondary: CustomColors.orange,
      tertiary: CustomColors.teal,
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
      color: CustomColors.cardDarkColor,
    ),
  );
}

extension ColorSchemeS on ColorScheme {
  Color get cardColor => brightness == Brightness.light
      ? CustomColors.cardLightColor
      : CustomColors.cardDarkColor;

  Color get glass => brightness == Brightness.light
      ? const Color(0xE6FFFFFF)
      : const Color(0xE621222F);

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
