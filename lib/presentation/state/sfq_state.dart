import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/strings/app_constraints.dart';

class SFQState extends ChangeNotifier {
  final Box _mainSettingsBox = Hive.box(AppConstraints.keyMainAppSettings);

  SFQState() {
    _currentBottomIndex = _mainSettingsBox.get(AppConstraints.keyBooksBNIndex, defaultValue: 0);
    _arabicTextSize = _mainSettingsBox.get(AppConstraints.keySFQArabicTextSize, defaultValue: 20);
    _translationTextSize = _mainSettingsBox.get(AppConstraints.keySFQTranslationTextSize, defaultValue: 18);
  }

  late int _currentBottomIndex;

  int get getCurrentBottomIndex => _currentBottomIndex;

  set setCurrentBottomIndex(int value) {
    _currentBottomIndex = value;
    if (_currentBottomIndex != 2) {
      _mainSettingsBox.put(AppConstraints.keyBooksBNIndex, _currentBottomIndex);
    }
    notifyListeners();
  }

  late int _arabicTextSize;

  void incrementArabicTextSize() {
    if (_arabicTextSize <= 100) {
      _arabicTextSize++;
      _mainSettingsBox.put(AppConstraints.keySFQArabicTextSize, _arabicTextSize);
      notifyListeners();
    }
  }

  void decrementArabicTextSize() {
    if (_arabicTextSize >= 16) {
      _arabicTextSize--;
      _mainSettingsBox.put(AppConstraints.keySFQArabicTextSize, _arabicTextSize);
      notifyListeners();
    }
  }

  int get getArabicTextSize => _arabicTextSize;

  late int _translationTextSize;

  void incrementTranslationTextSize() {
    if (_translationTextSize <= 100) {
      _translationTextSize++;
      _mainSettingsBox.put(AppConstraints.keySFQTranslationTextSize, _translationTextSize);
      notifyListeners();
    }
  }

  void decrementTranslationTextSize() {
    if (_translationTextSize >= 16) {
      _translationTextSize--;
      _mainSettingsBox.put(AppConstraints.keySFQTranslationTextSize, _translationTextSize);
      notifyListeners();
    }
  }

  int get getTranslationTextSize => _translationTextSize;
}
