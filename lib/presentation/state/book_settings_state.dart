import 'package:flutter/material.dart';

class BookSettingsState with ChangeNotifier {
  double _textSize = 16.0;

  double get textSize => _textSize;

  set textSize(double size) {
    _textSize = size;
    notifyListeners();
  }
}