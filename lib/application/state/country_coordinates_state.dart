import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/application/constants/app_constants.dart';
import 'package:majmua/data/database/local/model/country_model.dart';

class CountryCoordinatesState extends ChangeNotifier {
  final _mainSettingsBox = Hive.box(AppConstants.keySettingsPrayerTimeBox);
  final DateTime _dateTime = DateTime.now();
  late PrayerTimes _prayerTime;

  late String _county;
  late String _city;
  late double _currentLatitude;
  late double _currentLongitude;
  late int _calculationMethodIndex;

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

  CountryCoordinatesState() {
    _county = _mainSettingsBox.get(AppConstants.keyCountry, defaultValue: 'Saudi Arabia');
    _city = _mainSettingsBox.get(AppConstants.keyCity, defaultValue: 'Mecca');
    _currentLatitude = _mainSettingsBox.get(AppConstants.keyCurrentLatitude, defaultValue: 21.392425120226704);
    _currentLongitude = _mainSettingsBox.get(AppConstants.keyCurrentLongitude, defaultValue: 39.85797038428307);
    _calculationMethodIndex = _mainSettingsBox.get(AppConstants.keyCalculationIndex, defaultValue: 0);

    initWithNewCoordinates(
      currentLatitude: _currentLatitude,
      currentLongitude: _currentLongitude,
      calculationMethodIndex: _calculationMethodIndex,
    );
  }

  initWithNewCoordinates({
    required double currentLatitude,
    required double currentLongitude,
    required int calculationMethodIndex,
  }) {
    _prayerTime = PrayerTimes.today(
      Coordinates(
        currentLatitude,
        currentLongitude,
      ),
      _calculationParameters[calculationMethodIndex].getParameters(),
    );
  }

  int _prayerValueInMinutes({required DateTime prayerTime}) {
    final DateTime fromZero = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, 0, 0);
    final toPrayer = DateTime(prayerTime.year, prayerTime.month, prayerTime.day, prayerTime.hour, prayerTime.minute);
    return toPrayer.difference(fromZero).inMinutes;
  }

  DateTime toPrayerTime(Prayer currentPrayer) {
    final DateTime toPrayerTime = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, _prayerTime.timeForPrayer(currentPrayer)!.hour, _prayerTime.timeForPrayer(currentPrayer)!.minute);
    int value = _dateTime.difference(toPrayerTime).inMinutes * 60;
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

  set changeCountry(CountryModel item) {
    _county = item.country;
    _city = item.city;
    _currentLatitude = item.latitude;
    _currentLongitude = item.longitude;
    _mainSettingsBox.put(AppConstants.keyCountry, _county);
    _mainSettingsBox.put(AppConstants.keyCity, _city);
    _mainSettingsBox.put(AppConstants.keyCurrentLatitude, _currentLatitude);
    _mainSettingsBox.put(AppConstants.keyCurrentLongitude, _currentLongitude);
    initWithNewCoordinates(
      currentLatitude: item.latitude,
      currentLongitude: item.longitude,
      calculationMethodIndex: _calculationMethodIndex,
    );
    notifyListeners();
  }

  set changeCalculationMethod(int calculationMethodIndex) {
    _calculationMethodIndex = calculationMethodIndex;
    initWithNewCoordinates(
      currentLatitude: _currentLatitude,
      currentLongitude:_currentLongitude,
      calculationMethodIndex: calculationMethodIndex,
    );
    _mainSettingsBox.put(AppConstants.keyCalculationIndex, calculationMethodIndex);
    notifyListeners();
  }

  int get getSecondNightValueInMinutes => _prayerValueInMinutes(prayerTime: DateTime(_dateTime.year, _dateTime.month, _dateTime.day, 0, 1));

  int get getFajrValueInMinutes => _prayerValueInMinutes(prayerTime: _prayerTime.fajr);

  int get getSunriseValueInMinutes => _prayerValueInMinutes(prayerTime: _prayerTime.sunrise);

  int get getDhuhrValueInMinutes => _prayerValueInMinutes(prayerTime: _prayerTime.dhuhr);

  int get getAsrValueInMinutes => _prayerValueInMinutes(prayerTime: _prayerTime.asr);

  int get getMaghribValueInMinutes => _prayerValueInMinutes(prayerTime: _prayerTime.maghrib);

  int get getIshaValueInMinutes => _prayerValueInMinutes(prayerTime: _prayerTime.isha);

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

  @override
  void dispose() {
    _mainSettingsBox.close();
    super.dispose();
  }
}
