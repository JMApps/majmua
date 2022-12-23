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

  int get getHourOfYear => dateTime.difference(DateTime(dateTime.year)).inHours;

  int get getHourOfMonth => dateTime.difference(DateTime(dateTime.year, dateTime.month)).inHours;

  int get getHourOfDay => dateTime.difference(DateTime(dateTime.year, dateTime.month, dateTime.day)).inHours;

  int get getMinuteOfDay => dateTime.difference(DateTime(dateTime.year, dateTime.month, dateTime.day)).inMinutes;

  double get getRestYearProgress {
    return getHourOfYear * 24 * 60 / 126144.0;
  }

  double get getRestMonthProgress {
    int monthDays = DateTime(dateTime.year, dateTime.month, 0).day;
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
    switch (dateTime.weekday) {
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
    final hijriZulHidjaToGregorian =
    dateTimeHijri.hijriToGregorian(dateTimeHijri.hYear, 12, 10);
    countDays = dateTime.difference(DateTime(hijriZulHidjaToGregorian.year, hijriZulHidjaToGregorian.month, hijriZulHidjaToGregorian.day)).inDays;
    return countDays;
  }

  int get getToQurbanDays => _toQurbanDays();
}
