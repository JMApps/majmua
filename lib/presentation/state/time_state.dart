import 'package:flutter/material.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/timezone.dart';

class TimeState extends ChangeNotifier {
  late TZDateTime _dateTime;

  TimeState() {
    tz.initializeTimeZones();
    _dateTime = tz.TZDateTime.from(DateTime.now(), tz.local);
  }

  bool isWeekDay({required int dayNumber}) {
    _dateTime = tz.TZDateTime.from(DateTime.now(), tz.local);
    return _dateTime.weekday == dayNumber;
  }

  bool isFriday() {
    return _dateTime.weekday == 5;
  }
}