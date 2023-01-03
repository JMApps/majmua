import 'package:hijri/hijri_calendar.dart';

class RestTimes {
  static final RestTimes _instance = RestTimes.internal();

  factory RestTimes() => _instance;

  RestTimes.internal();

  final DateTime dateTime = DateTime.now();
  final HijriCalendar dateTimeHijri = HijriCalendar.now();

  String get getHijriDate {
    return '${dateTimeHijri.hDay}/${dateTimeHijri.hMonth}/${dateTimeHijri.hYear}';
  }

  String get getGregorianDate {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  int get getMinutesOfYear => dateTime.difference(DateTime(dateTime.year).toUtc()).inMinutes;

  int get getMinutesOfMonth => dateTime.difference(DateTime(dateTime.year, dateTime.month).toUtc()).inMinutes;

  int get getMinutesOfDay => dateTime.difference(DateTime(dateTime.year, dateTime.month, dateTime.day).toUtc()).inMinutes;

  double get getRestYearProgress {
    return getMinutesOfYear <= 7568640.0 ? getMinutesOfYear * 24 * 60 / 7568640.0 :  getMinutesOfYear * 24 * 60 / 7588937.6;
  }

  int _getDaysInMonth(int year, int month) {
    if (month == DateTime.february) {
      final bool isLeapYear = (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
      return isLeapYear ? 29 : 28;
    }
    const List<int> daysInMonth = <int>[31, -1, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    return daysInMonth[month - 1];
  }

  double get getRestMonthProgress {
    double seasonMonth = 0;
    switch (_getDaysInMonth(dateTime.year, dateTime.month)) {
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
    switch (dateTime.weekday) {
      case 1:
        seasonWeek = getMinutesOfDay* 24 * 60 / 145152;
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

  final List<String> _monthHijriNames = [
    'Мухаррам',
    'Сафар',
    'Раби\' аль-Авваль',
    'Раби\' ас-Сани',
    'Джумада аль-Уля',
    'Джумада ас-Сани',
    'Раджаб',
    'Ша\'бан',
    'Рамадан',
    'Шавваль',
    'Зу-ль-Ка\'да',
    'Зу-ль-Хиджа'
  ];

  String get getMonthHijriName => _monthHijriNames[dateTimeHijri.hMonth - 1];

  final List<String> _monthNames = [
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентабрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь'
  ];

  String get getMonthName => _monthNames[dateTime.month - 1];

  final List<String> _namesWeekDay = [
    'Понедельник',
    'Вторник',
    'Среда',
    'Четверг',
    'Пятница',
    'Суббота',
    'Воскресенье',
  ];

  String get getNameWeekDay => _namesWeekDay[dateTime.weekday - 1];

  final List<String> _messagesForSaum = [
    'День желательного поста',
    'Почитай Коран и поразмышляй над ним',
    'Завтра день желательного поста',
    'День желательного поста',
    'ﷺ',
    'Почитай Коран и поразмышляй над ним',
    'Завтра день желательного поста',
  ];

  String get getMessageForSaum => _messagesForSaum[dateTime.weekday - 1];

  int _toRamadanDays() {
    final int countDays;
    final hijriRamadanToGregorian = dateTimeHijri.hijriToGregorian(dateTimeHijri.hYear, 9, 1);
    countDays = dateTime.difference(DateTime(hijriRamadanToGregorian.year, hijriRamadanToGregorian.month, hijriRamadanToGregorian.day)).inDays;
    return countDays;
  }

  int get getToRamadanDays => _toRamadanDays();

  int _toQurbanDays() {
    final int countDays;
    final hijriZulHidjaToGregorian = dateTimeHijri.hijriToGregorian(dateTimeHijri.hYear, 12, 10);
    countDays = dateTime.difference(DateTime(hijriZulHidjaToGregorian.year, hijriZulHidjaToGregorian.month, hijriZulHidjaToGregorian.day)).inDays;
    return countDays;
  }

  int get getToQurbanDays => _toQurbanDays();
}
