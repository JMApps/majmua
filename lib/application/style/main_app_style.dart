import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';

class MainAppStyle {
  static final DateTime dateTime = DateTime.now();
  static final HijriCalendar dateTimeHijri = HijriCalendar.now();

  static int toRamadan() {
    int countDays = 0;
    final hijriRamadanToGregorian = dateTimeHijri.hijriToGregorian(dateTimeHijri.hYear, 9, 1);
    countDays = dateTime.difference(DateTime(hijriRamadanToGregorian.year, hijriRamadanToGregorian.month, hijriRamadanToGregorian.day)).inDays;
    return countDays;
  }

  static final List<String> _messagesForDays = [
    'Сегодня понедельник, день желательного поста',
    '',
    'Завтра четверг, день желательного поста',
    'Сегодня четверг, день желательного поста.\n\nЗавтра пятница',
    'Сегодня пятница',
    '',
    'Завтра понедельник, день желательного поста',
  ];

  static String get getMessagesForDays => _messagesForDays[dateTime.weekday - 1];

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

  static String getHijriDate() {
    return '${dateTimeHijri.hDay}.${dateTimeHijri.hMonth}.${dateTimeHijri.hYear}';
  }

  static String getGregorianDate() {
    return '${dateTime.day}.${dateTime.month}.${dateTime.year}';
  }

  static const mainBorderRadius = BorderRadius.all(Radius.circular(20));

  static const mainPadding = EdgeInsets.all(16);
  static const mainPaddingMini = EdgeInsets.all(8);
  static const mainMargin = EdgeInsets.all(16);
  static const mainMarginMini = EdgeInsets.all(8);
}
