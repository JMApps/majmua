import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/core/strings/app_constraints.dart';

class BookSettingsState extends ChangeNotifier {
  final Box _mainSettingsBox = Hive.box(AppConstraints.keyMainAppSettings);

  BookSettingsState() {
    _textSize = _mainSettingsBox.get(AppConstraints.keyNamesOfTextSize, defaultValue: 16);
  }

  late int _textSize;

  void incrementArabicTextSize() {
    if (_textSize <= 100) {
      _textSize++;
      _mainSettingsBox.put(AppConstraints.keyNamesOfTextSize, _textSize);
      notifyListeners();
    }
  }

  void decrementArabicTextSize() {
    if (_textSize >= 16) {
      _textSize--;
      _mainSettingsBox.put(AppConstraints.keyNamesOfTextSize, _textSize);
      notifyListeners();
    }
  }

  int get getTextSize => _textSize;
}