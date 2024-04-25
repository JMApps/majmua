import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';

import '../../core/enums/season.dart';

class RestTimeState extends ChangeNotifier {
  DateTime _currentDateTime = DateTime.now();
  Timer? timer;

  final HijriCalendar _currentHijriTime = HijriCalendar.now();

  DateTime get currentDateTime => _currentDateTime;

  HijriCalendar get currentHijriTime => _currentHijriTime;

  bool get isRamadan => _currentHijriTime.hMonth == 9;

  bool get holidaysRamadan =>
      _currentHijriTime.hMonth == 10 &&
      _currentHijriTime.hDay >= 1 &&
      _currentHijriTime.hDay <= 3;

  bool get isNineDays =>
      _currentHijriTime.hMonth == 12 &&
      _currentHijriTime.hDay >= 1 &&
      _currentHijriTime.hDay <= 9;

  bool get holidaysHijjah =>
      _currentHijriTime.hMonth == 12 &&
      _currentHijriTime.hDay >= 10 &&
      _currentHijriTime.hDay <= 12;

  bool get isWhiteDays => _currentHijriTime.hDay >= 12 && _currentHijriTime.hDay <= 15;

  bool get isOpenWhiteDays => !isRamadan && !holidaysRamadan && !isNineDays && !holidaysHijjah;

  RestTimeState() {
    timer = Timer(
      Duration(seconds: (_currentDateTime.second - 60).abs()),
      () {
        _currentDateTime = DateTime.now();
        notifyListeners();
        timer = Timer.periodic(
          const Duration(minutes: 1),
          (_) {
            _currentDateTime = DateTime.now();
            notifyListeners();
          },
        );
      },
    );
  }

  void changeNotifiers() {
    notifyListeners();
  }

  int _toRamadanDays() {
    final int countDays;
    final DateTime hijriRamadanToGregorian = _currentHijriTime.hMonth < 9
        ? _currentHijriTime.hijriToGregorian(_currentHijriTime.hYear, 9, 1)
        : _currentHijriTime.hijriToGregorian(_currentHijriTime.hYear + 1, 9, 1);
    countDays = _currentDateTime.difference(DateTime(hijriRamadanToGregorian.year, hijriRamadanToGregorian.month, hijriRamadanToGregorian.day)).inDays;
    return countDays - 1;
  }

  int get getToRamadanDays => _toRamadanDays();

  int _toHijjahDays() {
    final int countDays;
    final hijriZulHijjahToGregorian = _currentHijriTime.hMonth == 12 && _currentHijriTime.hDay >= 1
        ? _currentHijriTime.hijriToGregorian(_currentHijriTime.hYear + 1, 12, 1)
        : _currentHijriTime.hijriToGregorian(_currentHijriTime.hYear, 12, 1);
    countDays = _currentDateTime.difference(DateTime(hijriZulHijjahToGregorian.year, hijriZulHijjahToGregorian.month, hijriZulHijjahToGregorian.day)).inDays;
    return countDays - 1;
  }

  int get getToHijjahDays => _toHijjahDays();

  double getElapsedDayPercentage() {
    final startOfDay = DateTime(_currentDateTime.year, _currentDateTime.month, _currentDateTime.day);
    final elapsedTime = _currentDateTime.difference(startOfDay).inMinutes;
    final totalMinutesInDay = const Duration(hours: 24).inMinutes;
    final elapsedTimePercentage = (elapsedTime / totalMinutesInDay) * 100.0;
    return elapsedTimePercentage;
  }

  double getElapsedWeekPercentage() {
    final startOfWeek = DateTime(_currentDateTime.year, _currentDateTime.month, _currentDateTime.day - _currentDateTime.weekday + 1);
    final elapsedMinutes = _currentDateTime.difference(startOfWeek).inMinutes;
    final totalMinutesInWeek = const Duration(days: 7).inMinutes;
    final elapsedWeekPercentage = (elapsedMinutes / totalMinutesInWeek) * 100.0;
    return elapsedWeekPercentage;
  }

  double getElapsedMonthPercentage() {
    final startOfMonth = DateTime(_currentDateTime.year, _currentDateTime.month, 1, 0, 0, 0);
    final elapsedMinutes = _currentDateTime.difference(startOfMonth).inMinutes;
    final totalMinutesInMonth = Duration(days: daysInMonth(_currentDateTime.year, _currentDateTime.month)).inMinutes;
    final elapsedMonthPercentage = (elapsedMinutes / totalMinutesInMonth) * 100.0;
    return elapsedMonthPercentage;
  }

  double getElapsedLunarMonthPercentage() {
    HijriCalendar startOfMonth = HijriCalendar.fromDate(_currentDateTime);
    startOfMonth.hDay = 1;
    int elapsedMinutes = _currentDateTime.difference(_currentHijriTime.hijriToGregorian(startOfMonth.hYear, startOfMonth.hMonth, startOfMonth.hDay)).inMinutes;
    HijriCalendar startOfNextMonth = HijriCalendar.fromDate(_currentDateTime);
    startOfNextMonth.hMonth += 1;
    startOfNextMonth.hDay = 1;
    int totalMinutesInMonth = _currentHijriTime.hijriToGregorian(startOfNextMonth.hYear, startOfNextMonth.hMonth, startOfNextMonth.hDay).difference(_currentHijriTime.hijriToGregorian(startOfMonth.hYear, startOfMonth.hMonth, startOfMonth.hDay)).inMinutes;
    double elapsedMonthPercentage = (elapsedMinutes / totalMinutesInMonth) * 100.0;
    return elapsedMonthPercentage;
  }

  double getElapsedYearPercentage() {
    final startOfYear = DateTime(_currentDateTime.year);
    final elapsedMinutes = _currentDateTime.difference(startOfYear).inMinutes;
    final totalMinutesInYear = isLeapYear(_currentDateTime.year) ? 366 * 24 * 60 : 365 * 24 * 60;
    final elapsedYearPercentage = (elapsedMinutes / totalMinutesInYear) * 100.0;
    return elapsedYearPercentage;
  }

  int get getDaysUntilNextSunday {
    int daysUntilNextSunday = DateTime.sunday - _currentDateTime.weekday;
    if (daysUntilNextSunday <= 0) {
      daysUntilNextSunday += 7;
    }
    return daysUntilNextSunday;
  }

  int get getDaysUntilNextWednesday {
    int daysUntilNextWednesday = DateTime.wednesday - _currentDateTime.weekday;
    if (daysUntilNextWednesday <= 0) {
      daysUntilNextWednesday += 7;
    }
    return daysUntilNextWednesday;
  }

  int get getDaysUntilNextThursday {
    int daysUntilNextThursday = DateTime.thursday - _currentDateTime.weekday;
    if (daysUntilNextThursday <= 0) {
      daysUntilNextThursday += 7;
    }
    return daysUntilNextThursday;
  }

  int get getDaysUntilNextFriday {
    int daysUntilNextFriday = DateTime.friday - _currentDateTime.weekday;
    if (daysUntilNextFriday <= 0) {
      daysUntilNextFriday += 7;
    }
    return daysUntilNextFriday;
  }

  Season get getCurrentSeason {
    return _getCurrentSeason(_currentDateTime.month);
  }

  DateTime get getNext12thDay => _calculateNext12thDay(_currentHijriTime);

  DateTime _calculateNext12thDay(HijriCalendar hijriCalendar) {
    int desiredDay = 12;
    int daysUntilNext12thDay = desiredDay - hijriCalendar.hDay;
    if (daysUntilNext12thDay <= 0) {
      hijriCalendar = HijriCalendar.addMonth(hijriCalendar.hYear, hijriCalendar.hMonth + 1);
      daysUntilNext12thDay = desiredDay - hijriCalendar.hDay;
    }
    return hijriCalendar.hijriToGregorian(
      hijriCalendar.hYear,
      hijriCalendar.hMonth,
      desiredDay,
    );
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

  double getElapsedSeasonPercentage(Season currentSeason) {
    final int startSeasonMonth;
    final int endSeasonMonth;

    switch (currentSeason) {
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

    final startOfSeason = DateTime(_getCurrentSeason(_currentDateTime.month) == Season.winter ? _currentDateTime.year - 1 : _currentDateTime.year, startSeasonMonth, 1);
    final elapsedTime = _currentDateTime.difference(startOfSeason).inMinutes;
    final endOfSeason = DateTime(_currentDateTime.year, endSeasonMonth + 1);
    final totalSeasonTime = endOfSeason.difference(startOfSeason).inMinutes;

    final elapsedTimePercentage = (elapsedTime / totalSeasonTime);
    return elapsedTimePercentage;
  }

  int daysInMonth(int year, int month) {
    if (month == 2) {
      return isLeapYear(year) ? 29 : 28;
    } else if (month == 4 || month == 6 || month == 9 || month == 11) {
      return 30;
    } else {
      return 31;
    }
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
}
