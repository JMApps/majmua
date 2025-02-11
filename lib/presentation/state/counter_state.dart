import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vibration/vibration.dart';

import '../../core/strings/app_string_constraints.dart';

class CounterState with ChangeNotifier {
  final _appCounterBox = Hive.box(AppStringConstraints.keyMainCounter);

  int _allCounts = 0;

  int _count33Value = 33;

  int _count100Value = 100;

  int _count1000Value = 1000;

  int _freeCountValue = 0;

  CounterState() {
    _tacticFeedback = _appCounterBox.get(AppStringConstraints.keyFeedback, defaultValue:  true);
    _countShowState = _appCounterBox.get(AppStringConstraints.keyCountValueShow, defaultValue:  true);
    _allCounts = _appCounterBox.get(AppStringConstraints.keyCounterAllValue, defaultValue: 0);
    _freeCountValue = _appCounterBox.get(AppStringConstraints.keyFreeCounterValue, defaultValue: 0);
    _count33Value = _appCounterBox.get(AppStringConstraints.key33CounterValue, defaultValue: 33);
    _count100Value = _appCounterBox.get(AppStringConstraints.key100CounterValue, defaultValue: 100);
    _count1000Value = _appCounterBox.get(AppStringConstraints.key1000CounterValue, defaultValue: 1000);
  }

  int _countIndex = 0;

  late bool _tacticFeedback;

  late bool _countShowState;

  int get getAllCounts => _allCounts;

  bool get tacticFeedback => _tacticFeedback;

  bool get countShowState => _countShowState;

  int get countIndex => _countIndex;

  void get setTacticFeedback {
    _tacticFeedback = !_tacticFeedback;
    _appCounterBox.put(AppStringConstraints.keyFeedback, _tacticFeedback);
    notifyListeners();
  }

  void get setCountShowState {
    _countShowState = !_countShowState;
    _appCounterBox.put(AppStringConstraints.keyCountValueShow, _countShowState);
    notifyListeners();
  }

  set countIndex(int value) {
    _countIndex = value;
    notifyListeners();
  }

  void onCountClick() async {
    switch (_countIndex) {
      case 0:
        _freeCountValue++;
        await _appCounterBox.put(AppStringConstraints.keyFreeCounterValue, _freeCountValue);
        incrementAllCount();
        break;
      case 1:
        if (_count33Value > 0) {
          _count33Value--;
          await _appCounterBox.put(AppStringConstraints.key33CounterValue, _count33Value);
          incrementAllCount();
        } else {
          await Vibration.vibrate();
        }
        break;
      case 2:
        if (_count100Value > 0) {
          _count100Value--;
          await _appCounterBox.put(AppStringConstraints.key100CounterValue, _count100Value);
          incrementAllCount();
        } else {
          await Vibration.vibrate();
        }
        break;
      case 3:
        if (_count1000Value > 0) {
          _count1000Value--;
          await _appCounterBox.put(AppStringConstraints.key1000CounterValue, _count1000Value);
          incrementAllCount();
        } else {
          await Vibration.vibrate();
        }
        break;
    }
    notifyListeners();
  }

  void incrementAllCount() {
    _allCounts++;
    _appCounterBox.put(AppStringConstraints.keyCounterAllValue, _allCounts);
  }

  void restoreCountValue() {
    switch (_countIndex) {
      case 0:
        _freeCountValue = 0;
        _appCounterBox.put(AppStringConstraints.keyFreeCounterValue, _freeCountValue);
        break;
      case 1:
        _count33Value = 33;
        _appCounterBox.put(AppStringConstraints.key33CounterValue, _count33Value);
        break;
      case 2:
        _count100Value = 100;
        _appCounterBox.put(AppStringConstraints.key100CounterValue, _count100Value);
        break;
      case 3:
        _count1000Value = 1000;
        _appCounterBox.put(AppStringConstraints.key1000CounterValue, _count1000Value);
        break;
    }
    notifyListeners();
  }

  void restoreAllCountValue() {
    _allCounts = 0;
    _appCounterBox.put(AppStringConstraints.keyCounterAllValue, _allCounts);
    notifyListeners();
  }

  String currentCount() {
    late int currentCount;
    switch(_countIndex) {
      case 0:
        currentCount = _freeCountValue;
        break;
      case 1:
        currentCount = _count33Value;
        break;
      case 2:
        currentCount = _count100Value;
        break;
      case 3:
        currentCount = _count1000Value;
        break;
    }
    return currentCount.toString();
  }
}
