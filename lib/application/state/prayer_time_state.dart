import 'dart:async';

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:majmua/application/strings/app_constants.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/data/database/queries/default_custom_country_query.dart';

class PrayerTimeState extends ChangeNotifier {
  DateTime _cdt = DateTime.now().toLocal();
  final DefaultCustomCountryQuery _defaultCustomCountryQuery = DefaultCustomCountryQuery();
  final _mainSettingsBox = Hive.box(AppConstants.keySettingsPrayerTimeBox);
  Timer? timer;
  late PrayerTimes _prayerTimes;
  late CalculationParameters _prayerParams;
  late SunnahTimes _sunnahTimes;
  late Qibla _qibla;
  late int _fajrAdjustment;
  late int _sunriseAdjustment;
  late int _dhuhrAdjustment;
  late int _asrAdjustment;
  late int _maghribAdjustment;
  late int _ishaAdjustment;

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
    CalculationMethod.russia,
    CalculationMethod.tatarstan,
    CalculationMethod.france,
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
    timer = Timer(
      Duration(seconds: (_cdt.second - 60).abs()),
      () {
        _cdt = DateTime.now().toLocal();
        notifyListeners();
        timer = Timer.periodic(
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
    _calculationMethodIndex = _mainSettingsBox.get(AppConstants.keyCalculationIndex, defaultValue: 10);
    _madhabIndex = _mainSettingsBox.get(AppConstants.keyMadhabIndex, defaultValue: 0);
    _fajrAdjustment = _mainSettingsBox.get(AppConstants.keyFajrAdjustment, defaultValue: 0);
    _sunriseAdjustment = _mainSettingsBox.get(AppConstants.keySunriseAdjustment, defaultValue: 0);
    _dhuhrAdjustment = _mainSettingsBox.get(AppConstants.keyDhuhrAdjustment, defaultValue: 0);
    _asrAdjustment = _mainSettingsBox.get(AppConstants.keyAsrAdjustment, defaultValue: 0);
    _maghribAdjustment = _mainSettingsBox.get(AppConstants.keyMaghribAdjustment, defaultValue: 0);
    _ishaAdjustment = _mainSettingsBox.get(AppConstants.keyIshaAdjustment, defaultValue: 0);
    _latitude = _mainSettingsBox.get(AppConstants.keyCurrentLatitude, defaultValue: 21.392425);
    _longitude = _mainSettingsBox.get(AppConstants.keyCurrentLongitude, defaultValue: 39.857970);
    _coordinates = Coordinates(_latitude, _longitude, validate: false);
    _timeOffsetIndex = _mainSettingsBox.get(AppConstants.keyUtcOffsetIndex, defaultValue: 1);
    _qibla = Qibla(_coordinates);

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
    _prayerParams.adjustments.fajr = _fajrAdjustment;
    _prayerParams.adjustments.sunrise = _sunriseAdjustment;
    _prayerParams.adjustments.dhuhr = _dhuhrAdjustment;
    _prayerParams.adjustments.asr = _asrAdjustment;
    _prayerParams.adjustments.maghrib = _maghribAdjustment;
    _prayerParams.adjustments.isha = _ishaAdjustment;
    _prayerTimes = PrayerTimes.today(
      coordinates,
      _prayerParams,
      utcOffset: _calculationUtcOffset[_timeOffsetIndex],
    );
    _sunnahTimes = SunnahTimes(_prayerTimes);
    _qibla = Qibla(_coordinates);
  }

  int get getFajrAdjustment => _fajrAdjustment;

  int get getSunriseAdjustment => _sunriseAdjustment;

  int get getDhuhrAdjustment => _dhuhrAdjustment;

  int get getAsrAdjustment => _asrAdjustment;

  int get getMaghribAdjustment => _maghribAdjustment;

  int get getIshaAdjustment => _ishaAdjustment;

  set setFajrAdjustment(int value) {
    _fajrAdjustment = value;
    initPrayerTime(
      calculationMethodIndex: _calculationMethodIndex,
      madhabIndex: _madhabIndex,
      coordinates: _coordinates,
      timeOffsetIndex: _timeOffsetIndex,
    );
    _mainSettingsBox.put(AppConstants.keyFajrAdjustment, _fajrAdjustment);
  notifyListeners();
  }

  set setSunriseAdjustment(int value) {
    _sunriseAdjustment = value;
    initPrayerTime(
      calculationMethodIndex: _calculationMethodIndex,
      madhabIndex: _madhabIndex,
      coordinates: _coordinates,
      timeOffsetIndex: _timeOffsetIndex,
    );
    _mainSettingsBox.put(AppConstants.keySunriseAdjustment, _sunriseAdjustment);
  notifyListeners();
  }

  set setDhuhrAdjustment(int value) {
    _dhuhrAdjustment = value;
    initPrayerTime(
      calculationMethodIndex: _calculationMethodIndex,
      madhabIndex: _madhabIndex,
      coordinates: _coordinates,
      timeOffsetIndex: _timeOffsetIndex,
    );
    _mainSettingsBox.put(AppConstants.keyDhuhrAdjustment, _dhuhrAdjustment);
  notifyListeners();
  }

  set setAsrAdjustment(int value) {
    _asrAdjustment = value;
    initPrayerTime(
      calculationMethodIndex: _calculationMethodIndex,
      madhabIndex: _madhabIndex,
      coordinates: _coordinates,
      timeOffsetIndex: _timeOffsetIndex,
    );
    _mainSettingsBox.put(AppConstants.keyAsrAdjustment, _asrAdjustment);
  notifyListeners();
  }

  set setMaghribAdjustment(int value) {
    _maghribAdjustment = value;
    initPrayerTime(
      calculationMethodIndex: _calculationMethodIndex,
      madhabIndex: _madhabIndex,
      coordinates: _coordinates,
      timeOffsetIndex: _timeOffsetIndex,
    );
    _mainSettingsBox.put(AppConstants.keyMaghribAdjustment, _maghribAdjustment);
  notifyListeners();
  }

  set setIshaAdjustment(int value) {
    _ishaAdjustment = value;
    initPrayerTime(
      calculationMethodIndex: _calculationMethodIndex,
      madhabIndex: _madhabIndex,
      coordinates: _coordinates,
      timeOffsetIndex: _timeOffsetIndex,
    );
    _mainSettingsBox.put(AppConstants.keyIshaAdjustment, _ishaAdjustment);
  notifyListeners();
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

  bool get getIsMorning {
    final bool isMorning;
    isMorning = getMinutesOfDay > getFajrValueInMinutes + 30 && getMinutesOfDay < getDhuhrValueInMinutes - 5;
    return isMorning;
  }

  bool get getIsDuha {
    final bool isDuha;
    isDuha = getMinutesOfDay > getSunriseValueInMinutes + 45 && getMinutesOfDay < getDhuhrValueInMinutes - 5;
    return isDuha;
  }

  bool get getIsEvening {
    final bool isEvening;
    isEvening = getMinutesOfDay > getAsrValueInMinutes + 30 && getMinutesOfDay < getMaghribValueInMinutes - 5;
    return isEvening;
  }

  bool get getIsNight {
    final bool isNight;
    isNight = getMinutesOfDay > getIshaValueInMinutes + 30 && getMinutesOfDay < 1440;
    return isNight;
  }

  DateTime beforePrayerTime(Prayer prayer) {
    final int timeValue = (_prayerTimes.timeForPrayer(prayer)!.difference(_cdt).inMinutes + 1) * 60;
    int hour, minute;
    hour = timeValue ~/ 3600;
    minute = ((timeValue - hour * 3600)) ~/ 60;
    DateTime result = DateTime(_cdt.year, _cdt.month, _cdt.day, hour, minute);
    return result;
  }

  DateTime afterPrayerTime(Prayer prayer) {
    final int timeValue = (_cdt.difference(_prayerTimes.timeForPrayer(prayer)!).inMinutes - 1) * 60;
    int hour, minute;
    hour = timeValue ~/ 3600;
    minute = ((timeValue - hour * 3600)) ~/ 60;
    DateTime result = DateTime(_cdt.year, _cdt.month, _cdt.day, hour, minute);
    return result;
  }

  DateTime get getThirdNightPart {
    return _sunnahTimes.lastThirdOfTheNight;
  }

  DateTime get getMidnight {
    return _sunnahTimes.middleOfTheNight;
  }

  DefaultCustomCountryQuery get defaultCustomCountryQuery => _defaultCustomCountryQuery;

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

  bool get getFridayState {
    late bool isFriday;
    isFriday = _cdt.weekday == 4 && getMinutesOfDay > getMaghribValueInMinutes ||
        _cdt.weekday == 5 && getMinutesOfDay < getMaghribValueInMinutes;
    return isFriday;
  }

  double get getQiblaCoordinates {
    return _qibla.direction;
  }

  String get getContentForShare {
    late String content;
    content = '''$getCountry, $getCity
${_cdt.day}.${_cdt.month}.${_cdt.year}
    
${AppString.fajr}: ${DateFormat.Hm().format(_prayerTimes.fajr)}
${AppString.sunrise}: ${DateFormat.Hm().format(_prayerTimes.sunrise)}
${AppString.dhuhr}: ${DateFormat.Hm().format(_prayerTimes.dhuhr)}
${AppString.asr}: ${DateFormat.Hm().format(_prayerTimes.asr)}
${AppString.maghrib}: ${DateFormat.Hm().format(_prayerTimes.maghrib)}
${AppString.isha}: ${DateFormat.Hm().format(_prayerTimes.isha)}
  
${AppString.lastThirdNight} ${DateFormat.Hm().format(getThirdNightPart)}
${AppString.midnight} ${DateFormat.Hm().format(getMidnight)}
${AppString.calculatePrayerMethod}: ${AppString.calculationMethodNames[_calculationMethodIndex]}
${AppString.dateTimeOffset}: ${_cdt.timeZoneName}''';
    return content;
  }

  int _prayerValueInMinutes({required DateTime prayerTime}) {
    final DateTime fromZero = DateTime(_cdt.year, _cdt.month, _cdt.day, 0, 0);
    final toPrayer = DateTime(prayerTime.year, prayerTime.month, prayerTime.day, prayerTime.hour, prayerTime.minute);
    return toPrayer.difference(fromZero).inMinutes;
  }
}
