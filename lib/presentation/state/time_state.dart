import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/timezone.dart';

class TimeState extends ChangeNotifier {
  late TZDateTime _dateTime;
  late HijriCalendar _hijriCalendar;
  final Cron _cron = Cron();

  TZDateTime get getDateTime => _dateTime;

  HijriCalendar get getHijriDateTime => _hijriCalendar;

  TimeState() {
    tz.initializeTimeZones();
    _dateTime = tz.TZDateTime.from(DateTime.now(), tz.local);
    _hijriCalendar = HijriCalendar.now();
    _startCron();
  }

  bool isWeekDay({required int dayNumber}) {
    return _dateTime.weekday == dayNumber;
  }

  bool isFriday() {
    return _dateTime.weekday == 5;
  }

  void _startCron() {
    _cron.schedule(Schedule.parse('0 0 * * *'), () {
      _updateDateTime();
    });
  }

  void _updateDateTime() {
    _dateTime = tz.TZDateTime.from(DateTime.now(), tz.local);
    _hijriCalendar = HijriCalendar.now();
    notifyListeners();
  }

  @override
  void dispose() {
    _cron.close();
    super.dispose();
  }
}