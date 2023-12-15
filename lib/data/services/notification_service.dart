import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/timezone.dart';

class NotificationService {
  static const int fajrNotificationID = 395;
  static const int sunriseNotificationID = 476;
  static const int dhuhrNotificationID = 543;
  static const int asrNotificationID = 876;
  static const int maghribNotificationID = 563;
  static const int ishaNotificationID = 854;

  static const int morningSupplicationsNotificationID = 579;
  static const int eveningSupplicationsNotificationID = 311;
  static const int nightSupplicationsNotificationID = 800;

  static const int fastMondayNotificationID = 625;
  static const int fastThursdayNotificationID = 745;
  static const int fastWhiteDaysNotificationID = 371;

  static const int fridayNotificationID = 985;
  static const int lastHourFridayNotificationID = 234;

  static const String _logoName = '@drawable/sm_logo';

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final DateTime _dateTime = DateTime.now();

  final AndroidNotificationDetails _androidPrayerNotificationDetails = const AndroidNotificationDetails(
    'Daily prayer notification channel ID',
    'Prayer notifications',
    channelDescription: 'Daily prayer notifications',
    icon: _logoName,
    importance: Importance.high,
    priority: Priority.max,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('adhan'),
  );

  final DarwinNotificationDetails _iOSPrayerNotificationDetails = const DarwinNotificationDetails(
    presentSound: true,
    sound: 'adhan.caf',
  );

  final AndroidNotificationDetails _androidAdhkarNotificationDetails = const AndroidNotificationDetails(
    'Daily adhkar notification channel ID',
    'Adhkar notifications',
    channelDescription: 'Daily adhkar notifications',
    icon: _logoName,
    importance: Importance.max,
    priority: Priority.max,
  );

  final DarwinNotificationDetails _iOSAdhkarNotificationDetails = const DarwinNotificationDetails();

  final AndroidNotificationDetails _androidFastNotificationDetails = const AndroidNotificationDetails(
    'Day notification channel ID',
    'Day notifications',
    channelDescription: 'Day notifications',
    icon: _logoName,
    importance: Importance.max,
    priority: Priority.max,
  );

  final DarwinNotificationDetails _iOSFastNotificationDetails = const DarwinNotificationDetails();

  Future<void> setupNotification() async {
    if (Platform.isAndroid) {
      _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
    }

    AndroidInitializationSettings androidInitializationSettings = const AndroidInitializationSettings(_logoName);
    DarwinInitializationSettings iOSInitializationSettings = const DarwinInitializationSettings(requestSoundPermission: true);

    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iOSInitializationSettings,
    );

    tz.initializeTimeZones();

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  Future<void> dailyPrayerNotifications({required int hour, required int minute, required int id, required String title, required String body}) async {
    TZDateTime tzDateNotification = tz.TZDateTime.from(DateTime(_dateTime.year, _dateTime.month, _dateTime.day, hour, minute), tz.local);
    try {
      await _flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tzDateNotification,
        NotificationDetails(
          android: _androidPrayerNotificationDetails,
          iOS: _iOSPrayerNotificationDetails,
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      );
    } on PlatformException catch (e) {
      debugPrint("Error scheduling notification: $e");
    } catch (e) {
      debugPrint("Unknown error: $e");
    }
  }

  Future<void> dailyAdhkarNotifications({required int hour, required int minute, required int id, required String title, required String body}) async {
    TZDateTime tzDateNotification = tz.TZDateTime.from(DateTime(_dateTime.year, _dateTime.month, _dateTime.day, hour, minute), tz.local);
    try {
      await _flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tzDateNotification,
        NotificationDetails(
          android: _androidAdhkarNotificationDetails,
          iOS: _iOSAdhkarNotificationDetails,
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      );
    } on PlatformException catch (e) {
      debugPrint("Error scheduling notification: $e");
    } catch (e) {
      debugPrint("Unknown error: $e");
    }
  }

  Future<void> dayNotifications({required DateTime dateTime, required int id, required String title, required String body}) async {
    TZDateTime tzDateNotification = tz.TZDateTime.from(dateTime, tz.local);
    try {
      await _flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tzDateNotification,
        NotificationDetails(
          android: _androidFastNotificationDetails,
          iOS: _iOSFastNotificationDetails,
        ),
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
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