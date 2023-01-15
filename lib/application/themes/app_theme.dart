import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.indigo,
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
      color: Color(0x59171821),
    ),
  );
}

extension ColorSchemeS on ColorScheme {
  Color get firstAppColor => brightness == Brightness.light
      ? const Color(0xFF3F51B5)
      : const Color(0xFF1D65A6);

  Color get secondAppColor => brightness == Brightness.light
      ? const Color(0xFF009688)
      : const Color(0xFF72A2C0);

  Color get thirdAppColor => brightness == Brightness.light
      ? const Color(0xFFEF5350)
      : const Color(0xFFF2A104);

  Color get firstThirdColor => brightness == Brightness.light
      ? const Color(0xFF3F51B5)
      : const Color(0xFFF2A104);

  Color get secondThirdColor => brightness == Brightness.light
      ? const Color(0xFF009688)
      : const Color(0xFFF2A104);

  Color get mainTextColor => brightness == Brightness.light
      ? const Color(0xFF171821)
      : const Color(0xFFFFF8EE);

  Color get restTimeSeasonBackgroundColor => brightness == Brightness.light
      ? const Color(0xFFFFFFFF)
      : const Color(0xFF2C2D33);

  Color get weekDaysColor => brightness == Brightness.light
      ? const Color(0xFF009688)
      : const Color(0xFF72A2C0);

  Color get backgroundColorQ => brightness == Brightness.light
      ? const Color(0xFFFFFDE7)
      : const Color(0xFF171821);

  Color get glassOnGlassCardColor => brightness == Brightness.light
      ? const Color(0x40767680)
      : const Color(0xBF171821);
}
