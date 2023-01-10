import 'dart:async';

import 'package:flutter/material.dart';

class RestTimeState extends ChangeNotifier {
  DateTime _cdt = DateTime.now().toUtc();
  late Timer _appTimer;

  RestTimeState() {
    _appTimer = Timer(
      Duration(seconds: (_cdt.second - 59).abs()),
      () {
        _cdt = DateTime.now().toUtc();
        notifyListeners();
        _appTimer = Timer.periodic(
          const Duration(minutes: 1),
          (_) {
            _cdt = DateTime.now().toUtc();
            notifyListeners();
          },
        );
      },
    );
  }

  int get getMinutesOfYear => _cdt.difference(DateTime(_cdt.year)).inMinutes;

  int get getMinutesOfMonth => _cdt.difference(DateTime(_cdt.year, _cdt.month)).inMinutes;

  int get getMinutesOfDay => _cdt.difference(DateTime(_cdt.year, _cdt.month, _cdt.day)).inMinutes;

  double get getRestYearMinutes {
    late double restYear;
    if (getMinutesOfYear <= 525600) {
      restYear = getMinutesOfYear * 24 * 60 / 7568640.0;
    } else {
      restYear = getMinutesOfYear * 24 * 60 / 7589376.0;
    }
    return restYear;
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
    late double seasonWeek;
    switch (_cdt.weekday) {
      case 1:
        seasonWeek = getMinutesOfDay * 24 * 60 / 145152;
        break;
      case 2:
        seasonWeek = (1440 + getMinutesOfDay)* 24 * 60 / 145152;
        break;
      case 3:
        seasonWeek = (2880 + getMinutesOfDay)* 24 * 60 / 145152;
        break;
      case 4:
        seasonWeek = (4320 + getMinutesOfDay) * 24 * 60 / 145152;
        break;
      case 5:
        seasonWeek = (5760 + getMinutesOfDay) * 24 * 60 / 145152;
        break;
      case 6:
        seasonWeek = (7200 + getMinutesOfDay)* 24 * 60 / 145152;
        break;
      case 7:
        seasonWeek = (8640 + getMinutesOfDay) * 24 * 60 / 145152;
        break;
    }
    return seasonWeek;
  }

  double get getRestDayProgress {
    return getMinutesOfDay * 24 * 60 / 20736;
  }

  int _getDaysInMonth(int year, int month) {
    if (month == DateTime.february) {
      final bool isLeapYear = (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
      return isLeapYear ? 29 : 28;
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
