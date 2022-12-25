import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    primarySwatch: Colors.indigo,
    scaffoldBackgroundColor: const Color(0xFFE8EAF6),
    fontFamily: 'Nexa',
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Color(0xFF3F51B5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.elliptical(35, 20),
          bottomLeft: Radius.elliptical(35, 20),
        )
      ),
    ),
  );

  static final darkTheme = ThemeData(primarySwatch: Colors.brown);
}

extension ColorSchemeS on ColorScheme {
  Color get mainBackground => brightness == Brightness.light
      ? const Color(0xff383864)
      : const Color(0xff2c2c34);
}
