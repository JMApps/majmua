import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FortressCounterCounter extends ChangeNotifier {
  late int _count;

  int get getCount => _count;

  bool _counterButtonIsShow = true;

  bool get getCounterButtonIsShow => _counterButtonIsShow;

  FortressCounterCounter(this._count);

  decrement() {
    if (_count > 1) {
      _count--;
      HapticFeedback.heavyImpact();
      notifyListeners();
    } else {
      _counterButtonIsShow = false;
      notifyListeners();
    }
  }
}
