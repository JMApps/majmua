import 'package:hijri/hijri_calendar.dart';

class RestTimes {
  final DateTime _dateTime = DateTime.now();
  final HijriCalendar _dateTimeHijri = HijriCalendar.now();

  String get getHijriDate {
    return '${_dateTimeHijri.hDay}/${_dateTimeHijri.hMonth}/${_dateTimeHijri.hYear}';
  }

  String get getGregorianDate {
    return '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}';
  }

  int get getHourOfYear =>
      _dateTime.difference(DateTime(_dateTime.year)).inHours;

  int get getHourOfMonth =>
      _dateTime.difference(DateTime(_dateTime.year, _dateTime.month)).inHours;

  int get getHourOfDay => _dateTime.difference(DateTime(_dateTime.year, _dateTime.month, _dateTime.day)).inHours;

  int get getMinuteOfDay => _dateTime.difference(DateTime(_dateTime.year, _dateTime.month, _dateTime.day)).inMinutes;

  double get getRestYearProgress {
    return getHourOfYear * 24 * 60 / 126144.0;
  }

  double get getRestMonthProgress {
    int monthDays = DateTime(_dateTime.year, _dateTime.month, 0).day;
    double seasonMonth = 0;
    switch (monthDays) {
      case 28:
        seasonMonth = getHourOfMonth * 24 * 60 / 9676.8;
        break;
      case 30:
        seasonMonth = getHourOfMonth * 24 * 60 / 10368;
        break;
      case 31:
        seasonMonth = getHourOfMonth * 24 * 60 / 10713.6;
        break;
    }
    return seasonMonth;
  }

  double get getRestWeekProgress {
    late double seasonWeek;
    switch (_dateTime.weekday) {
      case 1:
        seasonWeek = getHourOfDay * 24 * 60 / 2419.2;
        break;
      case 2:
        seasonWeek = (24 + getHourOfDay) * 24 * 60 / 2419.2;
        break;
      case 3:
        seasonWeek = (48 + getHourOfDay) * 24 * 60 / 2419.2;
        break;
      case 4:
        seasonWeek = (72 + getHourOfDay) * 24 * 60 / 2419.2;
        break;
      case 5:
        seasonWeek = (96 + getHourOfDay) * 24 * 60 / 2419.2;
        break;
      case 6:
        seasonWeek = (120 + getHourOfDay) * 24 * 60 / 2419.2;
        break;
      case 7:
        seasonWeek = (144 + getHourOfDay) * 24 * 60 / 2419.2;
        break;
    }
    return seasonWeek;
  }

  double get getRestDayProgress {
    return getMinuteOfDay * 24 * 60 / 20736;
  }
}
