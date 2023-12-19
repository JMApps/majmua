import 'package:flutter/material.dart';

class SurahSettingsState extends ChangeNotifier {
  bool _appBarIsVisible = true;

  double _warmthValue = 0.0;

  double _fontContrast = 100.0;

  bool get getAppBarIsVisible => _appBarIsVisible;

  double get getWarmthValue => _warmthValue;

  double get getFontContrast => _fontContrast;

  set setAppBarIsVisible(bool value) {
    _appBarIsVisible = value;
    notifyListeners();
  }

  set setFontContrast(double value) {
    _fontContrast = value;
    notifyListeners();
  }

  set setWarmthValue(double value) {
    _warmthValue = value;
    notifyListeners();
  }
}