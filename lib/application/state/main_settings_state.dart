import 'package:flu_wake_lock/flu_wake_lock.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/application/strings/app_constants.dart';

class MainSettingsState extends ChangeNotifier {
  final _mainSettingsBox = Hive.box(AppConstants.keyMainSettings);

  bool _fastMondayNotification = true;
  bool _fastThursdayNotification = true;
  bool _fastWhiteDaysNotification = true;

  bool _fajrNotification = true;
  bool _sunriseNotification = false;
  bool _dhuhrNotification = true;
  bool _asrNotification = true;
  bool _maghribNotification = true;
  bool _ishaNotification = true;

  bool _isAdaptiveTheme = true;
  bool _isUserTheme = false;
  bool _isWakeLock = true;

  MainSettingsState() {
    _fastMondayNotification = _mainSettingsBox.get(
      AppConstants.keyFastMondayNotification,
      defaultValue: true,
    );

    _fastThursdayNotification = _mainSettingsBox.get(
      AppConstants.keyFastThursdayNotification,
      defaultValue: true,
    );

    _fastWhiteDaysNotification = _mainSettingsBox.get(
      AppConstants.keyFastWhiteDaysNotification,
      defaultValue: true,
    );

    _fajrNotification = _mainSettingsBox.get(
      AppConstants.keyFajrNotification,
      defaultValue: true,
    );

    _sunriseNotification = _mainSettingsBox.get(
      AppConstants.keySunriseNotification,
      defaultValue: false,
    );

    _dhuhrNotification = _mainSettingsBox.get(
      AppConstants.keyDhuhrNotification,
      defaultValue: true,
    );

    _asrNotification = _mainSettingsBox.get(
      AppConstants.keyAsrNotification,
      defaultValue: true,
    );

    _maghribNotification = _mainSettingsBox.get(
      AppConstants.keyMaghribNotification,
      defaultValue: true,
    );

    _ishaNotification = _mainSettingsBox.get(
      AppConstants.keyIshaNotification,
      defaultValue: true,
    );

    _isAdaptiveTheme = _mainSettingsBox.get(
      AppConstants.keyAdaptiveTheme,
      defaultValue: true,
    );

    _isUserTheme = _mainSettingsBox.get(
      AppConstants.keyUserTheme,
      defaultValue: false,
    );

    _isWakeLock = _mainSettingsBox.get(
      AppConstants.keyWakeLock,
      defaultValue: true,
    );

    _isWakeLock ? FluWakeLock().enable() : FluWakeLock().disable();
  }

  bool get getFastMondayNotification => _fastMondayNotification;

  bool get getFastThursdayNotification => _fastThursdayNotification;

  bool get getFastWhiteDaysNotification => _fastWhiteDaysNotification;


  bool get getFajrNotification => _fajrNotification;

  bool get getSunriseNotification => _sunriseNotification;

  bool get getDhuhrNotification => _dhuhrNotification;

  bool get getAsrNotification => _asrNotification;

  bool get getMaghribNotification => _maghribNotification;

  bool get getIshaNotification => _ishaNotification;


  bool get getIsAdaptiveTheme => _isAdaptiveTheme;

  bool get getIsUserTheme => _isUserTheme;

  bool get getIsWakeLock => _isWakeLock;

  set setFastMondayNotification(bool value) {
    _mainSettingsBox.put(AppConstants.keyFastMondayNotification, value);
    _fastMondayNotification = value;
    notifyListeners();
  }

  set setFastThursdayNotification(bool value) {
    _mainSettingsBox.put(AppConstants.keyFastThursdayNotification, value);
    _fastThursdayNotification = value;
    notifyListeners();
  }

  set setFastWhiteDaysNotification(bool value) {
    _mainSettingsBox.put(AppConstants.keyFastWhiteDaysNotification, value);
    _fastWhiteDaysNotification = value;
    notifyListeners();
  }

  set setFajrNotification(bool value) {
    _mainSettingsBox.put(AppConstants.keyFajrNotification, value);
    _fajrNotification = value;
    notifyListeners();
  }

  set setSunriseNotification(bool value) {
    _mainSettingsBox.put(AppConstants.keySunriseNotification, value);
    _sunriseNotification = value;
    notifyListeners();
  }

  set setDhuhrNotification(bool value) {
    _mainSettingsBox.put(AppConstants.keyDhuhrNotification, value);
    _dhuhrNotification = value;
    notifyListeners();
  }

  set setAsrNotification(bool value) {
    _mainSettingsBox.put(AppConstants.keyAsrNotification, value);
    _asrNotification = value;
    notifyListeners();
  }

  set setMaghribNotification(bool value) {
    _mainSettingsBox.put(AppConstants.keyMaghribNotification, value);
    _maghribNotification = value;
    notifyListeners();
  }

  set setIshaNotification(bool value) {
    _mainSettingsBox.put(AppConstants.keyIshaNotification, value);
    _ishaNotification = value;
    notifyListeners();
  }

  set setAdaptiveTheme(bool state) {
    _isAdaptiveTheme = state;
    _mainSettingsBox.put(AppConstants.keyAdaptiveTheme, state);
    notifyListeners();
  }

  set setUserTheme(bool state) {
    _isUserTheme = state;
    _mainSettingsBox.put(AppConstants.keyUserTheme, state);
    notifyListeners();
  }

  set setWakeLockTheme(bool state) {
    _isWakeLock = state;
    _mainSettingsBox.put(AppConstants.keyWakeLock, state);
    notifyListeners();
  }
}
