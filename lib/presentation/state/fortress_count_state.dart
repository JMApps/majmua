import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

class FortressCountState extends ChangeNotifier {

  int _supplicationCount;

  late int _defCountValue;

  FortressCountState(this._supplicationCount) {
    _defCountValue = _supplicationCount;
  }

  int get getSupplicationCount => _supplicationCount;


  void onCountClick() async {
    if (_supplicationCount > 0) {
      _supplicationCount--;
      HapticFeedback.lightImpact();
      notifyListeners();
    } else {
      bool canVibrate = await Vibration.hasVibrator();
      if (canVibrate) {
        Vibration.vibrate();
      }
    }
  }

  void resetCount() async {
    _supplicationCount = _defCountValue;
    bool canVibrate = await Vibration.hasVibrator();
    if (canVibrate) {
      Vibration.vibrate();
    }
    notifyListeners();
  }
}