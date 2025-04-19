import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/timezone.dart';

class NotificationService {
  static final NotificationService _localNoticeService = NotificationService._internal();

  factory NotificationService() {
    return _localNoticeService;
  }

  NotificationService._internal();

  static const String _logoName = 'ic_app_notification';

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final AndroidNotificationDetails _prayerAndroidDetails = const AndroidNotificationDetails(
    'Prayer notifications',
    'SM notifications',
    channelDescription: 'Shelf of the muslim prayer notifications',
    icon: _logoName,
    importance: Importance.max,
    priority: Priority.max,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('adhan'),
  );

  final AndroidNotificationDetails _androidTimeNotificationDetails = const AndroidNotificationDetails(
    'Shelf muslim daily notifications',
    'Shelf muslim notifications',
    channelDescription: 'Shelf of the muslim daily notifications',
    icon: _logoName,
    importance: Importance.max,
    priority: Priority.max,
  );

  final DarwinNotificationDetails _prayerIOSDetails = const DarwinNotificationDetails(
    presentSound: true,
    sound: 'adhan.caf',
  );

  final DarwinNotificationDetails _iOSTimeNotificationDetails = const DarwinNotificationDetails();

  Future<void> setupNotification() async {
    tz.initializeTimeZones();

    if (Platform.isAndroid) {
      _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
    }

    AndroidInitializationSettings androidInitializationSettings = const AndroidInitializationSettings(_logoName);
    DarwinInitializationSettings iOSInitializationSettings = const DarwinInitializationSettings(requestSoundPermission: true);

    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iOSInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  Future<void> prayerNotification({required int id, required String title, required String body, required DateTime dateTime}) async {
    TZDateTime tzDateNotification = tz.TZDateTime.from(dateTime, tz.local);
    try {
      await _flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tzDateNotification,
        NotificationDetails(
          android: _prayerAndroidDetails,
          iOS: _prayerIOSDetails,
        ),
        androidScheduleMode: AndroidScheduleMode.alarmClock,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    } on PlatformException catch (e) {
      debugPrint("Error scheduling notification: $e");
    } catch (e) {
      debugPrint("Unknown error: $e");
    }
  }

  Future<void> dailyNotification({required int id, required String title, required String body, required DateTime dateTime}) async {
    TZDateTime tzDateNotification = tz.TZDateTime.from(dateTime, tz.local);
    try {
      await _flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tzDateNotification,
        NotificationDetails(
          android: _androidTimeNotificationDetails,
          iOS: _iOSTimeNotificationDetails,
        ),
        androidScheduleMode: AndroidScheduleMode.alarmClock,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    } on PlatformException catch (e) {
      debugPrint("Error scheduling notification: $e");
    } catch (e) {
      debugPrint("Unknown error: $e");
    }
  }

  Future<void> weeklyNotification({required int id, required String title, required String body, required DateTime dateTime}) async {
    TZDateTime tzDateNotification = tz.TZDateTime.from(dateTime, tz.local);
    try {
      await _flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tzDateNotification,
        NotificationDetails(
          android: _androidTimeNotificationDetails,
          iOS: _iOSTimeNotificationDetails,
        ),
        androidScheduleMode: AndroidScheduleMode.alarmClock,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      );
    } on PlatformException catch (e) {
      debugPrint("Error scheduling notification: $e");
    } catch (e) {
      debugPrint("Unknown error: $e");
    }
  }

  Future<void> monthlyNotification({required int id, required String title, required String body, required DateTime dateTime}) async {
    TZDateTime tzDateNotification = tz.TZDateTime.from(dateTime, tz.local);
    try {
      await _flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tzDateNotification,
        NotificationDetails(
          android: _androidTimeNotificationDetails,
          iOS: _iOSTimeNotificationDetails,
        ),
        androidScheduleMode: AndroidScheduleMode.alarmClock,
        matchDateTimeComponents: DateTimeComponents.dayOfMonthAndTime,
      );
    } on PlatformException catch (e) {
      debugPrint("Error scheduling notification: $e");
    } catch (e) {
      debugPrint("Unknown error: $e");
    }
  }

  Future<void> cancelNotificationWithId(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }
}