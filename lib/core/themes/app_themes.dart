import 'package:flutter/material.dart';

import '../strings/app_string_constraints.dart';
import '../styles/app_styles.dart';

class AppThemes {
  final Color _appColor;

  final String _appFont;

  AppThemes(this._appColor, this._appFont);

  ThemeData get lightTheme => _buildTheme(Brightness.light);

  ThemeData get darkTheme => _buildTheme(Brightness.dark);

  ThemeData _buildTheme(Brightness brightness) {
    final colorScheme = ColorScheme.fromSeed(
      brightness: brightness,
      seedColor: _appColor,
    );
    return ThemeData(
      fontFamily: _appFont,
      fontFamilyFallback: const [
        AppStringConstraints.fontSFPro,
        AppStringConstraints.fontArial,
      ],
      colorScheme: colorScheme,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        showDragHandle: true,
      ),
      cardTheme: const CardThemeData(
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
        textStyle: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 14.0,
          fontFamily: AppStringConstraints.fontGilroy,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        )
      )
    );
  }
}
