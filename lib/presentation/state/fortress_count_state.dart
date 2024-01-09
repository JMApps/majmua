import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FortressCountState extends ChangeNotifier {

  int _countNumber;

  FortressCountState({required int countNumber}) : _countNumber = countNumber;

  int get getCountNumber => _countNumber;

  void get countDecrement {
    if (_countNumber > 0) {
      _countNumber--;
      HapticFeedback.lightImpact();
      notifyListeners();
    }
  }

  set resetCount(int defCount) {
    _countNumber = defCount;
    HapticFeedback.heavyImpact();
    notifyListeners();
  }
}