import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/core/strings/app_constraints.dart';

class GemsContentState extends ChangeNotifier {
  final Box _mainSettingsBox = Hive.box(AppConstraints.keyMainAppSettings);

  GemsContentState() {
    _textSize = _mainSettingsBox.get(AppConstraints.keyGemsTextSize, defaultValue: 20);
  }

  int _currentBottomIndex = 0;

  int get getCurrentBottomIndex => _currentBottomIndex;

  set setCurrentBottomIndex(int value) {
    _currentBottomIndex = value;
    notifyListeners();
  }

  late int _textSize;

  void incrementArabicTextSize() {
    if (_textSize <= 50) {
      _textSize++;
      _mainSettingsBox.put(AppConstraints.keyGemsTextSize, _textSize);
      notifyListeners();
    }
  }

  void decrementArabicTextSize() {
    if (_textSize >= 16) {
      _textSize--;
      _mainSettingsBox.put(AppConstraints.keyGemsTextSize, _textSize);
      notifyListeners();
    }
  }

  int get getTextSize => _textSize;
}