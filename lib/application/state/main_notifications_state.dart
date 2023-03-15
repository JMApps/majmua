import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/application/strings/app_constants.dart';
import 'package:wakelock/wakelock.dart';

class MainNotificationsSate extends ChangeNotifier {
  final _notificationSettingsBox = Hive.box(AppConstants.keyMainNotificationsSettings);

  late bool _dailyNotification;
  late bool _firstFastNotification;
  late bool _secondFastNotification;
  late bool _whiteDaysFastNotification;

  late bool _fajrNotification;
  late bool _sunriseNotification;
  late bool _dhuhrNotification;
  late bool _asrNotification;
  late bool _maghribNotification;
  late bool _ishaNotification;

  late bool _isAdaptiveTheme;
  late bool _isUserTheme;
  late bool _isWakeLock;

  MainNotificationsSate() {
    _dailyNotification = _notificationSettingsBox.get(
      AppConstants.keyDailyNotification,
      defaultValue: true,
    );

    _firstFastNotification = _notificationSettingsBox.get(
      AppConstants.keyFirstFastNotification,
      defaultValue: false,
    );

    _secondFastNotification = _notificationSettingsBox.get(
      AppConstants.keySecondFastNotification,
      defaultValue: false,
    );

    _whiteDaysFastNotification = _notificationSettingsBox.get(
      AppConstants.keyWhiteDaysNotification,
      defaultValue: false,
    );

    _fajrNotification = _notificationSettingsBox.get(
      AppConstants.keyFajrNotification,
      defaultValue: false,
    );

    _sunriseNotification = _notificationSettingsBox.get(
      AppConstants.keySunriseNotification,
      defaultValue: false,
    );

    _dhuhrNotification = _notificationSettingsBox.get(
      AppConstants.keyDhuhrNotification,
      defaultValue: false,
    );

    _asrNotification = _notificationSettingsBox.get(
      AppConstants.keyAsrNotification,
      defaultValue: false,
    );

    _maghribNotification = _notificationSettingsBox.get(
      AppConstants.keyMaghribNotification,
      defaultValue: false,
    );

    _ishaNotification = _notificationSettingsBox.get(
      AppConstants.keyIshaNotification,
      defaultValue: false,
    );

    _isAdaptiveTheme = _notificationSettingsBox.get(
      AppConstants.keyAdaptiveTheme,
      defaultValue: true,
    );

    _isUserTheme = _notificationSettingsBox.get(
      AppConstants.keyUserTheme,
      defaultValue: false,
    );

    _isWakeLock = _notificationSettingsBox.get(
      AppConstants.keyWakeLock,
      defaultValue: true,
    );

    _isWakeLock ? Wakelock.enable() : Wakelock.disable();
  }

  bool get getDailyNotification => _dailyNotification;

  bool get getFirstFastNotification => _firstFastNotification;

  bool get getSecondFastNotification => _secondFastNotification;

  bool get getWhiteDaysFastNotification => _whiteDaysFastNotification;

  bool get getFajrNotification => _fajrNotification;

  bool get getSunriseNotification => _sunriseNotification;

  bool get getDhuhrNotification => _dhuhrNotification;

  bool get getAsrNotification => _asrNotification;

  bool get getMaghribNotification => _maghribNotification;

  bool get getIshaNotification => _ishaNotification;

  bool get getIsAdaptiveTheme => _isAdaptiveTheme;

  bool get getIsUserTheme => _isUserTheme;

  bool get getIsWakeLock => _isWakeLock;

  set setDailyNotification(bool value) {
    _notificationSettingsBox.put(AppConstants.keyDailyNotification, value);
    _dailyNotification = value;
    notifyListeners();
  }

  set setFirstFastNotification(bool value) {
    _notificationSettingsBox.put(AppConstants.keyFirstFastNotification, value);
    _firstFastNotification = value;
    notifyListeners();
  }

  set setSecondFastNotification(bool value) {
    _notificationSettingsBox.put(AppConstants.keySecondFastNotification, value);
    _secondFastNotification = value;
    notifyListeners();
  }

  set setWhiteDaysFastNotification(bool value) {
    _notificationSettingsBox.put(AppConstants.keyWhiteDaysNotification, value);
    _whiteDaysFastNotification = value;
    notifyListeners();
  }

  set setFajrNotification(bool value) {
    _notificationSettingsBox.put(AppConstants.keyFajrNotification, value);
    _fajrNotification = value;
    notifyListeners();
  }

  set setSunriseNotification(bool value) {
    _notificationSettingsBox.put(AppConstants.keySunriseNotification, value);
    _sunriseNotification = value;
    notifyListeners();
  }

  set setDhuhrNotification(bool value) {
    _notificationSettingsBox.put(AppConstants.keyDhuhrNotification, value);
    _dhuhrNotification = value;
    notifyListeners();
  }

  set setAsrNotification(bool value) {
    _notificationSettingsBox.put(AppConstants.keyAsrNotification, value);
    _asrNotification = value;
    notifyListeners();
  }

  set setMaghribNotification(bool value) {
    _notificationSettingsBox.put(AppConstants.keyMaghribNotification, value);
    _maghribNotification = value;
    notifyListeners();
  }

  set setIshaNotification(bool value) {
    _notificationSettingsBox.put(AppConstants.keyIshaNotification, value);
    _ishaNotification = value;
    notifyListeners();
  }

  set setAdaptiveTheme(bool state) {
    _isAdaptiveTheme = state;
    _notificationSettingsBox.put(AppConstants.keyAdaptiveTheme, state);
    notifyListeners();
  }

  set setUserTheme(bool state) {
    _isUserTheme = state;
    _notificationSettingsBox.put(AppConstants.keyUserTheme, state);
    notifyListeners();
  }

  set setWakeLockTheme(bool state) {
    _isWakeLock = state;
    _notificationSettingsBox.put(AppConstants.keyWakeLock, state);
    notifyListeners();
  }
}
