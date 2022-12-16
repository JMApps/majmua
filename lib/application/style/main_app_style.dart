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

  static int getToRamadanDays() {
    final int countDays;
    final hijriRamadanToGregorian = dateTimeHijri.hijriToGregorian(dateTimeHijri.hYear, 9, 1);
    countDays = dateTime.difference(DateTime(hijriRamadanToGregorian.year, hijriRamadanToGregorian.month, hijriRamadanToGregorian.day)).inDays;
    return countDays;
  }

  static int getToQurbanDays() {
    final int countDays;
    final hijriZulHidjaToGregorian = dateTimeHijri.hijriToGregorian(dateTimeHijri.hYear, 12, 10);
    countDays = dateTime.difference(DateTime(hijriZulHidjaToGregorian.year, hijriZulHidjaToGregorian.month, hijriZulHidjaToGregorian.day)).inDays;
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

  static String get getMonthHijriNames => _monthHijriNames[dateTimeHijri.hMonth - 1];

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

  static final List<String> _messagesForDays = [
    'Понедельник',
    'Вторник',
    'Среда',
    'Четверг',
    'Пятница',
    'Суббота',
    'Воскресенье',
  ];

  static String get getMessagesForDays => _messagesForDays[dateTime.weekday - 1];

  static final List<String> _messagesForSaum = [
    'День желательного поста',
    'Почитай суру Власть',
    'Завтра день желательного поста',
    'День желательного поста',
    'ﷺ',
    'Почитай суру Пещера',
    'Завтра день желательного поста',
  ];

  static String get getMessagesForSaum => _messagesForSaum[dateTime.weekday - 1];

  static const mainCardBorderRadius = RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)));
  static const mainBorderRadius = BorderRadius.all(Radius.circular(20));

  static const mainTextSizeStyle = TextStyle(fontSize: 18);

  static const mainPadding = EdgeInsets.all(16);
  static const mainPaddingMini = EdgeInsets.all(8);
  static const mainMargin = EdgeInsets.all(16);
  static const mainMarginMini = EdgeInsets.all(8);
}
