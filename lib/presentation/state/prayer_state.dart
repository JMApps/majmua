import 'package:adhan/adhan.dart';
import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/timezone.dart';

import '../../core/strings/app_string_constraints.dart';

class PrayerState extends ChangeNotifier {
  late TZDateTime _dateTime;
  final Cron _cron = Cron();
  static const Duration hourInterval = Duration(hours: 1);

  late final PrayerTimes _prayerTimes;
  late final CalculationParameters _prayerParams;
  late final Coordinates _coordinates;
  late final SunnahTimes _sunnahTimes;
  late final Qibla _qibla;

  PrayerState() {
    tz.initializeTimeZones();
    _dateTime = tz.TZDateTime.now(tz.local);
    _startCron();
    _initPrayerTime();
  }

  void _initPrayerTime() {
    _coordinates = Coordinates(36.2076, 36.5192);
    _prayerParams = CalculationMethod.muslim_world_league.getParameters()
      ..highLatitudeRule = HighLatitudeRule.middle_of_the_night
      ..madhab = Madhab.shafi;

    _prayerTimes = PrayerTimes.today(_coordinates, _prayerParams);
    _sunnahTimes = SunnahTimes(_prayerTimes);
    _qibla = Qibla(_coordinates);
    notifyListeners();
  }

  PrayerTimes get prayerTimes => _prayerTimes;
  SunnahTimes get sunnahTimes => _sunnahTimes;
  Qibla get qiblahDirection => _qibla;

  int get getMinutesOfDay => _dateTime.difference(DateTime(_dateTime.year, _dateTime.month, _dateTime.day)).inMinutes;
  int get getFajrValueInMinutes => _prayerValueInMinutes(time: _prayerTimes.fajr);
  int get getSunriseValueInMinutes => _prayerValueInMinutes(time: _prayerTimes.sunrise);
  int get getDhuhrValueInMinutes => _prayerValueInMinutes(time: _prayerTimes.dhuhr);
  int get getAsrValueInMinutes => _prayerValueInMinutes(time: _prayerTimes.asr);
  int get getMaghribValueInMinutes => _prayerValueInMinutes(time: _prayerTimes.maghrib);
  int get getIshaValueInMinutes => _prayerValueInMinutes(time: _prayerTimes.isha);
  int get getMidnightValueInMinutes => _prayerValueInMinutes(time: _sunnahTimes.middleOfTheNight);
  int get getThirdPartValueInMinutes => _prayerValueInMinutes(time: _sunnahTimes.lastThirdOfTheNight);

  double beforeAfterHourPercent({required DateTime prayerTime}) {
    final bool isBefore = isPrayerInHourRange(before: true, prayerTime: prayerTime);
    final DateTime referenceTime = isBefore ? prayerTime.subtract(hourInterval) : prayerTime;
    final int remainingTimeInMinutes = _dateTime.difference(referenceTime).inMinutes;
    final double elapsedPercentage = (remainingTimeInMinutes / hourInterval.inMinutes).clamp(0.0, 1.0);
    return isBefore ? (1.0 - elapsedPercentage) : elapsedPercentage;
  }

  bool isPrayerInHourRange({required bool before, required DateTime prayerTime}) {
    final DateTime rangeStart = before ? prayerTime.subtract(hourInterval) : prayerTime;
    final DateTime rangeEnd = before ? prayerTime : prayerTime.add(hourInterval);
    return _dateTime.isAfter(rangeStart) && _dateTime.isBefore(rangeEnd);
  }

  String restPrayerTime({required bool isBefore, required DateTime time}) {
    late final Duration remainingDuration;
    if (isBefore) {
      if (_dateTime.isAfter(time)) {
        time = time.add(const Duration(days: 1));
      }
      remainingDuration = time.difference(_dateTime);
    } else {
      remainingDuration = _dateTime.difference(time);
    }
    final hours = remainingDuration.inHours.abs();
    final minutes = remainingDuration.inMinutes.remainder(60).abs();
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
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

  int partTimeValues({required String partName}) {
    late final int values;
    switch (partName) {
      case AppStringConstraints.timeSunrise:
        values = getDhuhrValueInMinutes;
        break;
      case AppStringConstraints.timeMiddleNight:
        values = getFajrValueInMinutes;
        break;
      case AppStringConstraints.timeLastThird:
        values = getFajrValueInMinutes;
        break;
    }
    return values;
  }

  double getProgressForPart({required String partName}) {
    final DateTime completeTime = thirdTime(partName: partName);
    final int remainingTimeInMinutes;
    if (_dateTime.isBefore(completeTime)) {
      remainingTimeInMinutes = completeTime.difference(_dateTime).inMinutes;
    } else {
      remainingTimeInMinutes = completeTime.add(const Duration(days: 1)).difference(_dateTime).inMinutes;
    }
    if (remainingTimeInMinutes <= partTimeValues(partName: partName)) {
      return 1.0;
    }
    final double elapsedPercentage = (1.0 - remainingTimeInMinutes / const Duration(days: 1).inMinutes).clamp(0.0, 1.0);
    return elapsedPercentage;
  }

  bool isAdhan({required Prayer prayer}) {
    DateTime currentPrayerTime = _prayerTimes.timeForPrayer(prayer)!;
    return _dateTime.isAfter(currentPrayerTime.add(const Duration(minutes: -1))) && _dateTime.isBefore(currentPrayerTime.add(const Duration(minutes: 3)));
  }

  bool isDhikr({required Prayer prayer}) {
    DateTime currentPrayerTime = _prayerTimes.timeForPrayer(prayer)!;
    return _dateTime.isAfter(currentPrayerTime.add(const Duration(minutes: 3))) && _dateTime.isBefore(currentPrayerTime.add(const Duration(minutes: 45)));
  }

  bool get isMorning => _isWithinRange(getFajrValueInMinutes + 45, getSunriseValueInMinutes - 1);

  bool get isDuha => _isWithinRange(getSunriseValueInMinutes + 45, getDhuhrValueInMinutes - 15);

  bool get isEvening => _isWithinRange(getAsrValueInMinutes + 45, getMaghribValueInMinutes - 1);

  bool get isNight => _isWithinRange(getIshaValueInMinutes + 45, getMidnightValueInMinutes - 1);

  bool get isFriday {
    bool firstCheck = _dateTime.weekday == 4 && getMinutesOfDay >= getMaghribValueInMinutes;
    bool secondCheck = _dateTime.weekday == 5 && getMinutesOfDay <= getMaghribValueInMinutes;
    return firstCheck || secondCheck;
  }

  int _prayerValueInMinutes({required DateTime time}) {
    final DateTime fromMidnight = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, 0, 0);
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
    _dateTime = tz.TZDateTime.now(tz.local);
    notifyListeners();
  }

  @override
  void dispose() {
    _cron.close();
    super.dispose();
  }
}