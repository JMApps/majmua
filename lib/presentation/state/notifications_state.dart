import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/strings/app_constraints.dart';

class NotificationsState extends ChangeNotifier {
  final Box _mainSettingsBox = Hive.box(AppConstraints.keyMainSettings);

  NotificationsState() {
    _fajrNotification = _mainSettingsBox.get(AppConstraints.keyFajrNotification, defaultValue: true);
    _sunriseNotification = _mainSettingsBox.get(AppConstraints.keySunriseNotification, defaultValue: true);
    _dhuhrNotification = _mainSettingsBox.get(AppConstraints.keyDhuhrNotification, defaultValue: true);
    _asrNotification = _mainSettingsBox.get(AppConstraints.keyAsrNotification, defaultValue: true);
    _maghribNotification = _mainSettingsBox.get(AppConstraints.keyMaghribNotification, defaultValue: true);
    _ishaNotification = _mainSettingsBox.get(AppConstraints.keyIshaNotification, defaultValue: true);

    _morningSupplicationsNotification = _mainSettingsBox.get(AppConstraints.keyMorningSupplicationsNotification, defaultValue: true);
    _eveningSupplicationsNotification = _mainSettingsBox.get(AppConstraints.keyEveningSupplicationsNotification, defaultValue: true);
    _nightSupplicationsNotification = _mainSettingsBox.get(AppConstraints.keyNightSupplicationsNotification, defaultValue: true);

    _fastMondayNotification = _mainSettingsBox.get(AppConstraints.keyFastMondayNotification, defaultValue: true);
    _fastThursdayNotification = _mainSettingsBox.get(AppConstraints.keyFastThursdayNotification, defaultValue: true);
    _fastWhiteDaysNotification = _mainSettingsBox.get(AppConstraints.keyFastWhiteDaysNotification, defaultValue: true);

    _fridayNotification = _mainSettingsBox.get(AppConstraints.keyFridayNotification, defaultValue: true);
    _lastHourFridayNotification = _mainSettingsBox.get(AppConstraints.keyFridayLastHourNotification, defaultValue: true);
  }

  late bool _fajrNotification;
  late bool _sunriseNotification;
  late bool _dhuhrNotification;
  late bool _asrNotification;
  late bool _maghribNotification;
  late bool _ishaNotification;

  // Prayers
  bool get fajrNotification => _fajrNotification;

  bool get sunriseNotification => _sunriseNotification;

  bool get dhuhrNotification => _dhuhrNotification;

  bool get asrNotification => _asrNotification;

  bool get maghribNotification => _maghribNotification;

  bool get ishaNotification => _ishaNotification;

  set setFajrNotification(bool onChanged) {
    _fajrNotification = onChanged;
    _mainSettingsBox.put(AppConstraints.keyFajrNotification, onChanged);
    notifyListeners();
  }

  set setSunriseNotification(bool onChanged) {
    _sunriseNotification = onChanged;
    _mainSettingsBox.put(AppConstraints.keySunriseNotification, onChanged);
    notifyListeners();
  }

  set setDhuhrNotification(bool onChanged) {
    _dhuhrNotification = onChanged;
    _mainSettingsBox.put(AppConstraints.keyDhuhrNotification, onChanged);
    notifyListeners();
  }

  set setAsrNotification(bool onChanged) {
    _asrNotification = onChanged;
    _mainSettingsBox.put(AppConstraints.keyAsrNotification, onChanged);
    notifyListeners();
  }

  set setMaghribNotification(bool onChanged) {
    _maghribNotification = onChanged;
    _mainSettingsBox.put(AppConstraints.keyMaghribNotification, onChanged);
    notifyListeners();
  }

  set setIshaNotification(bool onChanged) {
    _ishaNotification = onChanged;
    _mainSettingsBox.put(AppConstraints.keyIshaNotification, onChanged);
    notifyListeners();
  }

  late bool _morningSupplicationsNotification;
  late bool _eveningSupplicationsNotification;
  late bool _nightSupplicationsNotification;

  // Adhkars
  bool get morningSupplicationsNotification => _morningSupplicationsNotification;

  bool get eveningSupplicationsNotification => _eveningSupplicationsNotification;

  bool get nightSupplicationsNotification => _nightSupplicationsNotification;

  set setMorningSupplicationsNotification(bool value) {
    _morningSupplicationsNotification = value;
    _mainSettingsBox.put(AppConstraints.keyMorningSupplicationsNotification, value);
    notifyListeners();
  }

  set eveningSupplicationsNotification(bool value) {
    _eveningSupplicationsNotification = value;
    _mainSettingsBox.put(AppConstraints.keyEveningSupplicationsNotification, value);
    notifyListeners();
  }

  set setNightSupplicationsNotification(bool value) {
    _nightSupplicationsNotification = value;
    _mainSettingsBox.put(AppConstraints.keyNightSupplicationsNotification, value);
    notifyListeners();
  }

  late bool _fastMondayNotification;
  late bool _fastThursdayNotification;
  late bool _fastWhiteDaysNotification;

  // Fasts
  bool get fastMondayNotification => _fastMondayNotification;

  bool get fastThursdayNotification => _fastThursdayNotification;

  bool get fastWhiteDaysNotification => _fastWhiteDaysNotification;

  set setFastMondayNotification(bool value) {
    _fastMondayNotification = value;
    _mainSettingsBox.put(AppConstraints.keyFastMondayNotification, value);
    notifyListeners();
  }

  set setFastThursdayNotification(bool value) {
    _fastThursdayNotification = value;
    _mainSettingsBox.put(AppConstraints.keyFastThursdayNotification, value);
    notifyListeners();
  }

  set setFastWhiteDaysNotification(bool value) {
    _fastWhiteDaysNotification = value;
    _mainSettingsBox.put(AppConstraints.keyFastWhiteDaysNotification, value);
    notifyListeners();
  }

  late bool _fridayNotification;
  late bool _lastHourFridayNotification;

  // Friday
  bool get fridayNotification => _fridayNotification;

  bool get lastHourFridayNotification => _lastHourFridayNotification;

  set setFridayNotification(bool value) {
    _fridayNotification = value;
    _mainSettingsBox.put(AppConstraints.keyFridayNotification, value);
    notifyListeners();
  }

  set setLastHourFridayNotification(bool value) {
    _lastHourFridayNotification = value;
    _mainSettingsBox.put(AppConstraints.keyFridayLastHourNotification, value);
    notifyListeners();
  }
}
