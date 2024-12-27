import 'package:adhan/adhan.dart';
import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../core/strings/app_string_constraints.dart';

class PrayerState extends ChangeNotifier {
  late tz.TZDateTime _dateTime;
  final Cron _cron = Cron();
  static const Duration hourInterval = Duration(hours: 1);

  late final PrayerTimes _prayerTimes;
  late final CalculationParameters _prayerParams;
  late final Coordinates _coordinates;
  late final SunnahTimes _sunnahTimes;
  late final Qibla _qibla;

  PrayerState() {
    tz.initializeTimeZones();
    _dateTime = tz.TZDateTime.from(DateTime.now(), tz.local);
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
  int get getLastThirdPartValueInMinutes => _prayerValueInMinutes(time: _sunnahTimes.lastThirdOfTheNight);

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
    DateTime targetTime = time;
    if (targetTime.isBefore(_dateTime)) {
      targetTime = targetTime.add(const Duration(days: 1));
    }
    final remainingDuration = isBefore ? targetTime.difference(_dateTime) : _dateTime.difference(targetTime);
    final hours = remainingDuration.inHours.abs();
    final minutes = remainingDuration.inMinutes.remainder(60).abs();
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
  }

  bool isNextPrayer({required Prayer prayer}) {
    final Prayer nextPrayer = _prayerTimes.nextPrayer();
    return prayer == nextPrayer;
  }

  DateTime thirdTime({required String partName}) {
    switch (partName) {
      case AppStringConstraints.timeSunrise:
        return _prayerTimes.sunrise;
      case AppStringConstraints.timeMiddleNight:
        return _sunnahTimes.middleOfTheNight;
      case AppStringConstraints.timeLastThird:
        return _sunnahTimes.lastThirdOfTheNight;
      default:
        throw ArgumentError('Invalid partName: $partName');
    }
  }

  double getProgressForPart(String partName) {
    final DateTime partTime = thirdTime(partName: partName);
    final DateTime now = tz.TZDateTime.now(tz.local);
    final DateTime nextPartTime = partTime.isBefore(now) ? partTime.add(const Duration(days: 1)) : partTime;

    if (partName == AppStringConstraints.timeSunrise) {
      final DateTime dhuhrMinus15 = DateTime(now.year, now.month, now.day, 0, 0).add(Duration(minutes: getDhuhrValueInMinutes - 15));
      if (now.isAfter(partTime) && now.isBefore(dhuhrMinus15)) {
        return 1.0;
      }
    }
    if (partName == AppStringConstraints.timeMiddleNight) {
      final DateTime lastThirdTime = DateTime(now.year, now.month, now.day, 0, 0).add(Duration(minutes: getLastThirdPartValueInMinutes));
      if (now.isAfter(partTime) && now.isBefore(lastThirdTime)) {
        return 1.0;
      }
    }
    if (partName == AppStringConstraints.timeLastThird) {
      final DateTime fajrTime = DateTime(now.year, now.month, now.day, 0, 0).add(Duration(minutes: getFajrValueInMinutes));
      if (now.isAfter(partTime) && now.isBefore(fajrTime)) {
        return 1.0;
      }
    }

    final Duration totalDuration = nextPartTime.difference(DateTime(now.year, now.month, now.day));
    final Duration elapsedDuration = now.difference(DateTime(now.year, now.month, now.day));
    return elapsedDuration.inSeconds / totalDuration.inSeconds;
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