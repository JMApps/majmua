import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/timezone.dart';

class AppNotificationService {
  static final AppNotificationService _localNoticeService =
  AppNotificationService._internal();

  factory AppNotificationService() {
    return _localNoticeService;
  }

  AppNotificationService._internal();

  static const fastMondayNotificationID = 625;
  static const fastThursdayNotificationID = 745;
  static const fastWhiteDaysNotificationID = 371;

  static const fajrNotificationID = 395;
  static const sunriseNotificationID = 476;
  static const dhuhrNotificationID = 543;
  static const asrNotificationID = 876;
  static const maghribNotificationID = 563;
  static const ishaNotificationID = 854;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static const AndroidNotificationDetails androidFastNotificationDetails =
  AndroidNotificationDetails(
    'Daily fast notification channel ID',
    'Notifications',
    channelDescription: 'Daily fast notifications',
    importance: Importance.max,
    priority: Priority.max,
  );

  static const DarwinNotificationDetails iOSFastNotificationDetails =
  DarwinNotificationDetails();

  static const AndroidNotificationDetails androidPrayerNotificationDetails =
  AndroidNotificationDetails(
    'Daily prayer notification channel ID',
    'Notifications',
    channelDescription: 'Daily prayer notifications',
    importance: Importance.max,
    priority: Priority.max,
  );

  static const DarwinNotificationDetails iOSPrayerNotificationDetails =
  DarwinNotificationDetails();

  Future<void> setupNotification() async {
    if (Platform.isAndroid) {
      _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestPermission();
    }

    const AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings('@drawable/sm_logo');

    const DarwinInitializationSettings iOSInitializationSettings = DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: androidInitializationSettings,
      iOS: iOSInitializationSettings,
    );

    tz.initializeTimeZones();
    _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // Future<void> morningZonedScheduleNotification(DateTime date, String title, String body, int id) async {
  //   var tzDateNotification = tz.TZDateTime.from(date, tz.local);
  //   await _flutterLocalNotificationsPlugin.zonedSchedule(
  //     id,
  //     title,
  //     body,
  //     tzDateNotification,
  //     const NotificationDetails(
  //       android: androidMorningNotificationDetails,
  //       iOS: iOSMorningNotificationDetails,
  //     ),
  //     androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
  //     uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
  //     matchDateTimeComponents: DateTimeComponents.time,
  //   );
  // }

  Future<void> zonedScheduleNotification(int hour, int minute, String title, String body, int id) async {
    TZDateTime tzDateNotification = tz.TZDateTime.from(DateTime(2023, 12, 31, hour, minute), tz.local);
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tzDateNotification,
      const NotificationDetails(
        android: androidPrayerNotificationDetails,
        iOS: iOSPrayerNotificationDetails,
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> cancelNotificationWithId(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }
}
