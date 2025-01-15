import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/timezone.dart';

import '../../core/enums/season.dart';
import '../../core/enums/time_period.dart';
import '../../core/strings/app_string_constraints.dart';

class TimeState extends ChangeNotifier {
  late TZDateTime _dateTime;
  late HijriCalendar _hijriCalendar;
  final Cron _cron = Cron();
  final Duration _minusMicro = const Duration(microseconds: -1);

  TZDateTime get getDateTime => _dateTime;

  HijriCalendar get getHijriDateTime => _hijriCalendar;

  TimeState() {
    tz.initializeTimeZones();
    _dateTime = tz.TZDateTime.from(DateTime.now(), tz.local);
    _hijriCalendar = HijriCalendar.now();
    _startCron();
  }

  bool isWeekDay({required int dayNumber}) {
    return _dateTime.weekday == dayNumber;
  }

  bool isWhiteDays() {
    return _hijriCalendar.hDay >= 13 && _hijriCalendar.hDay <= 15;
  }

  Map<String, dynamic> getDaysToRamadan() {
    final DateTime ramadanDate;
    if (_hijriCalendar.isBefore(_hijriCalendar.hYear, 9, 1)) {
      ramadanDate = _hijriCalendar.hijriToGregorian(_hijriCalendar.hYear, 9, 1);
    } else {
      ramadanDate = _hijriCalendar.hijriToGregorian(_hijriCalendar.hYear + 1, 9, 1);
    }

    final Duration difference = ramadanDate.difference(_dateTime);
    final int daysToRamadan = difference.inDays;

    final DateTime startOfYear = DateTime(_dateTime.year);
    final DateTime endOfYear = DateTime(_dateTime.year + 1);
    final int totalDaysInYear = endOfYear.difference(startOfYear).inDays;

    final double percentage = 1.0 - (daysToRamadan / totalDaysInYear);

    return {
      AppStringConstraints.mapDaysToRamadan: daysToRamadan,
      AppStringConstraints.mapRamadanDate: ramadanDate,
      AppStringConstraints.mapPercentageToRamadan: percentage.clamp(0.0, 1.0),
    };
  }
  
  bool get isRamadanHoliday {
    return _hijriCalendar.hMonth == 10 && _hijriCalendar.hDay == 1;
  }

  Map<String, dynamic> getDaysToDhulHijjah() {
    final DateTime dhulHijjahDate;
    if (_hijriCalendar.isBefore(_hijriCalendar.hYear, 12, 1)) {
      dhulHijjahDate = _hijriCalendar.hijriToGregorian(_hijriCalendar.hYear, 12, 1);
    } else {
      dhulHijjahDate = _hijriCalendar.hijriToGregorian(_hijriCalendar.hYear + 1, 12, 1);
    }

    final Duration difference = dhulHijjahDate.difference(_dateTime);
    final int daysToDhulHijjah = difference.inDays;

    final DateTime startOfYear = DateTime(_dateTime.year);
    final DateTime endOfYear = DateTime(_dateTime.year + 1);
    final int totalDaysInYear = endOfYear.difference(startOfYear).inDays;

    final double percentage = 1.0 - (daysToDhulHijjah / totalDaysInYear);

    return {
      AppStringConstraints.mapDaysToDhulHijjah: daysToDhulHijjah,
      AppStringConstraints.mapDhulHijjahDate: dhulHijjahDate,
      AppStringConstraints.mapPercentageToDhulHijjah: percentage.clamp(0.0, 1.0),
    };
  }

  bool get isDhulHijjahHoliday {
    return _hijriCalendar.hMonth == 12 && _hijriCalendar.hDay >= 10 && _hijriCalendar.hDay <= 13;
  }

  Map<String, dynamic> restPeriodTimes({required TimePeriod timePeriod}) {
    final Map<String, dynamic> timePeriodData;

    switch (timePeriod) {
      case TimePeriod.day:
        timePeriodData = _calculatePeriodData(
            startPeriod: DateTime(_dateTime.year, _dateTime.month, _dateTime.day),
            duration: const Duration(days: 1),
        );
        break;
      case TimePeriod.week:
        final startOfWeek = DateTime(_dateTime.year, _dateTime.month, _dateTime.day - _dateTime.weekday + 1);
        timePeriodData = _calculatePeriodData(
            startPeriod: startOfWeek,
            duration: const Duration(days: 7)
        );
        break;
      case TimePeriod.month:
        final startOfMonth = DateTime(_dateTime.year, _dateTime.month);
        timePeriodData = _calculatePeriodData(
            startPeriod: startOfMonth,
            duration: Duration(days: daysInMonth(_dateTime.year, _dateTime.month)),
        );
        break;
      case TimePeriod.season:
        final Map<String, dynamic> seasonData = _getSeasonPeriodData(_dateTime);
        timePeriodData = _calculatePeriodData(
            startPeriod: seasonData[AppStringConstraints.startSeason],
            endPeriod: seasonData[AppStringConstraints.endSeason],
        );
        break;
      case TimePeriod.year:
        final startOfYear = DateTime(_dateTime.year);
        timePeriodData = _calculatePeriodData(
            startPeriod: startOfYear,
            duration: Duration(days: isLeapYear(_dateTime.year) ? 366 : 365),
        );
        break;
    }

    return timePeriodData;
  }

  Map<String, dynamic> _calculatePeriodData({
    required DateTime startPeriod,
    Duration? duration,
    DateTime? endPeriod,
  }) {
    final DateTime endDateTime = duration != null ? startPeriod.add(duration) : endPeriod!;
    final int totalMinutes = endDateTime.difference(startPeriod).inMinutes;
    final int remainingTimeInMinutes = _dateTime.difference(startPeriod).inMinutes;
    final Duration remainingTaskTime = endDateTime.difference(_dateTime);
    final double elapsedTaskPercentage = (remainingTimeInMinutes / totalMinutes) * 100.0;

    return {
      AppStringConstraints.startPeriod: startPeriod,
      AppStringConstraints.endPeriod: endDateTime.add(_minusMicro),
      AppStringConstraints.remainingDateTime: remainingTaskTime,
      AppStringConstraints.elapsedPercentage: elapsedTaskPercentage,
    };
  }

  Map<String, dynamic> _getSeasonPeriodData(DateTime currentDateTime) {
    final int startSeasonMonth;
    final int endSeasonMonth;
    final int currentYear = currentDateTime.year;
    final int previousYear = currentYear - 1;

    switch (_getCurrentSeason(currentDateTime.month)) {
      case Season.spring:
        startSeasonMonth = 3;
        endSeasonMonth = 5;
        break;
      case Season.summer:
        startSeasonMonth = 6;
        endSeasonMonth = 8;
        break;
      case Season.fall:
        startSeasonMonth = 9;
        endSeasonMonth = 11;
        break;
      case Season.winter:
        startSeasonMonth = 12;
        endSeasonMonth = 2;
        break;
    }

    final DateTime startSeason = DateTime(_getCurrentSeason(currentDateTime.month) == Season.winter ? previousYear : currentYear, startSeasonMonth, 1);
    final DateTime endSeason = DateTime(_getCurrentSeason(currentDateTime.month) == Season.winter ? currentYear : currentYear, endSeasonMonth + 1, 1);

    return {
      AppStringConstraints.startSeason: startSeason,
      AppStringConstraints.endSeason: endSeason,
    };
  }

  int daysInMonth(int year, int month) {
    const daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    if (month == 2 && isLeapYear(year)) {
      return 29;
    }
    return daysInMonth[month - 1];
  }

  bool isLeapYear(int year) {
    if (year % 4 != 0) {
      return false;
    } else if (year % 100 != 0) {
      return true;
    } else if (year % 400 != 0) {
      return false;
    }
    return true;
  }

  Season getCurrentSeason() {
    return _getCurrentSeason(_dateTime.month);
  }

  Season _getCurrentSeason(int month) {
    late Season currentSeason;
    switch (month) {
      case 3:
      case 4:
      case 5:
        currentSeason = Season.spring;
        break;
      case 6:
      case 7:
      case 8:
        currentSeason = Season.summer;
        break;
      case 9:
      case 10:
      case 11:
        currentSeason = Season.fall;
        break;
      case 12:
      case 1:
      case 2:
        currentSeason = Season.winter;
        break;
    }
    return currentSeason;
  }

  void _startCron() {
    _cron.schedule(Schedule.parse('*/1 * * * *'), () {
      _updateDateTime();
    });
  }

  void _updateDateTime() {
    _dateTime = tz.TZDateTime.from(DateTime.now(), tz.local);
    _hijriCalendar = HijriCalendar.now();
    notifyListeners();
  }

  @override
  void dispose() {
    _cron.close();
    super.dispose();
  }
}
