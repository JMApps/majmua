import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/core/enums/app_theme.dart';
import 'package:majmua/core/strings/app_constraints.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class AppSettingsState extends ChangeNotifier {

  final Box _mainSettingsBox = Hive.box(AppConstraints.keyMainSettings);

  AppSettingsState() {
    _themeIndex = _mainSettingsBox.get(AppConstraints.keyCurrentThemeIndex, defaultValue: 0);
    _backgroundPictureIndex = _mainSettingsBox.get(AppConstraints.keyBackgroundPictureIndex, defaultValue: 0);
    _alwaysDisplay = _mainSettingsBox.get(AppConstraints.keyAlwaysDisplay, defaultValue: true);
    _alwaysDisplay ? WakelockPlus.enable() : WakelockPlus.disable();
  }

  late int _themeIndex;

  int get getThemeIndex => _themeIndex;

  AppTheme get getCurrentTheme {
    return _getCurrentTheme(_themeIndex);
  }

  set setCurrentTheme(AppTheme value) {
    _themeIndex = value.index;
    _mainSettingsBox.put(AppConstraints.keyCurrentThemeIndex, value.index);
    notifyListeners();
  }

  AppTheme _getCurrentTheme(int themeIndex) {
    late AppTheme currentTheme;
    switch (themeIndex) {
      case 0:
        currentTheme = AppTheme.light;
        break;
      case 1:
        currentTheme = AppTheme.dark;
        break;
      case 2:
        currentTheme = AppTheme.adaptive;
        break;
    }
    notifyListeners();
    return currentTheme;
  }

  int _backgroundPictureIndex = 0;

  int get getBackgroundPictureIndex => _backgroundPictureIndex;

  set setBackgroundPictureIndex(int backgroundPicIndex) {
    _backgroundPictureIndex = backgroundPicIndex;
    _mainSettingsBox.put(AppConstraints.keyBackgroundPictureIndex, backgroundPicIndex);
    notifyListeners();
  }

  bool _alwaysDisplay = true;

  bool get getAlwaysDisplay => _alwaysDisplay;

  set setAlwaysDisplay(bool value) {
    _alwaysDisplay = value;
    _mainSettingsBox.put(AppConstraints.keyAlwaysDisplay, value);
    value ? WakelockPlus.enable() : WakelockPlus.disable();
    notifyListeners();
  }
}
