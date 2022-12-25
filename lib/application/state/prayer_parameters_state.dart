import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/application/constants/app_constants.dart';

class PrayerParametersState extends ChangeNotifier {
  final _mainSettingsBox = Hive.box(AppConstants.keySettingsPrayerTimeBox);

  late double _currentLatitude;
  late double _currentLongitude;
  late int _calculationIndex;

  initParameters() {
    _currentLatitude = _mainSettingsBox.get(
      AppConstants.keyCurrentLatitude,
      defaultValue: 36.2134290492795,
    );
    _currentLongitude = _mainSettingsBox.get(
      AppConstants.keyCurrentLongitude,
      defaultValue: 36.521747813609586,
    );

    _calculationIndex = _mainSettingsBox.get(
      AppConstants.keyPrayerParamsIndex,
      defaultValue: 0,
    );
  }

  double get currentLatitude => _currentLatitude;

  double get currentLongitude => _currentLongitude;

  int get calculationIndex => _calculationIndex;

  set setCurrentLatitude(double value) {
    _currentLatitude = value;
    _mainSettingsBox.put(AppConstants.keyCurrentLatitude, value);
    notifyListeners();
  }

  set setCurrentLongitude(double value) {
    _currentLongitude = value;
    _mainSettingsBox.put(AppConstants.keyCurrentLongitude, value);
    notifyListeners();
  }

  set setCalculationIndex(int value) {
    _calculationIndex = value;
    _mainSettingsBox.put(AppConstants.keyPrayerParamsIndex, value);
    notifyListeners();
  }
}
