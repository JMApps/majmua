import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';

import '../../core/enums/season.dart';
import '../../core/enums/time_period.dart';
import '../../core/strings/app_string_constraints.dart';

class TimeState extends ChangeNotifier with WidgetsBindingObserver {
  DateTime _dateTime = DateTime.now();
  HijriCalendar _hijriCalendar = HijriCalendar.now();
  final Cron _cron = Cron();
  final Duration _minusMicro = const Duration(microseconds: -1);

  DateTime get getDateTime => _dateTime;

  HijriCalendar get getHijriDateTime => _hijriCalendar;

  TimeState() {
    WidgetsBinding.instance.addObserver(this);
    _dateTime = DateTime.now();
    _hijriCalendar = HijriCalendar.now();
    _startCron();
  }

  bool isRamadan() {
    return _hijriCalendar.hMonth == 9;
  }

  bool isDhulhijjah() {
    return _hijriCalendar.hMonth == 12 && _hijriCalendar.hDay <= 9;
  }

  bool isRamadanHoliday() {
    return _hijriCalendar.hMonth == 10 && _hijriCalendar.hDay == 1;
  }

  bool isDhulhijjahHoliday() {
    return _hijriCalendar.hMonth == 12 && _hijriCalendar.hDay >= 10 && _hijriCalendar.hDay <= 12;
  }

  bool isNearWhiteDays() {
    return (isFasting()) && (_hijriCalendar.hDay == 12);
  }

  bool isWhiteDays() {
    return (isFasting()) && (_hijriCalendar.hDay >= 13 && _hijriCalendar.hDay <= 15);
  }

  bool isNearThirdSixth() {
    return (isFasting()) && (_dateTime.weekday == 3 || _dateTime.weekday == 7);
  }

  bool isFirstFourth() {
    return (isFasting()) && (_dateTime.weekday == 1 || _dateTime.weekday == 4);
  }

  bool isFasting() {
    return !isRamadan() && !isDhulhijjah() && !isRamadanHoliday() && !isDhulhijjahHoliday();
  }

  DateTime get twelfthyDay {
    if (_hijriCalendar.isBefore(_hijriCalendar.hYear, _hijriCalendar.hMonth, 12)) {
      return _hijriCalendar.hijriToGregorian(_hijriCalendar.hYear, _hijriCalendar.hMonth, 12);
    } else {
      return _hijriCalendar.hijriToGregorian(_hijriCalendar.hYear, _hijriCalendar.hMonth + 1, 12);
    }
  }

  Map<String, dynamic> getDaysToHijriDate({required int hijriMonth, required int hijriDay, required String daysKey, required String dateKey}) {
    final DateTime targetDate;

    if (_hijriCalendar.isBefore(_hijriCalendar.hYear, hijriMonth, hijriDay)) {
      targetDate = _hijriCalendar.hijriToGregorian(
        _hijriCalendar.hYear,
        hijriMonth,
        hijriDay,
      );
    } else {
      targetDate = _hijriCalendar.hijriToGregorian(
        _hijriCalendar.hYear + 1,
        hijriMonth,
        hijriDay,
      );
    }

    final Duration difference = targetDate.difference(_dateTime);
    final int daysRemaining = difference.inDays + 1;

    return {
      daysKey: daysRemaining,
      dateKey: targetDate,
    };
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
    final Duration remainingTime = endDateTime.difference(_dateTime);
    final double elapsedPercentage = (remainingTimeInMinutes / totalMinutes) * 100.0;

    return {
      AppStringConstraints.startPeriod: startPeriod,
      AppStringConstraints.endPeriod: endDateTime.add(_minusMicro),
      AppStringConstraints.remainingDateTime: remainingTime,
      AppStringConstraints.elapsedPercentage: elapsedPercentage,
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
    if (month == 2) return isLeapYear(year) ? 29 : 28;
    return [31, -1, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month - 1];
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

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _updateDateTime();
      notifyListeners();
    }
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
    _dateTime = DateTime.now();
    _hijriCalendar = HijriCalendar.now();
    notifyListeners();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _cron.close();
    super.dispose();
  }
}
