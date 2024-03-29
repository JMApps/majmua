import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/core/strings/app_constraints.dart';

class AppCounterState extends ChangeNotifier {
  final _counterValueBox = Hive.box(AppConstraints.keyMainCounter);

  AppCounterState() {
    const int defValue = 100;
    _totalCountValue = _counterValueBox.get(AppConstraints.keyCounterAllValue, defaultValue: 0);
    _mainCountValue = _counterValueBox.get(AppConstraints.keyCounterValue, defaultValue: 0);

    _firstCounts = _counterValueBox.get(AppConstraints.keyCounterFirstValue, defaultValue: defValue);
    _secondCounts = _counterValueBox.get(AppConstraints.keyCounterSecondValue, defaultValue: defValue);
    _thirdCounts = _counterValueBox.get(AppConstraints.keyCounterThirdValue, defaultValue: defValue);

    _isClick = _counterValueBox.get(AppConstraints.keyCounterClick, defaultValue: true);
    _isVibrate = _counterValueBox.get(AppConstraints.keyCounterVibrate, defaultValue: true);
    _isShow = _counterValueBox.get(AppConstraints.keyCountValueShow, defaultValue: true);
  }

  int get getCurrentCountValue => _currentCountValue();

  int _currentCountValue() {
    int currentValue = 0;
    switch (_countValuesIndex) {
      case 0:
        currentValue = _mainCountValue;
        break;
      case 1:
        currentValue = _firstCounts;
        break;
      case 2:
        currentValue = _secondCounts;
        break;
      case 3:
        currentValue = _thirdCounts;
        break;
    }
    return currentValue;
  }

  int _countValuesIndex = 0;

  int get getCountValuesIndex => _countValuesIndex;

  set setCountValuesIndex(int index) {
    _countValuesIndex = index;
    notifyListeners();
  }

  late int _totalCountValue;

  int get getTotalCountValue => _totalCountValue;

  _onChangeTotalCountValue() {
    _totalCountValue++;
    _countIncrement(count: _totalCountValue, key: AppConstraints.keyCounterAllValue);
    notifyListeners();
  }

  late int _mainCountValue;

  int get getMainCountValue => _mainCountValue;

  _onChangeMainCount() {
    _mainCountValue++;
    _countIncrement(count: _mainCountValue, key: AppConstraints.keyCounterValue);
    _onChangeTotalCountValue();
    notifyListeners();
  }

  late int _firstCounts;

  int get getFirstCounts => _firstCounts;

  _onChangeFirstCount() {
    if (_firstCounts > 0) {
      _firstCounts--;
      _countDecrement(count: _firstCounts, key: AppConstraints.keyCounterFirstValue);
      _onChangeTotalCountValue();
    } else {
      HapticFeedback.vibrate();
    }
    notifyListeners();
  }

  late int _secondCounts;

  int get getSecondCounts => _secondCounts;

  _onChangeSecondCount() {
    if (_secondCounts > 0) {
      _secondCounts--;
      _countDecrement(count: _secondCounts, key: AppConstraints.keyCounterSecondValue);
      _onChangeTotalCountValue();
    } else {
      HapticFeedback.vibrate();
    }
    notifyListeners();
  }

  late int _thirdCounts;

  int get getThirdCounts => _thirdCounts;

  _onChangeThirdCount() {
    if (_thirdCounts > 0) {
      _thirdCounts--;
      _countDecrement(count: _thirdCounts, key: AppConstraints.keyCounterThirdValue);
      _onChangeTotalCountValue();
    } else {
      _isClick = false;
      HapticFeedback.vibrate();
    }
    notifyListeners();
  }

  bool _isClick = true;

  bool get getIsClick => _isClick;

  void get onChangeIsClick {
    _isClick = !_isClick;
    _counterValueBox.put(AppConstraints.keyCounterClick, _isClick);
    notifyListeners();
  }

  bool _isVibrate = true;

  bool get getIsVibrate => _isVibrate;

  void get onChangeVibrateState {
    _isVibrate = !_isVibrate;
    _counterValueBox.put(AppConstraints.keyCounterVibrate, _isVibrate);
    notifyListeners();
  }

  bool _isShow = true;

  bool get getIsShow => _isShow;

  void get onChangeIsShow {
    _isShow = !_isShow;
    _counterValueBox.put(AppConstraints.keyCountValueShow, _isShow);
    notifyListeners();
  }

  _countIncrement({required int count, required String key}) {
    _counterValueBox.put(key, count);
    notifyListeners();
  }

  _countDecrement({required int count, required String key}) {
    _counterValueBox.put(key, count);
    notifyListeners();
  }

  set mainCountClick(int countIndex) {
    if (_isVibrate) {
      HapticFeedback.lightImpact();
    }
    if (_isClick) {
      SystemSound.play(SystemSoundType.click);
    }
    switch (countIndex) {
      case 0:
        _onChangeMainCount();
        break;
      case 1:
        _onChangeFirstCount();
        break;
      case 2:
        _onChangeSecondCount();
        break;
      case 3:
        _onChangeThirdCount();
        break;
    }
  }

  set resetSelectedCount(int countIndex) {
    const int defValue = 100;
    switch (countIndex) {
      case 0:
        _mainCountValue = 0;
        _counterValueBox.put(AppConstraints.keyCounterValue, _mainCountValue);
        break;
      case 1:
        _firstCounts = defValue;
        _counterValueBox.put(AppConstraints.keyCounterFirstValue, defValue);
        break;
      case 2:
        _secondCounts = defValue;
        _counterValueBox.put(AppConstraints.keyCounterSecondValue, defValue);
        break;
      case 3:
        _thirdCounts = defValue;
        _counterValueBox.put(AppConstraints.keyCounterThirdValue, defValue);
        break;
    }
    HapticFeedback.vibrate();
    notifyListeners();
  }

  void get resetAllCounts {
    const int defValue = 100;
    _mainCountValue = 0;
    _counterValueBox.put(AppConstraints.keyCounterValue, _mainCountValue);
    _firstCounts = defValue;
    _counterValueBox.put(AppConstraints.keyCounterFirstValue, _firstCounts);
    _secondCounts = defValue;
    _counterValueBox.put(AppConstraints.keyCounterSecondValue, _secondCounts);
    _thirdCounts = defValue;
    _counterValueBox.put(AppConstraints.keyCounterThirdValue, _thirdCounts);
    HapticFeedback.vibrate();
    notifyListeners();
  }

  void get resetTotalCount {
    _totalCountValue = 0;
    _counterValueBox.put(AppConstraints.keyCounterAllValue, 0);
    notifyListeners();
  }
}
