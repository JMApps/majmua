import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/application/strings/app_constants.dart';

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

  MainNotificationsSate() {
    _dailyNotification = _notificationSettingsBox.get(
      AppConstants.keyIshaNotification,
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

  set setDailyNotification(bool value) {
    _notificationSettingsBox.put(AppConstants.keyDailyNotification, value);
    _dailyNotification = value;
  }

  set setFirstFastNotification(bool value) {
    _notificationSettingsBox.put(AppConstants.keyFirstFastNotification, value);
    _firstFastNotification = value;
  }
  set setSecondFastNotification(bool value) {
    _notificationSettingsBox.put(AppConstants.keySecondFastNotification, value);
    _secondFastNotification = value;
  }

  set setWhiteDaysFastNotification(bool value) {
    _notificationSettingsBox.put(AppConstants.keyWhiteDaysNotification, value);
    _whiteDaysFastNotification = value;
  }

  set setFajrNotification(bool value) {
    _notificationSettingsBox.put(AppConstants.keyFajrNotification, value);
    _fajrNotification = value;
  }

  set setSunriseNotification(bool value) {
    _notificationSettingsBox.put(AppConstants.keySunriseNotification, value);
    _sunriseNotification = value;
  }

  set setDhuhrNotification(bool value) {
    _notificationSettingsBox.put(AppConstants.keyDhuhrNotification, value);
    _dhuhrNotification = value;
  }

  set setAsrNotification(bool value) {
    _notificationSettingsBox.put(AppConstants.keyAsrNotification, value);
    _asrNotification = value;
  }

  set setMaghribNotification(bool value) {
    _notificationSettingsBox.put(AppConstants.keyMaghribNotification, value);
    _maghribNotification = value;
  }

  set setIshaNotification(bool value) {
    _notificationSettingsBox.put(AppConstants.keyIshaNotification, value);
    _ishaNotification = value;
  }
}