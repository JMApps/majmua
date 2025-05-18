import 'package:adhan/adhan.dart';
import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/timezone.dart';

import '../../core/strings/app_string_constraints.dart';

class PrayerState extends ChangeNotifier with WidgetsBindingObserver {
  late final Box _settingsPrayerTimeBox;
  TZDateTime _dateTime = tz.TZDateTime.from(DateTime.now(), tz.local);
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
    WidgetsBinding.instance.addObserver(this);
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
    _startCron();
    initPrayerTime();
  }

  void initPrayerTime() {
    _coordinates = Coordinates(_latitude, _longitude);

    _prayerParams = AppStringConstraints.prayerCalculationMethods[_calculationMethodIndex].getParameters()
      ..highLatitudeRule = AppStringConstraints.highLatitude[_highLatitudeMethodIndex]
      ..madhab = AppStringConstraints.calculationMadhab[_madhabIndex];

    final offset = dst ? 60 : 0;

    _prayerParams.adjustments.fajr = _fajrAdjustment - offset;
    _prayerParams.adjustments.sunrise = _sunriseAdjustment - offset;
    _prayerParams.adjustments.dhuhr = _dhuhrAdjustment - offset;
    _prayerParams.adjustments.asr = _asrAdjustment - offset;
    _prayerParams.adjustments.maghrib = _maghribAdjustment - offset;
    _prayerParams.adjustments.isha = _ishaAdjustment - offset;

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

  set changeCountry(String country) {
    _country = country;
    _settingsPrayerTimeBox.put(AppStringConstraints.keyCountry, country);
  }

  String get city => _city;

  set changeCity(String city) {
    _city = city;
    _settingsPrayerTimeBox.put(AppStringConstraints.keyCity, city);
  }

  double get latitude => _latitude;

  set changeLatitude(double latitude) {
    _latitude = latitude;
    _settingsPrayerTimeBox.put(AppStringConstraints.keyCurrentLatitude, latitude);
  }

  double get longitude => _longitude;

  set changeLongitude(double longitude) {
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

  String fromFajrToMaghribFormatted({required List<String> timeVariations}) {
    final duration = _prayerTimes.maghrib.difference(_prayerTimes.fajr);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final hoursText = _pluralize(hours, timeVariations[0], timeVariations[1], timeVariations[2]);
    final String minutesText = _pluralize(minutes, timeVariations[3], timeVariations[4], timeVariations[5]);
    return '$hoursText $minutesText';
  }

  bool isNextPrayer({required Prayer prayer}) => _prayerTimes.nextPrayer() == prayer;

  bool isAdhan({required Prayer prayer}) {
    return _dateTime.isAfter(_timeAdhanAdhkar(prayer).subtract(const Duration(minutes: 2))) &&
        _dateTime.isBefore(_timeAdhanAdhkar(prayer).add(const Duration(minutes: 3)));
  }

  bool isDhikr({required Prayer prayer}) {
    return _dateTime.isAfter(_timeAdhanAdhkar(prayer).add(const Duration(minutes: 3))) &&
        _dateTime.isBefore(_timeAdhanAdhkar(prayer).add(const Duration(minutes: 30)));
  }

  DateTime _timeAdhanAdhkar(Prayer prayer) {
    final DateTime currentPrayerTime;
    if (prayer == Prayer.none) {
      currentPrayerTime= _prayerTimes.timeForPrayer(Prayer.fajr)!;
    } else if (prayer == Prayer.sunrise) {
      currentPrayerTime= _prayerTimes.timeForPrayer(Prayer.dhuhr)!;
    } else {
      currentPrayerTime= _prayerTimes.timeForPrayer(prayer)!;
    }
    return currentPrayerTime;
  }

  bool get isMorning => _isWithinRange(_prayerTimes.fajr.add(const Duration(minutes: 30)), _prayerTimes.sunrise);

  bool get isSunrise => _isWithinRange(_prayerTimes.sunrise, _prayerTimes.dhuhr);

  bool get isDuha => _isWithinRange(_prayerTimes.sunrise.add(const Duration(minutes: 45)), _prayerTimes.dhuhr.subtract(const Duration(minutes: 15)));

  bool get isEvening => _isWithinRange(_prayerTimes.asr.add(const Duration(minutes: 30)), _prayerTimes.maghrib);

  bool get isNight => _isWithinRange(_prayerTimes.isha.add(const Duration(minutes: 30)), _sunnahTimes.middleOfTheNight);

  bool get isMidnight => _isWithinRange(_sunnahTimes.middleOfTheNight, _sunnahTimes.lastThirdOfTheNight);

  bool get isLastThird => _isWithinRange(_sunnahTimes.lastThirdOfTheNight, _prayerTimes.fajr);

  bool get isNightTime => _isWithinRange(_prayerTimes.maghrib, _prayerTimes.fajr.add(Duration(days: 1)));

  bool get isLastFridayHour => _dateTime.weekday == 5 && _isWithinRange(_prayerTimes.maghrib.subtract(const Duration(hours: 1)), _prayerTimes.maghrib);

  bool get isFriday {
    bool firstCheck = _dateTime.weekday == 4 && _dateTime.isAfter(_prayerTimes.maghrib);
    bool secondCheck = _dateTime.weekday == 5 && _dateTime.isBefore(_prayerTimes.maghrib);
    return firstCheck || secondCheck;
  }

  DateTime get lastFridayHour {
    return _getWeeklyNotificationTime(DateTime.friday, const Duration(hours: -1));
  }

  DateTime get weeklyThursday {
    return _getWeeklyNotificationTime(DateTime.thursday, const Duration(hours: 1));
  }

  DateTime get weeklyWednesday {
    return _getWeeklyNotificationTime(DateTime.wednesday, const Duration(hours: 1));
  }

  DateTime get weeklySunday {
    return _getWeeklyNotificationTime(DateTime.sunday, const Duration(hours: 1));
  }

  DateTime _getWeeklyNotificationTime(int targetWeekday, Duration timeOffset) {
    DateTime nextTargetDay = _dateTime.add(Duration(days: (targetWeekday - _dateTime.weekday + 7) % 7));

    DateTime maghribTime = _prayerTimes.maghrib;

    DateTime targetDayMaghribTime = DateTime(
      nextTargetDay.year,
      nextTargetDay.month,
      nextTargetDay.day,
      maghribTime.hour,
      maghribTime.minute,
    );

    return targetDayMaghribTime.add(timeOffset);
  }

  bool _isWithinRange(DateTime start, DateTime end) {
    return _dateTime.isAfter(start) && _dateTime.isBefore(end);
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

  String _pluralize(int number, String one, String few, String many) {
    int n = number % 100;
    if (n >= 11 && n <= 14) return '$number $many';
    switch (n % 10) {
      case 1:
        return '$number $one';
      case 2:
      case 3:
      case 4:
        return '$number $few';
      default:
        return '$number $many';
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _updateDateTime();
      notifyListeners();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _cron.close();
    super.dispose();
  }
}
