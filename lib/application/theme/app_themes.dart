import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    primarySwatch: Colors.indigo,
    scaffoldBackgroundColor: const Color(0xFFE8EAF6),
    fontFamily: 'Nexa',
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Color(0xFF3F51B5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.elliptical(35, 20),
          bottomLeft: Radius.elliptical(35, 20),
        ),
      ),
      titleTextStyle: TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 18,
        fontFamily: 'Nexa',
      ),
    ),
    cardColor: const Color(0xFFFFFFFF),
  );

  static final darkTheme = ThemeData(
    primarySwatch: Colors.orange,
    scaffoldBackgroundColor: const Color(0xFF171821),
    fontFamily: 'Nexa',
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Color(0xFF232433),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.elliptical(35, 20),
          bottomLeft: Radius.elliptical(35, 20),
        ),
      ),
      titleTextStyle: TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 18,
        fontFamily: 'Nexa',
      ),
    ),
    cardColor: const Color(0xFF2C2D33),
  );
}

extension ColorSchemeS on ColorScheme {
  Color get firstAppColor => brightness == Brightness.light
      ? const Color(0xFF3F51B5)
      : const Color(0xFF303F9F);

  Color get secondAppColor => brightness == Brightness.light
      ? const Color(0xFF009688)
      : const Color(0xFF00695C);

  Color get thirdAppColor => brightness == Brightness.light
      ? const Color(0xFFFF5722)
      : const Color(0xFFFF9800);

  Color get firstThirdColor => brightness == Brightness.light
      ? const Color(0xFF3F51B5)
      : const Color(0xFFFF9800);

  Color get secondThirdColor => brightness == Brightness.light
      ? const Color(0xFF009688)
      : const Color(0xFFFF9800);

  Color get mainTextColor => brightness == Brightness.light
      ? const Color(0xFF171821)
      : const Color(0xBEFFFFFF);

  Color get circleAvatarBackgroundColor => brightness == Brightness.light
      ? const Color(0xFFFFFFFF)
      : const Color(0xFF232433);

  Color get weekDaysColor => brightness == Brightness.light
      ? const Color(0xFF009688)
      : const Color(0xFF7986CB);
}
