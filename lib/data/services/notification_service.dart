import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/timezone.dart';

class NotificationService {
  static const String _logoName = '@drawable/sm_logo';
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final AndroidNotificationDetails _androidPrayerNotificationDetails = const AndroidNotificationDetails(
    'Daily prayer and adhkars notification channel ID',
    'Prayer and adhkars notifications',
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

  Future<void> timeNotifications({required int id, required String title, required String body, required DateTime prayerTime}) async {
    TZDateTime tzDateNotification = tz.TZDateTime.from(prayerTime.add(const Duration(hours: -3)), tz.local);
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

  Future<void> dayNotifications({required int id, required String title, required String body, required DateTime dateTime}) async {
    TZDateTime tzDateNotification = tz.TZDateTime.from(dateTime.add(const Duration(hours: -3)), tz.local);
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