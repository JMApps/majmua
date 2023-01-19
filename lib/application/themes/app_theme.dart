import 'package:flutter/material.dart';
import 'package:majmua/application/styles/app_widget_style.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.red,
    scaffoldBackgroundColor: const Color(0xFFE8EAF6),
    fontFamily: 'Nexa',
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Color(0xBF3F51B5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.elliptical(35, 20),
          bottomLeft: Radius.elliptical(35, 20),
        ),
      ),
      titleTextStyle: TextStyle(
        color: Color(0xFFFFFFFF),
        fontFamily: 'Nexa',
        fontSize: 18,
      ),
    ),
    cardTheme: const CardTheme(
      elevation: 0,
      color: Color(0x99FFFDE7),
      shape: AppWidgetStyle.mainRectangleBorder,
      margin: EdgeInsets.zero,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.orange,
    scaffoldBackgroundColor: const Color(0xFF171821),
    fontFamily: 'Nexa',
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Color(0x80232433),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.elliptical(35, 20),
          bottomLeft: Radius.elliptical(35, 20),
        ),
      ),
      titleTextStyle: TextStyle(
        color: Color(0xFFFFFFFF),
        fontFamily: 'Nexa',
        fontSize: 18,
      ),
    ),
    cardTheme: const CardTheme(
      elevation: 0,
      color: Color(0x80171821),
      shape: AppWidgetStyle.mainRectangleBorder,
      margin: EdgeInsets.zero,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
    ),
  );
}

extension ColorSchemeS on ColorScheme {
  Color get firstAppColor => brightness == Brightness.light
      ? const Color(0xD93F51B5)
      : const Color(0xD91D65A6);

  Color get secondAppColor => brightness == Brightness.light
      ? const Color(0xD9009688)
      : const Color(0xD972A2C0);

  Color get thirdAppColor => brightness == Brightness.light
      ? const Color(0xD9EF5350)
      : const Color(0xD9F2A104);

  Color get firstThirdColor => brightness == Brightness.light
      ? const Color(0xD93F51B5)
      : const Color(0xD9F2A104);

  Color get secondThirdColor => brightness == Brightness.light
      ? const Color(0xD9009688)
      : const Color(0xD9F2A104);

  Color get mainTextColor => brightness == Brightness.light
      ? const Color(0xD92D2D2D)
      : const Color(0xFFFFF8EE);

  Color get mainReverse => brightness == Brightness.light
      ? const Color(0xFFFFFFFF)
      : const Color(0xFF232433);

  Color get backgroundColorQ => brightness == Brightness.light
      ? const Color(0xFFFFFDE7)
      : const Color(0xFF171821);

  Color get glassOnGlassCardColor => brightness == Brightness.light
      ? const Color(0x80FFFDE7)
      : const Color(0xD905071E);
}
