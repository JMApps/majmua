import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:majmua/application/other/enums/season.dart';
import 'package:majmua/application/strings/app_strings.dart';

class RestTimeState extends ChangeNotifier {
  DateTime _cdt = DateTime.now();
  HijriCalendar _chdt = HijriCalendar.now();
  late Timer _appTimer;
  late bool _isLeapYear;

  RestTimeState() {
    _appTimer = Timer(
      Duration(seconds: (_cdt.second - 60).abs()),
      () {
        _cdt = DateTime.now();
        _chdt = HijriCalendar.now();
        notifyListeners();
        _appTimer = Timer.periodic(
          const Duration(minutes: 1),
          (_) {
            _cdt = DateTime.now();
            _chdt = HijriCalendar.now();
            notifyListeners();
          },
        );
      },
    );
    _isLeapYear = (_cdt.year % 4 == 0) && (_cdt.year % 100 != 0) || (_cdt.year % 400 == 0);
  }

  DateTime get getCdt => _cdt;

  HijriCalendar get getChdt => _chdt;

  int get getMinutesOfYear => _cdt.difference(DateTime(_cdt.year)).inMinutes;

  int get getMinutesOfMonth => _cdt.difference(DateTime(_cdt.year, _cdt.month)).inMinutes;

  int get getMinutesOfDay => _cdt.difference(DateTime(_cdt.year, _cdt.month, _cdt.day)).inMinutes;

  double get getRestYearProgress {
    late double restYear;
    if (!_isLeapYear) {
      restYear = getMinutesOfYear * 24 * 60 / 7568640.0;
    } else {
      restYear = getMinutesOfYear * 24 * 60 / 7589376.0;
    }
    return restYear;
  }

  double get getRestSeasonProgress {
    double firstSeasonSum = _isLeapYear ? 1886976.0 : 1866240.0;
    double secondThirdSeasonSum = 1907712.0;
    double fourthSeasonSum = 1886976.0;
    late double season;
    switch (_cdt.month) {
      case 12:
        season = getMinutesOfMonth * 24 * 60 / firstSeasonSum;
        break;
      case 1:
        season = (44640 + getMinutesOfMonth) * 24 * 60 / firstSeasonSum;
        break;
      case 2:
        season = (44640 + 44640 + getMinutesOfMonth) * 24 * 60 / firstSeasonSum;
        break;
      case 3:
        season = getMinutesOfMonth * 24 * 60 / secondThirdSeasonSum;
        break;
      case 4:
        season = (44640 + getMinutesOfMonth) * 24 * 60 / secondThirdSeasonSum;
        break;
      case 5:
        season = (44640 + 43200 + getMinutesOfMonth) * 24 * 60 / secondThirdSeasonSum;
        break;
      case 6:
        season = getMinutesOfMonth * 24 * 60 / secondThirdSeasonSum;
        break;
      case 7:
        season = (43200 + getMinutesOfMonth) * 24 * 60 / secondThirdSeasonSum;
        break;
      case 8:
        season = (43200 + 44640 + getMinutesOfMonth) * 24 * 60 / secondThirdSeasonSum;
        break;
      case 9:
        season = getMinutesOfMonth * 24 * 60 / fourthSeasonSum;
        break;
      case 10:
        season = (43200 + getMinutesOfMonth) * 24 * 60 / fourthSeasonSum;
        break;
      case 11:
        season = (43200 + 44640 + getMinutesOfMonth) * 24 * 60 / fourthSeasonSum;
        break;
    }
    return season;
  }

  double get getRestMonthProgress {
    late double seasonMonth;
    switch (_getDaysInMonth(_cdt.year, _cdt.month)) {
      case 28:
        seasonMonth = getMinutesOfMonth * 24 * 60 / 580608;
        break;
      case 29:
        seasonMonth = getMinutesOfMonth * 24 * 60 / 601344;
        break;
      case 30:
        seasonMonth = getMinutesOfMonth * 24 * 60 / 622080;
        break;
      case 31:
        seasonMonth = getMinutesOfMonth * 24 * 60 / 642816;
        break;
    }
    return seasonMonth;
  }

  double get getRestWeekProgress {
    double weekSum = 145152;
    late double seasonWeek;
    switch (_cdt.weekday) {
      case 1:
        seasonWeek = getMinutesOfDay * 24 * 60 / weekSum;
        break;
      case 2:
        seasonWeek = (1440 + getMinutesOfDay) * 24 * 60 / weekSum;
        break;
      case 3:
        seasonWeek = (2880 + getMinutesOfDay) * 24 * 60 / weekSum;
        break;
      case 4:
        seasonWeek = (4320 + getMinutesOfDay) * 24 * 60 / weekSum;
        break;
      case 5:
        seasonWeek = (5760 + getMinutesOfDay) * 24 * 60 / weekSum;
        break;
      case 6:
        seasonWeek = (7200 + getMinutesOfDay) * 24 * 60 / weekSum;
        break;
      case 7:
        seasonWeek = (8640 + getMinutesOfDay) * 24 * 60 / weekSum;
        break;
    }
    return seasonWeek;
  }

  double get getRestDayProgress {
    return getMinutesOfDay * 24 * 60 / 20736;
  }

  Season get getCurrentSeason {
    return _getCurrentSeason(_cdt.month);
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

  String get getMonthHijriName => AppString.monthHijriNames[_chdt.hMonth - 1];

  String get getMonthName => AppString.monthNames[_cdt.month - 1];

  String get getMonthPictureNames => AppString.monthPictureNames[_cdt.month - 1];

  String get getNameWeekDay => AppString.namesWeekDay[_cdt.weekday - 1];

  String get getShortNameWeekDay => AppString.shortNamesWeekDay[_cdt.weekday - 1];

  String get getDailyShortMessage => AppString.dailyShortMessages[_cdt.weekday - 1];

  String get getDailyMessage => AppString.dailyMessages[_cdt.weekday - 1];

  int _toRamadanDays() {
    final int countDays;
    final hijriRamadanToGregorian = _chdt.hijriToGregorian(_chdt.hYear, 9, 1);
    countDays = _cdt.difference(DateTime(hijriRamadanToGregorian.year, hijriRamadanToGregorian.month, hijriRamadanToGregorian.day)).inDays;
    return countDays;
  }

  int get getToRamadanDays => _toRamadanDays();

  int _toQurbanDays() {
    final int countDays;
    final hijriZulHidjaToGregorian = _chdt.hijriToGregorian(_chdt.hYear, 12, 10);
    countDays = _cdt.difference(DateTime(hijriZulHidjaToGregorian.year, hijriZulHidjaToGregorian.month, hijriZulHidjaToGregorian.day)).inDays;
    return countDays;
  }

  int get getToQurbanDays => _toQurbanDays();

  int _getDaysInMonth(int year, int month) {
    if (month == DateTime.february) {
      return _isLeapYear ? 29 : 28;
    }
    const List<int> daysInMonth = <int>[31, -1, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    return daysInMonth[month - 1];
  }

  @override
  void dispose() {
    _appTimer.cancel();
    super.dispose();
  }
}
