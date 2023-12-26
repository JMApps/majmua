import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/core/strings/app_constraints.dart';

class FortressSettingsState extends ChangeNotifier {
  final Box _mainSettingsBox = Hive.box(AppConstraints.keyMainAppSettings);

  FortressSettingsState() {
    _arabicTextSize = _mainSettingsBox.get(AppConstraints.keyFortressArabicTextSize, defaultValue: 18);
    _translationTextSize = _mainSettingsBox.get(AppConstraints.keyFortressTranslationTextSize, defaultValue: 16);
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
      notifyListeners();
    }
  }

  void decrementArabicTextSize() {
    if (_arabicTextSize >= 16) {
      _arabicTextSize--;
      _mainSettingsBox.put(AppConstraints.keyFortressArabicTextSize, _arabicTextSize);
      notifyListeners();
    }
  }

  int get getArabicTextSize => _arabicTextSize;

  late int _translationTextSize;

  void incrementTranslationTextSize() {
    if (_translationTextSize <= 100) {
      _translationTextSize++;
      _mainSettingsBox.put(AppConstraints.keyFortressTranslationTextSize, _translationTextSize);
      notifyListeners();
    }
  }

  void decrementTranslationTextSize() {
    if (_translationTextSize >= 16) {
      _translationTextSize--;
      _mainSettingsBox.put(AppConstraints.keyFortressTranslationTextSize, _translationTextSize);
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