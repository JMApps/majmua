import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/application/strings/app_constants.dart';

class CounterState extends ChangeNotifier {
  final Box _counterValueBox = Hive.box(AppConstants.keyMainCounter);

  CounterState() {
    _countValue =
        _counterValueBox.get(AppConstants.keyCounterValue, defaultValue: 0);
    _countAllValue =
        _counterValueBox.get(AppConstants.keyCounterAllValue, defaultValue: 0);
    _isVibrate = _counterValueBox.get(AppConstants.keyCounterVibrate,
        defaultValue: true);
    _isClick =
        _counterValueBox.get(AppConstants.keyCounterClick, defaultValue: true);
    _isCountValueShow = _counterValueBox.get(AppConstants.keyCountValueShow,
        defaultValue: true);
  }

  int _countValueListIndex = 0;

  int get getCountValueListIndex => _countValueListIndex;

  int _countAllValue = 0;

  int get getCountAllValue => _countAllValue;

  int _countValue = 0;

  int get getCountValue => _countValue;

  bool _isVibrate = true;

  bool get getIsVibrate => _isVibrate;

  bool _isClick = true;

  bool get getIsClick => _isClick;

  bool _isCountValueShow = true;

  bool get getIsCountValueShow => _isCountValueShow;

  changeCountValueIndex(int countValueIndex) {
    _countValueListIndex = countValueIndex;
    notifyListeners();
  }

  increment() async {
    _countValue++;
    _countAllValue++;
    if (_isVibrate) {
      HapticFeedback.lightImpact();
    }
    if (_isClick) {
      SystemSound.play(SystemSoundType.click);
    }
    _counterValueBox.put(AppConstants.keyCounterValue, _countValue);
    _counterValueBox.put(AppConstants.keyCounterAllValue, _countAllValue);
    notifyListeners();
  }

  vibrateMode() {
    _isVibrate = !_isVibrate;
    _counterValueBox.put(AppConstants.keyCounterVibrate, _isVibrate);
    notifyListeners();
  }

  clickMode() {
    _isClick = !_isClick;
    _counterValueBox.put(AppConstants.keyCounterClick, _isClick);
    notifyListeners();
  }

  reset() {
    _countValue = 0;
    _counterValueBox.put(AppConstants.keyCounterValue, 0);
    HapticFeedback.vibrate();
    notifyListeners();
  }

  isCountShow() {
    _isCountValueShow = !_isCountValueShow;
    _counterValueBox.put(AppConstants.keyCountValueShow, true);
    notifyListeners();
  }
}
