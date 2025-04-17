import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/strings/app_string_constraints.dart';

class BookSettingsState with ChangeNotifier {
  final Box _mainSettingsBox = Hive.box(AppStringConstraints.keyMainAppSettings);

  BookSettingsState() {
    _textSize = _mainSettingsBox.get(AppStringConstraints.keyBookTextSize, defaultValue: 16.0);
    _textAlignIndex = _mainSettingsBox.get(AppStringConstraints.keyBookAlignIndex, defaultValue: 0);
  }

  double _textSize = 16.0;

  double get textSize => _textSize;

  set textSize(double size) {
    _textSize = size;
    _mainSettingsBox.put(AppStringConstraints.keyBookTextSize, _textSize);
    notifyListeners();
  }

  int _textAlignIndex = 0;

  int get textAlignIndex => _textAlignIndex;

  set textAlignIndex(int alignIndex) {
    _textAlignIndex = alignIndex;
    _mainSettingsBox.put(AppStringConstraints.keyBookAlignIndex, _textAlignIndex);
    notifyListeners();
  }
}