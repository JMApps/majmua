import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/strings/app_string_constraints.dart';

class NotificationsState with ChangeNotifier {
  final Box _appSettingsBox;

  late bool _isFajrNotification;
  late bool _isSunriseNotification;
  late bool _isDhuhrNotification;
  late bool _isAsrNotification;
  late bool _isMaghribNotification;
  late bool _isIshaNotification;

  late bool _isMorningAdhkarsNotification;
  late bool _isEveningAdhkarsNotification;
  late bool _isNightAdhkarsNotification;

  late bool _isFastMondayNotification;
  late bool _isFastThursdayNotification;
  late bool _isWhiteDaysNotification;

  late bool _isFridayNotification;
  late bool _isLastHourFridayNotification;

  NotificationsState(this._appSettingsBox) {
    _isFajrNotification = _appSettingsBox.get(AppStringConstraints.keyFajrNotification, defaultValue: true);
    _isSunriseNotification = _appSettingsBox.get(AppStringConstraints.keySunriseNotification, defaultValue: true);
    _isDhuhrNotification = _appSettingsBox.get(AppStringConstraints.keyDhuhrNotification, defaultValue: true);
    _isAsrNotification = _appSettingsBox.get(AppStringConstraints.keyAsrNotification, defaultValue: true);
    _isMaghribNotification = _appSettingsBox.get(AppStringConstraints.keyMaghribNotification, defaultValue: true);
    _isIshaNotification = _appSettingsBox.get(AppStringConstraints.keyIshaNotification, defaultValue: true);
    _isMorningAdhkarsNotification = _appSettingsBox.get(AppStringConstraints.keyMorningSupplicationsNotification, defaultValue: true);
    _isEveningAdhkarsNotification = _appSettingsBox.get(AppStringConstraints.keyEveningSupplicationsNotification, defaultValue: true);
    _isNightAdhkarsNotification = _appSettingsBox.get(AppStringConstraints.keyNightSupplicationsNotification, defaultValue: true);
    _isFastMondayNotification = _appSettingsBox.get(AppStringConstraints.keyFastMondayNotification, defaultValue: true);
    _isFastThursdayNotification = _appSettingsBox.get(AppStringConstraints.keyFastThursdayNotification, defaultValue: true);
    _isWhiteDaysNotification = _appSettingsBox.get(AppStringConstraints.keyFastWhiteDaysNotification, defaultValue: true);
    _isFridayNotification = _appSettingsBox.get(AppStringConstraints.keyFridayNotification, defaultValue: true);
    _isLastHourFridayNotification = _appSettingsBox.get(AppStringConstraints.keyFridayLastHourNotification, defaultValue: true);
  }

  bool get isFajrNotification => _isFajrNotification;

  bool get isSunriseNotification => _isSunriseNotification;

  bool get isDhuhrNotification => _isDhuhrNotification;

  bool get isAsrNotification => _isAsrNotification;

  bool get isMaghribNotification => _isMaghribNotification;

  bool get isIshaNotification => _isIshaNotification;

  bool get isMorningAdhkarsNotification => _isMorningAdhkarsNotification;

  bool get isEveningAdhkarsNotification => _isEveningAdhkarsNotification;

  bool get isNightAdhkarsNotification => _isNightAdhkarsNotification;

  bool get isFastMondayNotification => _isFastMondayNotification;

  bool get isFastThursdayNotification => _isFastThursdayNotification;

  bool get isWhiteDaysNotification => _isWhiteDaysNotification;

  bool get isFridayNotification => _isFridayNotification;

  bool get isLastHourFridayNotification => _isLastHourFridayNotification;

  set isFajrNotification(bool value) {
    _isFajrNotification = value;
    _appSettingsBox.put(AppStringConstraints.keyFajrNotification, value);
    notifyListeners();
  }

  set isSunriseNotification(bool value) {
    _isSunriseNotification = value;
    _appSettingsBox.put(AppStringConstraints.keySunriseNotification, value);
    notifyListeners();
  }

  set isDhuhrNotification(bool value) {
    _isDhuhrNotification = value;
    _appSettingsBox.put(AppStringConstraints.keyDhuhrNotification, value);
    notifyListeners();
  }

  set isAsrNotification(bool value) {
    _isAsrNotification = value;
    _appSettingsBox.put(AppStringConstraints.keyAsrNotification, value);
    notifyListeners();
  }

  set isMaghribNotification(bool value) {
    _isMaghribNotification = value;
    _appSettingsBox.put(AppStringConstraints.keyMaghribNotification, value);
    notifyListeners();
  }

  set isIshaNotification(bool value) {
    _isIshaNotification = value;
    _appSettingsBox.put(AppStringConstraints.keyIshaNotification, value);
    notifyListeners();
  }

  set isMorningAdhkarsNotification(bool value) {
    _isMorningAdhkarsNotification = value;
    _appSettingsBox.put(AppStringConstraints.keyMorningSupplicationsNotification, value);
    notifyListeners();
  }

  set isEveningAdhkarsNotification(bool value) {
    _isEveningAdhkarsNotification = value;
    _appSettingsBox.put(AppStringConstraints.keyEveningSupplicationsNotification, value);
    notifyListeners();
  }

  set isNightAdhkarsNotification(bool value) {
    _isNightAdhkarsNotification = value;
    _appSettingsBox.put(AppStringConstraints.keyNightSupplicationsNotification, value);
    notifyListeners();
  }

  set isFastMondayNotification(bool value) {
    _isFastMondayNotification = value;
    _appSettingsBox.put(AppStringConstraints.keyFastMondayNotification, value);
    notifyListeners();
  }

  set isFastThursdayNotification(bool value) {
    _isFastThursdayNotification = value;
    _appSettingsBox.put(AppStringConstraints.keyFastThursdayNotification, value);
    notifyListeners();
  }

  set isWhiteDaysNotification(bool value) {
    _isWhiteDaysNotification = value;
    _appSettingsBox.put(AppStringConstraints.keyFastWhiteDaysNotification, value);
    notifyListeners();
  }

  set isFridayNotification(bool value) {
    _isFridayNotification = value;
    _appSettingsBox.put(AppStringConstraints.keyFridayNotification, value);
    notifyListeners();
  }

  set isLastHourFridayNotification(bool value) {
    _isLastHourFridayNotification = value;
    _appSettingsBox.put(AppStringConstraints.keyFridayLastHourNotification, value);
    notifyListeners();
  }
}
