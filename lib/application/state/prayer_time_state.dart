import 'dart:async';

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/application/strings/app_constants.dart';
import 'package:majmua/data/database/queries/default_custom_country_query.dart';

class PrayerTimeState extends ChangeNotifier {
  DateTime _cdt = DateTime.now().toLocal();
  final DefaultCustomCountryQuery _defaultCustomCountryQuery = DefaultCustomCountryQuery();
  final _mainSettingsBox = Hive.box(AppConstants.keySettingsPrayerTimeBox);
  late Timer _timer;
  late PrayerTimes _prayerTimes;
  late CalculationParameters _prayerParams;

  late String _country;
  late String _city;
  late int _calculationMethodIndex;
  late int _madhabIndex;
  late double _latitude;
  late double _longitude;
  late Coordinates _coordinates;
  late int _timeOffsetIndex;

  final List<CalculationMethod> _calculationMethods = [
    CalculationMethod.umm_al_qura,
    CalculationMethod.north_america,
    // CalculationMethod.russia,
    // CalculationMethod.tatarstan,
    // CalculationMethod.france,
    CalculationMethod.dubai,
    CalculationMethod.egyptian,
    CalculationMethod.karachi,
    CalculationMethod.kuwait,
    CalculationMethod.moon_sighting_committee,
    CalculationMethod.muslim_world_league,
    CalculationMethod.qatar,
    CalculationMethod.turkey,
    CalculationMethod.singapore,
  ];

  final List<Duration> _calculationUtcOffset = [
    DateTime.now().timeZoneOffset - const Duration(hours: 1),
    DateTime.now().timeZoneOffset,
    DateTime.now().timeZoneOffset + const Duration(hours: 1),
  ];

  final List<Madhab> _calculationMadhab = [
    Madhab.shafi,
    Madhab.hanafi,
  ];

  int get getMinutesOfDay => _cdt.difference(DateTime(_cdt.year, _cdt.month, _cdt.day)).inMinutes;

  PrayerTimeState() {
    _timer = Timer(
      Duration(seconds: (_cdt.second - 60).abs()),
      () {
        _cdt = DateTime.now().toLocal();
        notifyListeners();
        _timer = Timer.periodic(
          const Duration(minutes: 1),
          (_) {
            _cdt = DateTime.now().toLocal();
            notifyListeners();
          },
        );
      },
    );

    _country = _mainSettingsBox.get(AppConstants.keyCountry, defaultValue: 'Saudi Arabia');
    _city = _mainSettingsBox.get(AppConstants.keyCity, defaultValue: 'Mecca');
    _calculationMethodIndex = _mainSettingsBox.get(AppConstants.keyCalculationIndex, defaultValue: 1);
    _madhabIndex = _mainSettingsBox.get(AppConstants.keyMadhabIndex, defaultValue: 0);
    _latitude = _mainSettingsBox.get(AppConstants.keyCurrentLatitude, defaultValue: 21.392425120226704);
    _longitude = _mainSettingsBox.get(AppConstants.keyCurrentLongitude, defaultValue: 39.85797038428307);
    _coordinates = Coordinates(_latitude, _longitude);
    _timeOffsetIndex = _mainSettingsBox.get(AppConstants.keyUtcOffsetIndex, defaultValue: 1);

    initPrayerTime(
      calculationMethodIndex: _calculationMethodIndex,
      madhabIndex: _madhabIndex,
      coordinates: _coordinates,
      timeOffsetIndex: _timeOffsetIndex,
    );
  }

  PrayerTimes get getPrayerTimes => _prayerTimes;

  initPrayerTime({
    required int calculationMethodIndex,
    required int madhabIndex,
    required Coordinates coordinates,
    required int timeOffsetIndex,
  }) {
    _prayerParams = _calculationMethods[calculationMethodIndex].getParameters();
    _prayerParams.madhab = _calculationMadhab[madhabIndex];
    _prayerTimes = PrayerTimes(
      coordinates,
      DateComponents(_cdt.year, _cdt.month, _cdt.day),
      _prayerParams,
      utcOffset: _calculationUtcOffset[_timeOffsetIndex]
    );
  }

  set setCountry(String newCountry) {
    _country = newCountry;
    _mainSettingsBox.put(AppConstants.keyCountry, newCountry);
    notifyListeners();
  }

  String get getCountry => _country;

  set setCity(String newCity) {
    _city = newCity;
    _mainSettingsBox.put(AppConstants.keyCity, newCity);
    notifyListeners();
  }

  String get getCity => _city;

  set setCalculationMethod(int newCalculationMethodIndex) {
    _calculationMethodIndex = newCalculationMethodIndex;
    initPrayerTime(
      calculationMethodIndex: newCalculationMethodIndex,
      madhabIndex: _madhabIndex,
      coordinates: _coordinates,
      timeOffsetIndex: _timeOffsetIndex,
    );
    _mainSettingsBox.put(AppConstants.keyCalculationIndex, newCalculationMethodIndex);
    notifyListeners();
  }

  int get getCalculationIndex => _calculationMethodIndex;

  set setMadhabMethod(int newMadhabIndex) {
    _madhabIndex = newMadhabIndex;
    initPrayerTime(
      calculationMethodIndex: _calculationMethodIndex,
      madhabIndex: newMadhabIndex,
      coordinates: _coordinates,
      timeOffsetIndex: _timeOffsetIndex,
    );
    _mainSettingsBox.put(AppConstants.keyMadhabIndex, newMadhabIndex);
    notifyListeners();
  }

  int get getMadhabIndex => _madhabIndex;

  set setCoordinates(Coordinates coordinates) {
    _coordinates = coordinates;
    _latitude = coordinates.latitude;
    _longitude = coordinates.longitude;
    initPrayerTime(
      calculationMethodIndex: _calculationMethodIndex,
      madhabIndex: _madhabIndex,
      coordinates: coordinates,
      timeOffsetIndex: _timeOffsetIndex,
    );
    _mainSettingsBox.put(AppConstants.keyCurrentLatitude, coordinates.latitude);
    _mainSettingsBox.put(AppConstants.keyCurrentLongitude, coordinates.longitude);
    notifyListeners();
  }

  Coordinates get getCoordinates => _coordinates;

  double get getLatitude => _latitude;

  double get getLongitude => _longitude;

  set setTimeOffset(int timeOffsetIndex) {
    _timeOffsetIndex = timeOffsetIndex;
    initPrayerTime(
      calculationMethodIndex: _calculationMethodIndex,
      madhabIndex: _madhabIndex,
      coordinates: _coordinates,
      timeOffsetIndex: timeOffsetIndex,
    );
    _mainSettingsBox.put(AppConstants.keyUtcOffsetIndex, timeOffsetIndex);
    notifyListeners();
  }

  int get getTimeOffsetIndex => _timeOffsetIndex;

  int get getFajrValueInMinutes => _prayerValueInMinutes(prayerTime: _prayerTimes.fajr);

  int get getSunriseValueInMinutes => _prayerValueInMinutes(prayerTime: _prayerTimes.sunrise);

  int get getDhuhrValueInMinutes => _prayerValueInMinutes(prayerTime: _prayerTimes.dhuhr);

  int get getAsrValueInMinutes => _prayerValueInMinutes(prayerTime: _prayerTimes.asr);

  int get getMaghribValueInMinutes => _prayerValueInMinutes(prayerTime: _prayerTimes.maghrib);

  int get getIshaValueInMinutes => _prayerValueInMinutes(prayerTime: _prayerTimes.isha);

  DateTime toPrayerTime(Prayer prayer) {
    final DateTime toPrayer = DateTime(_cdt.year, _cdt.month, _cdt.day, _prayerTimes.timeForPrayer(prayer)!.hour, _prayerTimes.timeForPrayer(prayer)!.minute);
    final int timeValue = (toPrayer.difference(_cdt).inMinutes + 1) * 60;
    int hour, minute;
    hour = timeValue ~/ 3600;
    minute = ((timeValue - hour * 3600)) ~/ 60;
    DateTime result = DateTime(_cdt.year, _cdt.month, _cdt.day, hour, minute);
    return result;
  }

  DateTime fromPrayerTime(Prayer prayer) {
    final DateTime toPrayer = DateTime(_cdt.year, _cdt.month, _cdt.day, _prayerTimes.timeForPrayer(prayer)!.hour, _prayerTimes.timeForPrayer(prayer)!.minute);
    final int timeValue = (_cdt.difference(toPrayer).inMinutes) * 60;
    int hour, minute;
    hour = timeValue ~/ 3600;
    minute = ((timeValue - hour * 3600)) ~/ 60;
    DateTime result = DateTime(_cdt.year, _cdt.month, _cdt.day, hour, minute);
    return result;
  }

  DateTime get getThirdNightPart {
    double thirdValue = (1440 - getIshaValueInMinutes + getFajrValueInMinutes) * 60 / 3;
    double value = (getFajrValueInMinutes * 60) - thirdValue;
    int hour, minute;
    hour = value ~/ 3600;
    minute = ((value - hour * 3600)) ~/ 60;
    DateTime result = DateTime(_cdt.year, _cdt.month, _cdt.day, hour, minute);
    return result;
  }

  DefaultCustomCountryQuery get defaultCustomCountryQuery =>
      _defaultCustomCountryQuery;

  set createCity(Map<String, String> newCity) {
    _defaultCustomCountryQuery.createCity(newCity: newCity);
    notifyListeners();
  }

  updateCity(Map<String, String> updateCity, int idCity) {
    _defaultCustomCountryQuery.updateCity(updateCity: updateCity, idCity: idCity);
    notifyListeners();
  }

  set deleteCity(int idCity) {
    _defaultCustomCountryQuery.deleteCity(idCity: idCity);
    notifyListeners();
  }

  int _prayerValueInMinutes({required DateTime prayerTime}) {
    final DateTime fromZero = DateTime(_cdt.year, _cdt.month, _cdt.day, 0, 0);
    final toPrayer = DateTime(prayerTime.year, prayerTime.month, prayerTime.day, prayerTime.hour, prayerTime.minute);
    return toPrayer.difference(fromZero).inMinutes;
  }

  @override
  void dispose() {
    _mainSettingsBox.close();
    _timer.cancel();
    super.dispose();
  }
}
