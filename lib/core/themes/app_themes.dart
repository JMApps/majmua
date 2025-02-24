import 'package:flutter/material.dart';

import '../strings/app_string_constraints.dart';
import '../styles/app_styles.dart';

class AppThemes {
  final Color _appColor;

  AppThemes(this._appColor);

  ThemeData get lightTheme => _buildTheme(Brightness.light);

  ThemeData get darkTheme => _buildTheme(Brightness.dark);

  ThemeData _buildTheme(Brightness brightness) {
    final colorScheme = ColorScheme.fromSeed(
      brightness: brightness,
      seedColor: _appColor,
    );
    return ThemeData(
      fontFamily: AppStringConstraints.fontGilroy,
      fontFamilyFallback: const [AppStringConstraints.fontSFPro],
      colorScheme: colorScheme,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        showDragHandle: true,
      ),
      cardTheme: const CardTheme(
        elevation: 0.5,
        margin: EdgeInsets.zero,
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: AppStyles.mainBorderMini,
          border: Border.all(
            width: 1.0,
            color: colorScheme.primary,
          ),
        ),
        textStyle: AppStyles.mainTextStyleMicro,
      ),
    );
  }
}
