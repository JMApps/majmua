import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';

class MainAppStyle {
  static final DateTime dateTime = DateTime.now();
  static final HijriCalendar dateTimeHijri = HijriCalendar.now();

  static const mainBorderRadius = BorderRadius.all(Radius.circular(20));

  static const mainPadding = EdgeInsets.all(16);
  static const mainPaddingMini = EdgeInsets.all(8);
  static const mainMargin = EdgeInsets.all(16);
  static const mainMarginMini = EdgeInsets.all(8);
}
