import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:majmua/application/strings/app_strings.dart';
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

  static const morningSupplicationsNotificationID = 579;
  static const eveningSupplicationsNotificationID = 311;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationDetails androidPrayerNotificationDetails = AndroidNotificationDetails(
    'Daily prayer notification channel ID',
    'Notifications',
    channelDescription: 'Daily prayer notifications',
    importance: Importance.high,
    priority: Priority.max,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('adhan'),
  );

  static const DarwinNotificationDetails iOSPrayerNotificationDetails = DarwinNotificationDetails(
    presentSound: true,
    sound: 'adhan.caf',
  );

  static const AndroidNotificationDetails androidAdhkarNotificationDetails = AndroidNotificationDetails(
    'Daily adhkar notification channel ID',
    'Notifications',
    channelDescription: 'Daily adhkar notifications',
    importance: Importance.max,
    priority: Priority.max,
  );

  static const DarwinNotificationDetails iOSAdhkarNotificationDetails = DarwinNotificationDetails();

  static const AndroidNotificationDetails androidFastNotificationDetails = AndroidNotificationDetails(
    'Weekly fast notification channel ID',
    'Notifications',
    channelDescription: 'Weekly fast notifications',
    importance: Importance.max,
    priority: Priority.max,
  );

  static const DarwinNotificationDetails iOSFastNotificationDetails = DarwinNotificationDetails();

  Future<void> setupNotification() async {
    if (Platform.isAndroid) {
      _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestPermission();
    }

    const AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings('@drawable/sm_logo');

    const DarwinInitializationSettings iOSInitializationSettings = DarwinInitializationSettings(requestSoundPermission: true);

    const InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iOSInitializationSettings,
    );

    tz.initializeTimeZones();

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  Future<void> dailyPrayerNotifications({required int hour, required int minute, required String title, required String body, required int id}) async {
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
      matchDateTimeComponents: DateTimeComponents.time,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> dailyAdhkarNotifications({required int hour, required int minute, required String body, required int id}) async {
    TZDateTime tzDateNotification = tz.TZDateTime.from(DateTime(2023, 12, 31, hour, minute), tz.local);
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      AppString.reminder,
      body,
      tzDateNotification,
      const NotificationDetails(
        android: androidAdhkarNotificationDetails,
        iOS: iOSAdhkarNotificationDetails,
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> forWeeklyFast({required int id, required DateTime nextWeekFastDay}) async {
    TZDateTime tzDateNotification = tz.TZDateTime.from(nextWeekFastDay, tz.local);
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      AppString.reminder,
      AppString.fastTomorrow,
      tzDateNotification,
      const NotificationDetails(
        android: androidFastNotificationDetails,
        iOS: iOSFastNotificationDetails,
      ),
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );
  }

  Future<void> cancelNotificationWithId(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }
}
