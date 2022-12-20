import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';

class MainAppStyle {
  static final DateTime dateTime = DateTime.now();
  static final HijriCalendar dateTimeHijri = HijriCalendar.now();

  static String getHijriDate() {
    return '${dateTimeHijri.hDay}/${dateTimeHijri.hMonth}/${dateTimeHijri.hYear}';
  }

  static String getGregorianDate() {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  static int getHourOfYear =
      dateTime.difference(DateTime(dateTime.year)).inHours;

  static int getHourOfMonth =
      dateTime.difference(DateTime(dateTime.year, dateTime.month)).inHours;

  static int getHourOfDay = dateTime
      .difference(DateTime(dateTime.year, dateTime.month, dateTime.day))
      .inHours;

  static int getMinuteOfDay = dateTime
      .difference(DateTime(dateTime.year, dateTime.month, dateTime.day))
      .inMinutes;

  static double restYearProgress() {
    return getHourOfYear * 24 * 60 / 126144.0;
  }

  static double restMonthProgress() {
    int monthDays = DateTime(dateTime.year, dateTime.month, 0).day;
    late double seasonMonth;
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

  static double restWeekProgress() {
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

  static double restDayProgress() {
    return getMinuteOfDay * 24 * 60 / 20736;
  }

  static int getToRamadanDays() {
    final int countDays;
    final hijriRamadanToGregorian =
        dateTimeHijri.hijriToGregorian(dateTimeHijri.hYear, 9, 1);
    countDays = dateTime
        .difference(DateTime(hijriRamadanToGregorian.year,
            hijriRamadanToGregorian.month, hijriRamadanToGregorian.day))
        .inDays;
    return countDays;
  }

  static int getToQurbanDays() {
    final int countDays;
    final hijriZulHidjaToGregorian =
        dateTimeHijri.hijriToGregorian(dateTimeHijri.hYear, 12, 10);
    countDays = dateTime
        .difference(DateTime(hijriZulHidjaToGregorian.year,
            hijriZulHidjaToGregorian.month, hijriZulHidjaToGregorian.day))
        .inDays;
    return countDays;
  }

  static final List<String> _monthHijriNames = [
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

  static String get getMonthHijriNames =>
      _monthHijriNames[dateTimeHijri.hMonth - 1];

  static final List<String> _monthNames = [
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

  static String get getMonthNames => _monthNames[dateTime.month - 1];

  static final List<String> _namesWeekDay = [
    'Понедельник',
    'Вторник',
    'Среда',
    'Четверг',
    'Пятница',
    'Суббота',
    'Воскресенье',
  ];

  static String get getNamesWeekDay => _namesWeekDay[dateTime.weekday - 1];

  static final List<String> _messagesForSaum = [
    'День желательного поста',
    'Почитай Коран и поразмышляй над ним',
    'Завтра день желательного поста',
    'День желательного поста',
    'ﷺ',
    'Почитай Коран и поразмышляй над ним',
    'Завтра день желательного поста',
  ];

  static String get getMessagesForSaum =>
      _messagesForSaum[dateTime.weekday - 1];

  static const mainCardBorderRadius = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  );

  static const mainBorderRadius = BorderRadius.all(
    Radius.circular(20),
  );

  static const mainTextSizeStyle = TextStyle(fontSize: 18);

  static const mainPadding = EdgeInsets.all(16);
  static const mainPaddingMini = EdgeInsets.all(8);
  static const mainMargin = EdgeInsets.all(16);
  static const mainMarginMini = EdgeInsets.all(8);

  static const appBarShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomRight: Radius.elliptical(35, 20),
      bottomLeft: Radius.elliptical(35, 20),
    ),
  );
}
