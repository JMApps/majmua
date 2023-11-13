import 'package:flutter/material.dart';
import 'package:majmua/core/enums/season.dart';

class RestTimeState extends ChangeNotifier {
  final DateTime _currentDateTime = DateTime.now();

  double getElapsedTimePercentage() {
    final startOfDay = DateTime(_currentDateTime.year, _currentDateTime.month, _currentDateTime.day, 0, 0, 0);
    final elapsedTime = _currentDateTime.difference(startOfDay);
    final totalMinutesInDay = const Duration(hours: 24).inMinutes;
    final elapsedTimePercentage =
        (elapsedTime.inMinutes / totalMinutesInDay) * 100.0;
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
    final DateTime currentDateTime = DateTime.now();
    final DateTime startOfSeason;
    switch (targetSeason) {
      case Season.spring:
        startOfSeason = DateTime(currentDateTime.year, 3, 1, 0, 0, 0);
        break;
      case Season.summer:
        startOfSeason = DateTime(currentDateTime.year, 6, 1, 0, 0, 0);
        break;
      case Season.fall:
        startOfSeason = DateTime(currentDateTime.year, 9, 1, 0, 0, 0);
        break;
      case Season.winter:
        startOfSeason = DateTime(currentDateTime.year, 12, 1, 0, 0, 0);
        break;
    }

    final elapsedMinutes = currentDateTime.difference(startOfSeason).inMinutes;
    final totalMinutesInSeason = isLeapYear(currentDateTime.year) ? 366 * 24 * 60 : 365 * 24 * 60;

    final elapsedSeasonPercentage = 1.0 - (elapsedMinutes / totalMinutesInSeason);
    return elapsedSeasonPercentage;
  }

  String formatPercentage(double percentage) {
    return (percentage * 100).toStringAsFixed(2);
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
