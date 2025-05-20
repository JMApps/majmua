import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../core/strings/app_string_constraints.dart';

class AppSettingsState extends ChangeNotifier {
  final _appSettingsBox = Hive.box(AppStringConstraints.keyMainAppSettings);

  AppSettingsState() {
    _appLocaleIndex = _appSettingsBox.get(AppStringConstraints.keyAppLocaleIndex, defaultValue: _defaultLocaleIndex());
    _appThemeColor = Color(_appSettingsBox.get(AppStringConstraints.keyAppThemeColor, defaultValue: Colors.indigo.toARGB32()));
    _appThemeModeIndex = _appSettingsBox.get(AppStringConstraints.keyAppThemeModeIndex, defaultValue: 2);
    _wakeLockState = _appSettingsBox.get(AppStringConstraints.keyWakeLock, defaultValue: true);
    _wakeLockState ? WakelockPlus.enable() : WakelockPlus.disable();
    _dayLengthState = _appSettingsBox.get(AppStringConstraints.keyDayLength, defaultValue: true);
  }

  late int _appLocaleIndex;

  int get getAppLocaleIndex => _appLocaleIndex;

  set setAppLocaleIndex(int index) {
    if (_appLocaleIndex != index) {
      _appLocaleIndex = index;
      _appSettingsBox.put(AppStringConstraints.keyAppLocaleIndex, index);
      notifyListeners();
    }
  }

  late int _appThemeModeIndex;

  int get appThemeModeIndex => _appThemeModeIndex;

  set appThemeModeIndex(int index) {
    if (_appThemeModeIndex != index) {
      _appThemeModeIndex = index;
      _appSettingsBox.put(AppStringConstraints.keyAppThemeModeIndex, index);
      notifyListeners();
    }
  }

  ThemeMode get appThemeMode {
    switch (_appThemeModeIndex) {
      case 0: return ThemeMode.light;
      case 1: return ThemeMode.dark;
      case 2: return ThemeMode.system;
      default: return ThemeMode.system;
    }
  }

  Color _appThemeColor = Colors.indigo;

  Color get appThemeColor => _appThemeColor;

  set appThemeColor(Color color) {
    if (_appThemeColor != color) {
      _appThemeColor = color;
      _appSettingsBox.put(AppStringConstraints.keyAppThemeColor, color.toARGB32());
      notifyListeners();
    }
  }

  bool _wakeLockState = true;

  bool get wakeLockState => _wakeLockState;

  set wakeLockState(bool state) {
    _wakeLockState = state;
    _wakeLockState ? WakelockPlus.enable() : WakelockPlus.disable();
    _appSettingsBox.put(AppStringConstraints.keyWakeLock, state);
    notifyListeners();
  }

  bool _dayLengthState = true;

  bool get dayLengthState => _dayLengthState;

  set dayLengthState(bool state) {
    _dayLengthState = state;
    _appSettingsBox.put(AppStringConstraints.keyDayLength, state);
    notifyListeners();
  }

  int _defaultLocaleIndex() {
    final deviceLocale = PlatformDispatcher.instance.locale;
    switch (deviceLocale.languageCode) {
      case 'en':
        return 1;
      case 'kz':
        return 2;
      case 'ky':
        return 3;
      default:
        return 0;
    }
  }
}
