import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/core/enums/align_text.dart';
import 'package:majmua/core/strings/app_constraints.dart';

class BookSettingsState extends ChangeNotifier {
  final Box _mainSettingsBox = Hive.box(AppConstraints.keyMainAppSettings);

  BookSettingsState() {
    _textSize = _mainSettingsBox.get(AppConstraints.keyBookTextSize, defaultValue: 16);
    _alignIndex = _mainSettingsBox.get(AppConstraints.keyBookAlignIndex, defaultValue: 0);
  }

  late int _textSize;

  void incrementArabicTextSize() {
    if (_textSize <= 100) {
      _textSize++;
      _mainSettingsBox.put(AppConstraints.keyBookTextSize, _textSize);
      notifyListeners();
    }
  }

  void decrementArabicTextSize() {
    if (_textSize >= 16) {
      _textSize--;
      _mainSettingsBox.put(AppConstraints.keyBookTextSize, _textSize);
      notifyListeners();
    }
  }

  int get getTextSize => _textSize;

  late int _alignIndex;

  int get getAlignIndex => _alignIndex;

  TextAlign get getTextAlign {
    return _getTextAlign(_alignIndex);
  }

  AlignText get getCurrentAlign {
    return _getCurrentAlign(_alignIndex);
  }

  set setCurrentAlign(AlignText value) {
    _alignIndex = value.index;
    _mainSettingsBox.put(AppConstraints.keyBookAlignIndex, value.index);
    notifyListeners();
  }

  AlignText _getCurrentAlign(int alignIndex) {
    late AlignText currentAlign;
    switch (alignIndex) {
      case 0:
        currentAlign = AlignText.left;
        break;
      case 1:
        currentAlign = AlignText.center;
        break;
      case 2:
        currentAlign = AlignText.right;
        break;
      case 3:
        currentAlign = AlignText.justify;
        break;
    }
    return currentAlign;
  }

  TextAlign _getTextAlign(int alignIndex) {
    late TextAlign currentAlign;
    switch (alignIndex) {
      case 0:
        currentAlign = TextAlign.start;
        break;
      case 1:
        currentAlign = TextAlign.center;
        break;
      case 2:
        currentAlign = TextAlign.end;
        break;
      case 3:
        currentAlign = TextAlign.justify;
        break;
    }
    return currentAlign;
  }
}