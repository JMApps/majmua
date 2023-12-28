import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/core/strings/app_constraints.dart';

class SurahSettingsState extends ChangeNotifier {
  final Box _mainSettingsBox = Hive.box(AppConstraints.keyMainAppSettings);

  SurahSettingsState() {
    _warmthValue = _mainSettingsBox.get(AppConstraints.keySurahsBackgroundWarmth, defaultValue: 0.0);
    _fontContrast = _mainSettingsBox.get(AppConstraints.keyFontContrast, defaultValue: 100.0);
  }

  bool _appBarIsVisible = true;

  late double _warmthValue;

  late double _fontContrast;

  bool get getAppBarIsVisible => _appBarIsVisible;

  double get getWarmthValue => _warmthValue;

  double get getFontContrast => _fontContrast;

  set setAppBarIsVisible(bool value) {
    _appBarIsVisible = value;
    notifyListeners();
  }

  set setWarmthValue(double value) {
    _warmthValue = value;
    _mainSettingsBox.put(AppConstraints.keySurahsBackgroundWarmth, value);
    notifyListeners();
  }

  set setFontContrast(double value) {
    _fontContrast = value;
    _mainSettingsBox.put(AppConstraints.keyFontContrast, value);
    notifyListeners();
  }
}
