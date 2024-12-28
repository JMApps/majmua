import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/strings/app_string_constraints.dart';

class AppSettingsState extends ChangeNotifier {
  final _appSettingsBox = Hive.box(AppStringConstraints.keyMainAppSettings);

  AppSettingsState() {
    _appLocaleIndex = _appSettingsBox.get(AppStringConstraints.keyAppLocaleIndex, defaultValue: _defaultLocaleIndex());
    _appThemeColor = Color(_appSettingsBox.get(AppStringConstraints.keyAppThemeColor, defaultValue: Colors.blue.value));
    _appThemeModeIndex = _appSettingsBox.get(AppStringConstraints.keyAppThemeModeIndex, defaultValue: 2);
  }

  int _defaultLocaleIndex() {
    final deviceLocale = PlatformDispatcher.instance.locale;
    switch (deviceLocale.languageCode) {
      case 'en':
        return 1;
      default:
        return 0;
    }
  }

  late int _appLocaleIndex;

  int get getAppLocaleIndex => _appLocaleIndex;

  set setAppLocaleIndex(int index) {
    if (_appLocaleIndex != index) {
      _appSettingsBox.put(AppStringConstraints.keyAppLocaleIndex, index);
      notifyListeners();
    }
  }

  late Color _appThemeColor;

  Color get getAppThemeColor => _appThemeColor;

  set setAppThemeColor(Color color) {
    if (_appThemeColor != color) {
      _appThemeColor = color;
      _appSettingsBox.put(AppStringConstraints.keyAppThemeColor, color.value);
      notifyListeners();
    }
  }

  late int _appThemeModeIndex;

  set setAppThemeModeIndex(int index) {
    if (_appThemeModeIndex != index) {
      _appThemeModeIndex = index;
      _appSettingsBox.put(AppStringConstraints.keyAppThemeModeIndex, index);
      notifyListeners();
    }
  }

  ThemeMode get getAppThemeMode {
    late final ThemeMode themeMode;
    switch (_appThemeModeIndex) {
      case 0:
        themeMode = ThemeMode.light;
        break;
      case 1:
        themeMode = ThemeMode.dark;
        break;
      case 2:
        themeMode = ThemeMode.system;
        break;
    }
    return themeMode;
  }
}
