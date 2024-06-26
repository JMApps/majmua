import 'dart:async';

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart';

import '../../core/strings/app_constraints.dart';
import '../../core/strings/app_strings.dart';

class AdhanTimeState extends ChangeNotifier {
  final Box _mainSettingsBox = Hive.box(AppConstraints.keySettingsPrayerTimeBox);
  TZDateTime _dateTime = tz.TZDateTime.from(DateTime.now(), tz.local);
  Timer? timer;

  late PrayerTimes _prayerTimes;
  late CalculationParameters _prayerParams;
  late Coordinates _coordinates;
  late SunnahTimes _sunnahTimes;
  late Qibla _qibla;

  int _fajrAdjustment = 0;
  int _sunriseAdjustment = 0;
  int _dhuhrAdjustment = 0;
  int _asrAdjustment = 0;
  int _maghribAdjustment = 0;
  int _ishaAdjustment = 0;

  String _country = AppConstraints.defCountry;
  String _city = AppConstraints.defCity;
  double _latitude = AppConstraints.defLatitude;
  double _longitude = AppConstraints.defLongitude;
  int _calculationMethodIndex = AppConstraints.defCalculationIndex;
  int _highLatitudeMethodIndex = AppConstraints.defHighLatitudeIndex;
  int _timeOffsetIndex = AppConstraints.defUtcOffsetIndex;
  int _madhabIndex = AppConstraints.defMadhabIndex;

  AdhanTimeState() {
    tz.initializeTimeZones();
    timer = Timer(
      Duration(seconds: (_dateTime.second - 60).abs()),
      () {
        _updateDateTime();
        timer = Timer.periodic(
          const Duration(minutes: 1),
          (_) {
            _updateDateTime();
          },
        );
      },
    );

    _fajrAdjustment = _mainSettingsBox.get(AppConstraints.keyFajrAdjustment, defaultValue: 0);
    _sunriseAdjustment = _mainSettingsBox.get(AppConstraints.keySunriseAdjustment, defaultValue: 0);
    _dhuhrAdjustment = _mainSettingsBox.get(AppConstraints.keyDhuhrAdjustment, defaultValue: 0);
    _asrAdjustment = _mainSettingsBox.get(AppConstraints.keyAsrAdjustment, defaultValue: 0);
    _maghribAdjustment = _mainSettingsBox.get(AppConstraints.keyMaghribAdjustment, defaultValue: 0);
    _ishaAdjustment = _mainSettingsBox.get(AppConstraints.keyIshaAdjustment, defaultValue: 0);

    _country = _mainSettingsBox.get(AppConstraints.keyCountry, defaultValue: AppConstraints.defCountry);
    _city = _mainSettingsBox.get(AppConstraints.keyCity, defaultValue: AppConstraints.defCity);
    _latitude = _mainSettingsBox.get(AppConstraints.keyCurrentLatitude, defaultValue: AppConstraints.defLatitude);
    _longitude = _mainSettingsBox.get(AppConstraints.keyCurrentLongitude, defaultValue: AppConstraints.defLongitude);
    _calculationMethodIndex = _mainSettingsBox.get(AppConstraints.keyCalculationIndex, defaultValue: AppConstraints.defCalculationIndex);
    _highLatitudeMethodIndex = _mainSettingsBox.get(AppConstraints.keyHighLatitudeIndex, defaultValue: AppConstraints.defHighLatitudeIndex);
    _madhabIndex = _mainSettingsBox.get(AppConstraints.keyMadhabIndex, defaultValue: AppConstraints.defMadhabIndex);
    _timeOffsetIndex = _mainSettingsBox.get(AppConstraints.keyUtcOffsetIndex, defaultValue: AppConstraints.defUtcOffsetIndex);

    initPrayerTime();
  }

  void _updateDateTime() {
    _dateTime = tz.TZDateTime.from(DateTime.now(), tz.local);
    notifyListeners();
  }

  void changeNotifiers() {
    notifyListeners();
  }

  // Init prayer params
  initPrayerTime() {
    _coordinates = Coordinates(_latitude, _longitude);
    _prayerParams = AppStrings.prayerCalculationMethods[_calculationMethodIndex].getParameters();
    _prayerParams.highLatitudeRule = AppStrings.highLatitude[_highLatitudeMethodIndex];
    _prayerParams.madhab = AppStrings.calculationMadhab[_madhabIndex];

    _prayerParams.adjustments.fajr = _fajrAdjustment;
    _prayerParams.adjustments.sunrise = _sunriseAdjustment;
    _prayerParams.adjustments.dhuhr = _dhuhrAdjustment;
    _prayerParams.adjustments.asr = _asrAdjustment;
    _prayerParams.adjustments.maghrib = _maghribAdjustment;
    _prayerParams.adjustments.isha = _ishaAdjustment;

    _prayerTimes = PrayerTimes.today(
      _coordinates,
      _prayerParams,
      utcOffset: AppStrings.calculationUtcOffset[timeOffsetIndex],
    );

    _sunnahTimes = SunnahTimes(_prayerTimes);
    _qibla = Qibla(_coordinates);
    notifyListeners();
  }

  // Prayer times
  PrayerTimes get getPrayerTimes => _prayerTimes;

  // Day minutes value
  int get getMinutesOfDay => _dateTime.difference(DateTime(_dateTime.year, _dateTime.month, _dateTime.day)).inMinutes;

  // Prayer param getters
  String get country => _country;

  set setCountry(String country) {
    _country = country;
    _mainSettingsBox.put(AppConstraints.keyCountry, country);
  }

  String get city => _city;

  set setCity(String city) {
    _city = city;
    _mainSettingsBox.put(AppConstraints.keyCity, city);
  }

  double get latitude => _latitude;

  set setLatitude(double latitude) {
    _latitude = latitude;
    _mainSettingsBox.put(AppConstraints.keyCurrentLatitude, latitude);
  }

  double get longitude => _longitude;

  set setLongitude(double longitude) {
    _longitude = longitude;
    _mainSettingsBox.put(AppConstraints.keyCurrentLongitude, longitude);
  }

  int get calculationMethodIndex => _calculationMethodIndex;

  set setCalculationIndex(int index) {
    _calculationMethodIndex = index;
    _mainSettingsBox.put(AppConstraints.keyCalculationIndex, index);
  }

  int get highLatitudeMethodIndex => _highLatitudeMethodIndex;

  set setHighLatitudeIndex(int index) {
    _highLatitudeMethodIndex = index;
    _mainSettingsBox.put(AppConstraints.keyHighLatitudeIndex, index);
  }

  int get madhabIndex => _madhabIndex;

  set setMadhabIndex(int index) {
    _madhabIndex = index;
    _mainSettingsBox.put(AppConstraints.keyMadhabIndex, index);
  }

  int get timeOffsetIndex => _timeOffsetIndex;

  set setTimeOffsetIndex(int index) {
    _timeOffsetIndex = index;
    _mainSettingsBox.put(AppConstraints.keyUtcOffsetIndex, index);
  }

  // Prayer adjustment params
  int get fajrAdjustment => _fajrAdjustment;

  set setFajrAdjustment(int adjustment) {
    _fajrAdjustment = adjustment;
    _mainSettingsBox.put(AppConstraints.keyFajrAdjustment, adjustment);
  }

  int get sunriseAdjustment => _sunriseAdjustment;

  set setSunriseAdjustment(int adjustment) {
    _sunriseAdjustment = adjustment;
    _mainSettingsBox.put(AppConstraints.keySunriseAdjustment, adjustment);
  }

  int get dhuhrAdjustment => _dhuhrAdjustment;

  set setDhuhrAdjustment(int adjustment) {
    _dhuhrAdjustment = adjustment;
    _mainSettingsBox.put(AppConstraints.keyDhuhrAdjustment, adjustment);
  }

  int get asrAdjustment => _asrAdjustment;

  set setAsrAdjustment(int adjustment) {
    _asrAdjustment = adjustment;
    _mainSettingsBox.put(AppConstraints.keyAsrAdjustment, adjustment);
  }

  int get maghribAdjustment => _maghribAdjustment;

  set setMaghribAdjustment(int adjustment) {
    _maghribAdjustment = adjustment;
    _mainSettingsBox.put(AppConstraints.keyMaghribAdjustment, adjustment);
  }

  int get ishaAdjustment => _ishaAdjustment;

  set setIshaAdjustment(int adjustment) {
    _ishaAdjustment = adjustment;
    _mainSettingsBox.put(AppConstraints.keyIshaAdjustment, adjustment);
  }

  // Prayers value in minutes
  int get getFajrValueInMinutes => _prayerValueInMinutes(prayerTime: _prayerTimes.fajr);

  int get getSunriseValueInMinutes => _prayerValueInMinutes(prayerTime: _prayerTimes.sunrise);

  int get getDhuhrValueInMinutes => _prayerValueInMinutes(prayerTime: _prayerTimes.dhuhr);

  int get getAsrValueInMinutes => _prayerValueInMinutes(prayerTime: _prayerTimes.asr);

  int get getMaghribValueInMinutes => _prayerValueInMinutes(prayerTime: _prayerTimes.maghrib);

  int get getIshaValueInMinutes => _prayerValueInMinutes(prayerTime: _prayerTimes.isha);

  int get getMidnightValueInMinutes => _prayerValueInMinutes(prayerTime: _sunnahTimes.middleOfTheNight);

  int _prayerValueInMinutes({required DateTime prayerTime}) {
    final DateTime fromZero = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, 0, 0);
    final toPrayer = DateTime(prayerTime.year, prayerTime.month, prayerTime.day, prayerTime.hour, prayerTime.minute);
    return toPrayer.difference(fromZero).inMinutes;
  }

  // Third night part and midnight times
  DateTime get getThirdNightPart {
    return _sunnahTimes.lastThirdOfTheNight;
  }

  DateTime get getMidnight {
    return _sunnahTimes.middleOfTheNight;
  }

  // Qibla direction
  double get getQiblaDirection {
    return _qibla.direction;
  }

  // Day parts
  bool get getIsMorning {
    final bool isMorning;
    isMorning = getMinutesOfDay > (getFajrValueInMinutes + 30) && getMinutesOfDay < (getSunriseValueInMinutes - 1);
    return isMorning;
  }

  bool get getIsDuha {
    final bool isDuha;
    isDuha = getMinutesOfDay > (getSunriseValueInMinutes + 30) && getMinutesOfDay < (getDhuhrValueInMinutes - 15);
    return isDuha;
  }

  bool get getIsEvening {
    final bool isEvening;
    isEvening = getMinutesOfDay > (getAsrValueInMinutes + 30) && getMinutesOfDay < (getMaghribValueInMinutes - 1);
    return isEvening;
  }

  bool get getIsNight {
    final bool isNight;
    isNight = getMinutesOfDay > (getIshaValueInMinutes + 30) && getMinutesOfDay < getMidnightValueInMinutes;
    return isNight;
  }

  bool get getIsFriday {
    final bool isFriday;
    bool firstCheck = _dateTime.weekday == 4 && getMinutesOfDay >= getMaghribValueInMinutes;
    bool secondCheck = _dateTime.weekday == 5 && getMinutesOfDay <= getMaghribValueInMinutes;
    isFriday = firstCheck || secondCheck;
    return isFriday;
  }

  // Before/After prayer times
  DateTime beforePrayerTime(Prayer prayer) {
    final int timeValue = (_prayerTimes.timeForPrayer(prayer)!.difference(_dateTime).inMinutes + 1) * 60;
    int hour, minute;
    hour = timeValue ~/ 3600;
    minute = ((timeValue - hour * 3600)) ~/ 60;
    DateTime result = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, hour, minute).toUtc();
    return result;
  }

  DateTime afterPrayerTime(Prayer prayer) {
    final int timeValue = (_dateTime.difference(_prayerTimes.timeForPrayer(prayer)!).inMinutes - 1) * 60;
    int hour, minute;
    hour = timeValue ~/ 3600;
    minute = ((timeValue - hour * 3600)) ~/ 60;
    DateTime result = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, hour, minute).toUtc();
    result = result.subtract(const Duration(hours: 18));
    return result;
  }

  String sharePrayerTimes({
    required String fajr,
    required String sunrise,
    required String dhuhr,
    required String asr,
    required String maghrib,
    required String isha,
    required String midnight,
    required String thirdNightPart,
    required String prayerCalculationMethod,
    required String timeOffset,
    required String qiblaDirection}) {
    final String prayersInfo;
    prayersInfo = '$_country, $_city\n'
        '${_dateTime.day}.${_dateTime.month}.${_dateTime.year}\n\n'
        '$fajr: ${DateFormat.Hm().format(_prayerTimes.fajr)}\n'
        '$sunrise: ${DateFormat.Hm().format(_prayerTimes.sunrise)}\n'
        '$dhuhr: ${DateFormat.Hm().format(_prayerTimes.dhuhr)}\n'
        '$asr: ${DateFormat.Hm().format(_prayerTimes.asr)}\n'
        '$maghrib: ${DateFormat.Hm().format(_prayerTimes.maghrib)}\n'
        '$isha: ${DateFormat.Hm().format(_prayerTimes.isha)}\n\n'
        '$midnight: ${DateFormat.Hm().format(_sunnahTimes.middleOfTheNight)}\n'
        '$thirdNightPart: ${DateFormat.Hm().format(_sunnahTimes.lastThirdOfTheNight)}\n'
        '$prayerCalculationMethod: ${AppStrings.prayerCalculationNames[_calculationMethodIndex]}\n'
        '$timeOffset: ${_dateTime.timeZoneName}\n'
        '$qiblaDirection: ${_qibla.direction.toStringAsFixed(1)}°';
    return prayersInfo;
  }
}
