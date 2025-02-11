import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/strings/app_string_constraints.dart';

class SurahSettingsState with ChangeNotifier {
  final Box _mainSettingsBox = Hive.box(AppStringConstraints.keyMainAppSettings);

  SurahSettingsState() {
    _warmthValue = _mainSettingsBox.get(AppStringConstraints.keySurahsBackgroundWarmth, defaultValue: 0.0);
    _fontContrast = _mainSettingsBox.get(AppStringConstraints.keyFontContrast, defaultValue: 100.0);
  }

  bool _appBarIsVisible = true;

  late double _warmthValue = 0.0;

  late double _fontContrast = 100.0;

  bool get getAppBarIsVisible => _appBarIsVisible;

  double get getWarmthValue => _warmthValue;

  double get getFontContrast => _fontContrast;

  set setAppBarIsVisible(bool value) {
    _appBarIsVisible = value;
    notifyListeners();
  }

  set setWarmthValue(double value) {
    _warmthValue = value;
    _mainSettingsBox.put(AppStringConstraints.keySurahsBackgroundWarmth, value);
    notifyListeners();
  }

  set setFontContrast(double value) {
    _fontContrast = value;
    _mainSettingsBox.put(AppStringConstraints.keyFontContrast, value);
    notifyListeners();
  }
}