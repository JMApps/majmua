import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/strings/app_constraints.dart';

class FortressSettingsState extends ChangeNotifier {
  final Box _mainSettingsBox = Hive.box(AppConstraints.keyMainAppSettings);

  FortressSettingsState() {
    _arabicTextSize = _mainSettingsBox.get(AppConstraints.keyFortressArabicTextSize, defaultValue: 20);
    _translationTextSize = _mainSettingsBox.get(AppConstraints.keyFortressTranslationTextSize, defaultValue: 18);
    _transcriptionIsShow = _mainSettingsBox.get(AppConstraints.keyFortressTranscriptionIsShow, defaultValue: true);
  }

  int _currentBottomIndex = 0;

  int get getCurrentBottomIndex => _currentBottomIndex;

  set setCurrentBottomIndex(int value) {
    _currentBottomIndex = value;
    notifyListeners();
  }

  late int _arabicTextSize;

  void incrementArabicTextSize() {
    if (_arabicTextSize <= 100) {
      _arabicTextSize++;
      _mainSettingsBox.put(AppConstraints.keyFortressArabicTextSize, _arabicTextSize);
      HapticFeedback.lightImpact();
      notifyListeners();
    }
  }

  void decrementArabicTextSize() {
    if (_arabicTextSize >= 16) {
      _arabicTextSize--;
      _mainSettingsBox.put(AppConstraints.keyFortressArabicTextSize, _arabicTextSize);
      HapticFeedback.lightImpact();
      notifyListeners();
    }
  }

  int get getArabicTextSize => _arabicTextSize;

  late int _translationTextSize;

  void incrementTranslationTextSize() {
    if (_translationTextSize <= 100) {
      _translationTextSize++;
      _mainSettingsBox.put(AppConstraints.keyFortressTranslationTextSize, _translationTextSize);
      HapticFeedback.lightImpact();
      notifyListeners();
    }
  }

  void decrementTranslationTextSize() {
    if (_translationTextSize >= 16) {
      _translationTextSize--;
      _mainSettingsBox.put(AppConstraints.keyFortressTranslationTextSize, _translationTextSize);
      HapticFeedback.lightImpact();
      notifyListeners();
    }
  }

  int get getTranslationTextSize => _translationTextSize;

  late bool _transcriptionIsShow;

  void transcriptionShowOnChange() {
    _transcriptionIsShow = !_transcriptionIsShow;
    _mainSettingsBox.put(AppConstraints.keyFortressTranscriptionIsShow, _transcriptionIsShow);
    notifyListeners();
  }

  bool get getTranscriptionIsShow => _transcriptionIsShow;
}
