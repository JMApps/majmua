import 'package:adhan/adhan.dart';
import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/timezone.dart';

import '../../core/strings/app_string_constraints.dart';

class PrayerState extends ChangeNotifier {
  late final Box _settingsPrayerTimeBox;
  late TZDateTime _dateTime;
  final Cron _cron = Cron();
  static const Duration hourInterval = Duration(hours: 1);

  late PrayerTimes _prayerTimes;
  late CalculationParameters _prayerParams;
  late Coordinates _coordinates;
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

  late double _latitude;
  late double _longitude;

  late int _calculationMethodIndex;
  late int _highLatitudeMethodIndex;
  late bool _dst;
  late int _madhabIndex;

  PrayerState(this._settingsPrayerTimeBox) {
    _fajrAdjustment = _settingsPrayerTimeBox.get(AppStringConstraints.keyFajrAdjustment, defaultValue: 0);
    _sunriseAdjustment = _settingsPrayerTimeBox.get(AppStringConstraints.keySunriseAdjustment, defaultValue: 0);
    _dhuhrAdjustment = _settingsPrayerTimeBox.get(AppStringConstraints.keyDhuhrAdjustment, defaultValue: 0);
    _asrAdjustment = _settingsPrayerTimeBox.get(AppStringConstraints.keyAsrAdjustment, defaultValue: 0);
    _maghribAdjustment = _settingsPrayerTimeBox.get(AppStringConstraints.keyMaghribAdjustment, defaultValue: 0);
    _ishaAdjustment = _settingsPrayerTimeBox.get(AppStringConstraints.keyIshaAdjustment, defaultValue: 0);

    _country = _settingsPrayerTimeBox.get(AppStringConstraints.keyCountry, defaultValue: 'Saudi Arabia');
    _city = _settingsPrayerTimeBox.get(AppStringConstraints.keyCity, defaultValue: 'Mecca');
    _latitude = _settingsPrayerTimeBox.get(AppStringConstraints.keyCurrentLatitude, defaultValue: 21.42580);
    _longitude = _settingsPrayerTimeBox.get(AppStringConstraints.keyCurrentLongitude, defaultValue: 39.82410);
    _calculationMethodIndex = _settingsPrayerTimeBox.get(AppStringConstraints.keyCalculationIndex, defaultValue: 10);
    _highLatitudeMethodIndex = _settingsPrayerTimeBox.get(AppStringConstraints.keyHighLatitudeIndex, defaultValue: 0);
    _madhabIndex = _settingsPrayerTimeBox.get(AppStringConstraints.keyMadhabIndex, defaultValue: 0);
    _dst = _settingsPrayerTimeBox.get(AppStringConstraints.keyDST, defaultValue: false);
    tz.initializeTimeZones();
    _dateTime = tz.TZDateTime.from(DateTime.now(), tz.local);
    _startCron();
    initPrayerTime();
  }

  void initPrayerTime() {
    _coordinates = Coordinates(_latitude, _longitude);

    _prayerParams = AppStringConstraints.prayerCalculationMethods[_calculationMethodIndex].getParameters()
      ..highLatitudeRule = AppStringConstraints.highLatitude[_highLatitudeMethodIndex]
      ..madhab = AppStringConstraints.calculationMadhab[_madhabIndex];

    _prayerParams.adjustments.fajr = _fajrAdjustment;
    _prayerParams.adjustments.sunrise = _sunriseAdjustment;
    _prayerParams.adjustments.dhuhr = _dhuhrAdjustment;
    _prayerParams.adjustments.asr = _asrAdjustment;
    _prayerParams.adjustments.maghrib = _maghribAdjustment;
    _prayerParams.adjustments.isha = _ishaAdjustment;

    _prayerTimes = PrayerTimes.today(
      _coordinates,
      _prayerParams,
    );

    _sunnahTimes = SunnahTimes(_prayerTimes);
    _qibla = Qibla(_coordinates);
    notifyListeners();
  }

  PrayerTimes prayerTimeSchedule({required DateTime time}) {
    return PrayerTimes(_coordinates, DateComponents.from(time), _prayerParams);
  }

  PrayerTimes get prayerTimes => _prayerTimes;

  SunnahTimes get sunnahTimes => _sunnahTimes;

  Qibla get qiblahDirection => _qibla;

  String get country => _country;

  set changCountry(String country) {
    _country = country;
    _settingsPrayerTimeBox.put(AppStringConstraints.keyCountry, country);
  }

  String get city => _city;

  set changeCity(String city) {
    _city = city;
    _settingsPrayerTimeBox.put(AppStringConstraints.keyCity, city);
  }

  double get latitude => _latitude;

  set setLatitude(double latitude) {
    _latitude = latitude;
    _settingsPrayerTimeBox.put(AppStringConstraints.keyCurrentLatitude, latitude);
  }

  double get longitude => _longitude;

  set setLongitude(double longitude) {
    _longitude = longitude;
    _settingsPrayerTimeBox.put(AppStringConstraints.keyCurrentLongitude, longitude);
  }

  int get calculationMethodIndex => _calculationMethodIndex;

  set setCalculationIndex(int index) {
    _calculationMethodIndex = index;
    _settingsPrayerTimeBox.put(AppStringConstraints.keyCalculationIndex, index);
    initPrayerTime();
  }

  int get highLatitudeMethodIndex => _highLatitudeMethodIndex;

  set setHighLatitudeIndex(int index) {
    _highLatitudeMethodIndex = index;
    _settingsPrayerTimeBox.put(AppStringConstraints.keyHighLatitudeIndex, index);
    initPrayerTime();
  }

  int get madhabIndex => _madhabIndex;

  set setMadhabIndex(int index) {
    _madhabIndex = index;
    _settingsPrayerTimeBox.put(AppStringConstraints.keyMadhabIndex, index);
    initPrayerTime();
  }

  bool get dst => _dst;

  set setDst(bool dstState) {
    _dst = dstState;
    _settingsPrayerTimeBox.put(AppStringConstraints.keyDST, dstState);
    initPrayerTime();
  }

  int get getMinutesOfDay => _dateTime.difference(DateTime(_dateTime.year, _dateTime.month, _dateTime.day)).inMinutes;

  int get getFajrValueInMinutes => _prayerValueInMinutes(time: _prayerTimes.fajr);

  int get getSunriseValueInMinutes => _prayerValueInMinutes(time: _prayerTimes.sunrise);

  int get getDhuhrValueInMinutes => _prayerValueInMinutes(time: _prayerTimes.dhuhr);

  int get getAsrValueInMinutes => _prayerValueInMinutes(time: _prayerTimes.asr);

  int get getMaghribValueInMinutes => _prayerValueInMinutes(time: _prayerTimes.maghrib);

  int get getIshaValueInMinutes => _prayerValueInMinutes(time: _prayerTimes.isha);

  int get getMidnightValueInMinutes => _prayerValueInMinutes(time: _sunnahTimes.middleOfTheNight);

  int get getThirdPartValueInMinutes => _prayerValueInMinutes(time: _sunnahTimes.lastThirdOfTheNight);

  int get fajrAdjustment => _fajrAdjustment;

  int get sunriseAdjustment => _sunriseAdjustment;

  int get dhuhrAdjustment => _dhuhrAdjustment;

  int get asrAdjustment => _asrAdjustment;

  int get maghribAdjustment => _maghribAdjustment;

  int get ishaAdjustment => _ishaAdjustment;

  set fajrAdjustment(int value) {
    if (_fajrAdjustment != value) {
      _fajrAdjustment = value;
      _settingsPrayerTimeBox.put(AppStringConstraints.keyFajrAdjustment, value);
      initPrayerTime();
    }
  }

  set sunriseAdjustment(int value) {
    if (_sunriseAdjustment != value) {
      _sunriseAdjustment = value;
      _settingsPrayerTimeBox.put(AppStringConstraints.keySunriseAdjustment, value);
      initPrayerTime();
    }
  }

  set dhuhrAdjustment(int value) {
    if (_dhuhrAdjustment != value) {
      _dhuhrAdjustment = value;
      _settingsPrayerTimeBox.put(AppStringConstraints.keyDhuhrAdjustment, value);
      initPrayerTime();
    }
  }

  set asrAdjustment(int value) {
    if (_asrAdjustment != value) {
      _asrAdjustment = value;
      _settingsPrayerTimeBox.put(AppStringConstraints.keyAsrAdjustment, value);
      initPrayerTime();
    }
  }

  set maghribAdjustment(int value) {
    if (_maghribAdjustment != value) {
      _maghribAdjustment = value;
      _settingsPrayerTimeBox.put(AppStringConstraints.keyMaghribAdjustment, value);
      initPrayerTime();
    }
  }

  set ishaAdjustment(int value) {
    if (_ishaAdjustment != value) {
      _ishaAdjustment = value;
      _settingsPrayerTimeBox.put(AppStringConstraints.keyIshaAdjustment, value);
      initPrayerTime();
    }
  }

  void get defaultAdjustments {
    _fajrAdjustment = 0;
    _sunriseAdjustment = 0;
    _dhuhrAdjustment = 0;
    _asrAdjustment = 0;
    _maghribAdjustment = 0;
    _ishaAdjustment = 0;

    _settingsPrayerTimeBox.put(AppStringConstraints.keyFajrAdjustment, _fajrAdjustment);
    _settingsPrayerTimeBox.put(AppStringConstraints.keySunriseAdjustment, _sunriseAdjustment);
    _settingsPrayerTimeBox.put(AppStringConstraints.keyDhuhrAdjustment, _dhuhrAdjustment);
    _settingsPrayerTimeBox.put(AppStringConstraints.keyAsrAdjustment, _asrAdjustment);
    _settingsPrayerTimeBox.put(AppStringConstraints.keyMaghribAdjustment, _maghribAdjustment);
    _settingsPrayerTimeBox.put(AppStringConstraints.keyIshaAdjustment, _ishaAdjustment);

    initPrayerTime();
  }

  bool isPrayerInHourRange({required bool before, required DateTime prayerTime}) {
    final DateTime rangeStart = before ? prayerTime.subtract(hourInterval) : prayerTime;
    final DateTime rangeEnd = before ? prayerTime : prayerTime.add(hourInterval);
    return _dateTime.isAfter(rangeStart) && _dateTime.isBefore(rangeEnd);
  }

  String restPrayerTime({required bool isBefore, required DateTime time}) {
    late final Duration remainingDuration;
    if (isBefore) {
      if (_dateTime.isAfter(time) || _dateTime.isAtSameMomentAs(time)) {
        time = time.add(const Duration(days: 1));
      }
      remainingDuration = time.difference(_dateTime);
    } else {
      remainingDuration = _dateTime.difference(time);
    }
    final hours = remainingDuration.inHours.remainder(24);
    final minutes = remainingDuration.inMinutes.remainder(60);
    return '${hours.abs().toString().padLeft(2, '0')}:${minutes.abs().toString().padLeft(2, '0')}';
  }

  bool isNextPrayer({required Prayer prayer}) => _prayerTimes.nextPrayer() == prayer;

  DateTime thirdTime({required String partName}) {
    late final DateTime timeFor;
    switch (partName) {
      case AppStringConstraints.timeSunrise:
        timeFor = _prayerTimes.sunrise;
        break;
      case AppStringConstraints.timeMiddleNight:
        timeFor = _sunnahTimes.middleOfTheNight;
        break;
      case AppStringConstraints.timeLastThird:
        timeFor = _sunnahTimes.lastThirdOfTheNight;
        break;
    }
    return timeFor;
  }

  bool thirdState({required String partName}) {
    late final bool state;
    switch (partName) {
      case AppStringConstraints.timeSunrise:
        state = isSunrise;
        break;
      case AppStringConstraints.timeMiddleNight:
        state = isMidnight;
        break;
      case AppStringConstraints.timeLastThird:
        state = isLastThird;
        break;
    }
    return state;
  }

  bool isAdhan({required Prayer prayer}) {
    DateTime currentPrayerTime = _prayerTimes.timeForPrayer(prayer)!;
    return _dateTime.isAfter(currentPrayerTime.add(const Duration(minutes: -1))) && _dateTime.isBefore(currentPrayerTime.add(const Duration(minutes: 3)));
  }

  bool isDhikr({required Prayer prayer}) {
    DateTime currentPrayerTime = _prayerTimes.timeForPrayer(prayer)!;
    return _dateTime.isAfter(currentPrayerTime.add(const Duration(minutes: 3))) && _dateTime.isBefore(currentPrayerTime.add(const Duration(minutes: 30)));
  }

  bool get isMorning => _isWithinRange(getFajrValueInMinutes + 30, getSunriseValueInMinutes - 1);

  bool get isSunrise => _isWithinRange(getSunriseValueInMinutes - 1, getDhuhrValueInMinutes - 1);

  bool get isDuha => _isWithinRange(getSunriseValueInMinutes + 45, getDhuhrValueInMinutes - 15);

  bool get isEvening => _isWithinRange(getAsrValueInMinutes + 30, getMaghribValueInMinutes - 1);

  bool get isNight => _isWithinRange(getIshaValueInMinutes + 30, getMidnightValueInMinutes - 1);

  bool get isMidnight => _isWithinRange(getMidnightValueInMinutes - 1, getThirdPartValueInMinutes - 1);

  bool get isLastThird => _isWithinRange(getThirdPartValueInMinutes - 1, getFajrValueInMinutes - 1);

  bool get isFriday {
    bool firstCheck = _dateTime.weekday == 4 && getMinutesOfDay >= getMaghribValueInMinutes;
    bool secondCheck = _dateTime.weekday == 5 && getMinutesOfDay <= getMaghribValueInMinutes;
    return firstCheck || secondCheck;
  }

  int _prayerValueInMinutes({required DateTime time}) {
    DateTime fromMidnight = DateTime(_dateTime.year, _dateTime.month, _dateTime.day);
    if (time.isBefore(fromMidnight)) {
      time = time.add(const Duration(days: 1));
    }

    return time.difference(fromMidnight).inMinutes;
  }

  bool _isWithinRange(int start, int end) {
    final minutes = getMinutesOfDay;
    return minutes > start && minutes < end;
  }

  void _startCron() {
    _cron.schedule(Schedule.parse('*/1 * * * *'), () {
      _updateDateTime();
    });
  }

  void _updateDateTime() {
    _dateTime = tz.TZDateTime.from(DateTime.now(), tz.local);
    notifyListeners();
  }

  @override
  void dispose() {
    _cron.close();
    super.dispose();
  }
}
