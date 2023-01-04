import 'dart:async';

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/application/constants/app_constants.dart';
import 'package:majmua/application/notifications/local_notification_service.dart';
import 'package:majmua/data/database/local/model/country_model.dart';
import 'package:majmua/data/database/local/model/custom_country_model.dart';
import 'package:majmua/data/database/local/service/coordinates_query.dart';

class CountryCoordinatesState extends ChangeNotifier {
  final _mainSettingsBox = Hive.box(AppConstants.keySettingsPrayerTimeBox);
  final CoordinatesQuery _coordinatesQuery = CoordinatesQuery();
  DateTime _dateTime = DateTime.now();
  late PrayerTimes _prayerTime;
  late CalculationParameters _prayerParams;
  late Timer _myTimer;
  final LocalNotificationService _localNotificationService = LocalNotificationService();

  late String _county;
  late String _city;
  late double _currentLatitude;
  late double _currentLongitude;
  late int _calculationMethodIndex;
  late int _calculationMadhabIndex;

  final List<CalculationMethod> _calculationParameters = [
    CalculationMethod.umm_al_qura,
    CalculationMethod.north_america,
    CalculationMethod.dubai,
    CalculationMethod.egyptian,
    CalculationMethod.karachi,
    CalculationMethod.kuwait,
    CalculationMethod.moon_sighting_committee,
    CalculationMethod.muslim_world_league,
    CalculationMethod.qatar,
    CalculationMethod.turkey,
  ];

  final List<Madhab> _calculationMadhab = [
    Madhab.shafi,
    Madhab.hanafi,
  ];

  final Stream myStream = Stream.periodic(
    const Duration(minutes: 1),
    (int count) {
      return count;
    },
  );

  CountryCoordinatesState() {
    _localNotificationService.initialize();
    _localNotificationService.showDailyNotification(
        id: 14, title: 'Полка мусульманина', body: 'Загляни');
    var nextMinute = DateTime(
      _dateTime.year,
      _dateTime.month,
      _dateTime.day,
      _dateTime.hour,
      _dateTime.minute + 1,
    );
    _myTimer = Timer(nextMinute.difference(_dateTime), () {
      _dateTime = DateTime.now();
      notifyListeners();
      _myTimer = Timer.periodic(const Duration(minutes: 1), (timer) {
        _dateTime = DateTime.now();
        notifyListeners();
      });
    });
    _county = _mainSettingsBox.get(AppConstants.keyCountry, defaultValue: 'Saudi Arabia');
    _city = _mainSettingsBox.get(AppConstants.keyCity, defaultValue: 'Mecca');
    _currentLatitude = _mainSettingsBox.get(AppConstants.keyCurrentLatitude, defaultValue: 21.392425120226704);
    _currentLongitude = _mainSettingsBox.get(AppConstants.keyCurrentLongitude, defaultValue: 39.85797038428307);
    _calculationMethodIndex = _mainSettingsBox.get(AppConstants.keyCalculationIndex, defaultValue: 0);
    _calculationMadhabIndex = _mainSettingsBox.get(AppConstants.keyMadhabIndex, defaultValue: 0);

    initWithNewCoordinates(
      currentLatitude: _currentLatitude,
      currentLongitude: _currentLongitude,
      calculationMethodIndex: _calculationMethodIndex,
      calculationMadhabIndex: _calculationMadhabIndex,
    );
  }

  int get getMinuteOfDay {
    return _dateTime.difference(DateTime(_dateTime.year, _dateTime.month, _dateTime.day)).inMinutes;
  }

  DateTime fromPrayerTime(Prayer currentPrayer) {
    final DateTime toPrayerTime = DateTime(
      _dateTime.year,
      _dateTime.month,
      _dateTime.day,
      _prayerTime.timeForPrayer(currentPrayer)!.hour,
      _prayerTime.timeForPrayer(currentPrayer)!.minute,
    );
    int value = _dateTime.difference(toPrayerTime).inMinutes * 60;
    int hour, minute;
    hour = value ~/ 3600;
    minute = ((value - hour * 3600)) ~/ 60;
    DateTime result = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, hour, minute);
    return result;
  }

  DateTime toPrayerTime(Prayer currentPrayer) {
    final DateTime toPrayerTime = DateTime(
      _dateTime.year,
      _dateTime.month,
      _dateTime.day,
      _prayerTime.timeForPrayer(currentPrayer)!.hour,
      _prayerTime.timeForPrayer(currentPrayer)!.minute,
    );
    int value = (toPrayerTime.difference(_dateTime).inMinutes + 1) * 60;
    int hour, minute;
    hour = value ~/ 3600;
    minute = ((value - hour * 3600)) ~/ 60;
    DateTime result = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, hour, minute);
    return result;
  }

  PrayerTimes get getPrayerTime => _prayerTime;

  String get getCountry => _county;

  String get getCity => _city;

  double get getLatitude => _currentLatitude;

  double get getLongitude => _currentLongitude;

  int get getCalculationMethodIndex => _calculationMethodIndex;

  int get getCalculationMadhabIndex => _calculationMadhabIndex;

  set changeCountry(CountryModel item) {
    _county = item.country;
    _city = item.city;
    _currentLatitude = double.parse(item.latitude);
    _currentLongitude = double.parse(item.longitude);
    _mainSettingsBox.put(AppConstants.keyCountry, _county);
    _mainSettingsBox.put(AppConstants.keyCity, _city);
    _mainSettingsBox.put(AppConstants.keyCurrentLatitude, _currentLatitude);
    _mainSettingsBox.put(AppConstants.keyCurrentLongitude, _currentLongitude);
    initWithNewCoordinates(
      currentLatitude: double.parse(item.latitude),
      currentLongitude: double.parse(item.longitude),
      calculationMethodIndex: _calculationMethodIndex,
      calculationMadhabIndex: _calculationMadhabIndex,
    );
    notifyListeners();
  }

  set changeCustomCountry(CustomCountryModel item) {
    _county = item.country;
    _city = item.city;
    _currentLatitude = double.parse(item.latitude).abs();
    _currentLongitude = double.parse(item.longitude).abs();
    _mainSettingsBox.put(AppConstants.keyCountry, _county);
    _mainSettingsBox.put(AppConstants.keyCity, _city);
    _mainSettingsBox.put(AppConstants.keyCurrentLatitude, _currentLatitude);
    _mainSettingsBox.put(AppConstants.keyCurrentLongitude, _currentLongitude);
    initWithNewCoordinates(
      currentLatitude: double.parse(item.latitude).abs(),
      currentLongitude: double.parse(item.longitude).abs(),
      calculationMethodIndex: _calculationMethodIndex,
      calculationMadhabIndex: _calculationMadhabIndex,
    );
    notifyListeners();
  }

  set changeCalculationMethod(int calculationMethodIndex) {
    _calculationMethodIndex = calculationMethodIndex;
    initWithNewCoordinates(
      currentLatitude: _currentLatitude,
      currentLongitude: _currentLongitude,
      calculationMethodIndex: calculationMethodIndex,
      calculationMadhabIndex: _calculationMadhabIndex,
    );
    _mainSettingsBox.put(AppConstants.keyCalculationIndex, calculationMethodIndex);
    notifyListeners();
  }

  set changeCalculationMadhab(int calculationMadhabIndex) {
    _calculationMadhabIndex = calculationMadhabIndex;
    initWithNewCoordinates(
      currentLatitude: _currentLatitude,
      currentLongitude: _currentLongitude,
      calculationMethodIndex: _calculationMethodIndex,
      calculationMadhabIndex: calculationMadhabIndex,
    );
    _mainSettingsBox.put(AppConstants.keyMadhabIndex, calculationMadhabIndex);
    notifyListeners();
  }

  int get getSecondNightValueInMinutes => _prayerValueInMinutes(
      prayerTime: DateTime(_dateTime.year, _dateTime.month, _dateTime.day, 0, 1));

  int get getFajrValueInMinutes =>
      _prayerValueInMinutes(prayerTime: _prayerTime.fajr);

  int get getSunriseValueInMinutes =>
      _prayerValueInMinutes(prayerTime: _prayerTime.sunrise);

  int get getDhuhrValueInMinutes =>
      _prayerValueInMinutes(prayerTime: _prayerTime.dhuhr);

  int get getAsrValueInMinutes =>
      _prayerValueInMinutes(prayerTime: _prayerTime.asr);

  int get getMaghribValueInMinutes =>
      _prayerValueInMinutes(prayerTime: _prayerTime.maghrib);

  int get getIshaValueInMinutes =>
      _prayerValueInMinutes(prayerTime: _prayerTime.isha);

  DateTime get getThirdNightPart {
    double valueThird = ((1440 - getMaghribValueInMinutes + getFajrValueInMinutes) / 3) * 60;
    double value = (getFajrValueInMinutes * 60) - valueThird;
    int hour, minute;
    hour = value ~/ 3600;
    minute = ((value - hour * 3600)) ~/ 60;
    DateTime result = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, hour, minute);
    return result;
  }

  DateTime get getLastHourFriday {
    int value = (getMaghribValueInMinutes - 60) * 60;
    int getHour, getMinute;
    getHour = value ~/ 3600;
    getMinute = ((value - getHour * 3600)) ~/ 60;
    DateTime result = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, getHour, getMinute);
    return result;
  }

  initWithNewCoordinates({
    required double currentLatitude,
    required double currentLongitude,
    required int calculationMethodIndex,
    required int calculationMadhabIndex,
  }) {
    _prayerParams = _calculationParameters[calculationMethodIndex].getParameters();
    _prayerParams.madhab = Madhab.shafi;
    try {
      _prayerTime = PrayerTimes.today(
        Coordinates(
          currentLatitude,
          currentLongitude,
        ),
        _calculationParameters[calculationMethodIndex].getParameters(),
      );
    } on ArgumentError {
      _prayerTime = PrayerTimes.today(
        Coordinates(
          -200.000,
          -200.000,
        ),
        _calculationParameters[calculationMethodIndex].getParameters(),
      );
      _county = '';
      _city = 'Не удалось вычислить время молитв\nВыберите другой город';
    }
  }

  int _prayerValueInMinutes({required DateTime prayerTime}) {
    final DateTime fromZero = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, 0, 0);
    final toPrayer = DateTime(prayerTime.year, prayerTime.month, prayerTime.day, prayerTime.hour, prayerTime.minute);
    return toPrayer.difference(fromZero).inMinutes;
  }

  CoordinatesQuery get coordinatesQuery => _coordinatesQuery;

  createCountry({required CustomCountryModel item}) {
    _coordinatesQuery.createCounty(item: item);
    notifyListeners();
  }

  updateCountry({required int idCountry, required CustomCountryModel item}) {
    _coordinatesQuery.updateCounty(
      idCountry: idCountry,
      item: item,
    );
    notifyListeners();
  }

  deleteCountry(int idCountry) {
    _coordinatesQuery.deleteCounty(idCountry);
    notifyListeners();
  }

  @override
  void dispose() {
    _mainSettingsBox.close();
    _myTimer.cancel();
    super.dispose();
  }
}
