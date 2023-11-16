import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:majmua/core/enums/season.dart';

class RestTimeState extends ChangeNotifier {
  final DateTime _currentDateTime = DateTime.now();

  final HijriCalendar _currentHijriTime = HijriCalendar.now();

  DateTime get currentDateTime => _currentDateTime;

  HijriCalendar get currentHijriTime => _currentHijriTime;

  bool get isRamadan => _currentHijriTime.hMonth == 9;

  bool get holidaysRamadan => _currentHijriTime.hMonth == 10 && _currentHijriTime.hDay >= 1 && _currentHijriTime.hDay <= 3;

  bool get isNineDays => _currentHijriTime.hMonth == 12 && _currentHijriTime.hDay >= 1 && _currentHijriTime.hDay <= 9;

  bool get holidaysHijjah => _currentHijriTime.hMonth == 12 && _currentHijriTime.hDay >= 10 && _currentHijriTime.hDay <= 13;

  bool get isWhiteDays => _currentHijriTime.hDay >= 12 && _currentHijriTime.hDay <= 15;

  int _toRamadanDays() {
    final int countDays;
    final DateTime hijriRamadanToGregorian = _currentHijriTime.hMonth < 9  ? _currentHijriTime.hijriToGregorian(_currentHijriTime.hYear, 9, 1) : _currentHijriTime.hijriToGregorian(_currentHijriTime.hYear + 1, 9, 1);
    countDays = _currentDateTime.difference(DateTime(hijriRamadanToGregorian.year, hijriRamadanToGregorian.month, hijriRamadanToGregorian.day)).inDays;
    return countDays - 1;
  }

  int get getToRamadanDays => _toRamadanDays();

  int _toHijjahDays() {
    final int countDays;
    final hijriZulHijjahToGregorian = _currentHijriTime.hMonth == 12 && _currentHijriTime.hDay >= 1 ? _currentHijriTime.hijriToGregorian(_currentHijriTime.hYear + 1, 12, 10) : _currentHijriTime.hijriToGregorian(_currentHijriTime.hYear, 12, 10);
    countDays = _currentDateTime.difference(DateTime(hijriZulHijjahToGregorian.year, hijriZulHijjahToGregorian.month, hijriZulHijjahToGregorian.day)).inDays;
    return countDays - 1;
  }

  int get getToHijjahDays => _toHijjahDays();

  double getElapsedDayPercentage() {
    final startOfDay = DateTime(_currentDateTime.year, _currentDateTime.month, _currentDateTime.day, 0, 0, 0);
    final elapsedTime = _currentDateTime.difference(startOfDay);
    final totalMinutesInDay = const Duration(hours: 24).inMinutes;
    final elapsedTimePercentage = (elapsedTime.inMinutes / totalMinutesInDay) * 100.0;
    return elapsedTimePercentage;
  }

  double getElapsedWeekPercentage() {
    final startOfWeek = DateTime(_currentDateTime.year, _currentDateTime.month, _currentDateTime.day - _currentDateTime.weekday + 1, 0, 0, 0);
    final elapsedMinutes = _currentDateTime.difference(startOfWeek).inMinutes;
    final totalMinutesInWeek = const Duration(days: 7).inMinutes;
    final elapsedWeekPercentage = (elapsedMinutes / totalMinutesInWeek) * 100.0;
    return elapsedWeekPercentage;
  }

  double getElapsedMonthPercentage() {
    final startOfMonth = DateTime(_currentDateTime.year, _currentDateTime.month, 1, 0, 0, 0);
    final elapsedMinutes = _currentDateTime.difference(startOfMonth).inMinutes;
    final totalMinutesInMonth = DateTime(_currentDateTime.year, _currentDateTime.month + 1, 0).day * 24 * 60;
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
    final startOfYear = DateTime(_currentDateTime.year, 1, 1, 0, 0, 0);
    final elapsedMinutes = _currentDateTime.difference(startOfYear).inMinutes;
    final totalMinutesInYear = isLeapYear(_currentDateTime.year) ? 366 * 24 * 60 : 365 * 24 * 60;

    final elapsedYearPercentage = (elapsedMinutes / totalMinutesInYear) * 100.0;
    return elapsedYearPercentage;
  }

  Season get getCurrentSeason {
    return _getCurrentSeason(_currentDateTime.month);
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

  double getElapsedSeasonPercentage(Season targetSeason) {
    int startMonth;
    int endMonth;

    switch(targetSeason) {
      case Season.spring:
        startMonth = 3;
        endMonth = 5;
        break;
      case Season.summer:
        startMonth = 6;
        endMonth = 8;
        break;
      case Season.fall:
        startMonth = 9;
        endMonth = 11;
        break;
      case Season.winter:
        startMonth = 12;
        endMonth = 2;
        break;
    }

    DateTime startOfSeason = DateTime(_currentDateTime.year, startMonth, 1);
    DateTime endOfSeason = DateTime(_currentDateTime.year, endMonth, daysInMonth(_currentDateTime.year, endMonth));

    final elapsed = _currentDateTime.difference(startOfSeason).inMilliseconds;
    final total = endOfSeason.difference(startOfSeason).inMilliseconds;

    return (elapsed / total);
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