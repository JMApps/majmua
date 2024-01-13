import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/strings/app_constraints.dart';

class GemsSettingsState extends ChangeNotifier {
  final Box _mainSettingsBox = Hive.box(AppConstraints.keyMainAppSettings);

  GemsSettingsState() {
    _currentBottomIndex = _mainSettingsBox.get(AppConstraints.keyBooksBNIndex, defaultValue: 0);
    _textSize = _mainSettingsBox.get(AppConstraints.keyGemsTextSize, defaultValue: 18);
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

  int get getRandomNumber => Random().nextInt(605);

  late int _textSize;

  void incrementArabicTextSize() {
    if (_textSize <= 100) {
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
