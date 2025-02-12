import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/strings/app_string_constraints.dart';

class SurahSettingsState with ChangeNotifier {
  final PageController _pageController = PageController();
  final Box _mainSettingsBox = Hive.box(AppStringConstraints.keyMainAppSettings);

  final String _pageNumberKey;

  SurahSettingsState(this._pageNumberKey) {
    _warmthValue = _mainSettingsBox.get(AppStringConstraints.keySurahsBackgroundWarmth, defaultValue: 0.0);
    _fontContrast = _mainSettingsBox.get(AppStringConstraints.keyFontContrast, defaultValue: 100.0);
    _pageNumber = _mainSettingsBox.get(_pageNumberKey, defaultValue: 0);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _pageController.jumpToPage(_pageNumber);
    });
  }

  int _pageNumber = 0;

  bool _appBarIsVisible = true;

  late double _warmthValue = 0.0;

  late double _fontContrast = 100.0;

  PageController get getPageController => _pageController;

  int get getPageNumber => _pageNumber;

  bool get getAppBarIsVisible => _appBarIsVisible;

  double get getWarmthValue => _warmthValue;

  double get getFontContrast => _fontContrast;

  void savePageNumber(int pageNumber) {
    _pageNumber = pageNumber;
  }

  set setAppBarIsVisible(bool value) {
    _appBarIsVisible = value;
    notifyListeners();
  }

  set setWarmthValue(double value) {
    _warmthValue = value;
    notifyListeners();
  }

  set setFontContrast(double value) {
    _fontContrast = value;
    notifyListeners();
  }

  @override
  void dispose() {
    _mainSettingsBox.put(_pageNumberKey, _pageNumber);
    _mainSettingsBox.put(AppStringConstraints.keySurahsBackgroundWarmth, _warmthValue);
    _mainSettingsBox.put(AppStringConstraints.keyFontContrast, _fontContrast);
    super.dispose();
  }
}