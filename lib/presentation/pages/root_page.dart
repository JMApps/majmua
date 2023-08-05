import 'package:flutter/material.dart';
import 'package:majmua/application/notification/app_notification_service.dart';
import 'package:majmua/application/other/default_scroll_behavior.dart';
import 'package:majmua/application/routes/app_routes.dart';
import 'package:majmua/application/state/main_settings_state.dart';
import 'package:majmua/application/state/prayer_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/pages/home_page.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainSettingsState mainSettings = context.watch<MainSettingsState>();
    final PrayerTimeState pt = context.watch<PrayerTimeState>();
    final AppNotificationService notification = AppNotificationService();
    DateTime now = DateTime.now();
    int daysUntilNextSunday = DateTime.sunday - now.weekday;
    if (daysUntilNextSunday <= 0) {
      daysUntilNextSunday += 7;
    }
    int daysUntilNextWednesday = DateTime.wednesday - now.weekday;
    if (daysUntilNextWednesday <= 0) {
      daysUntilNextWednesday += 7;
    }
    if (mainSettings.getFajrNotification) {
      notification.dailyPrayerNotifications(
        hour: pt.getPrayerTimes.fajr.hour,
        minute: pt.getPrayerTimes.fajr.minute,
        title: AppString.appName,
        body: AppString.fajr,
        id: AppNotificationService.fajrNotificationID,
      );
    } else {
      notification.cancelNotificationWithId(AppNotificationService.fajrNotificationID);
    }
    if (mainSettings.getSunriseNotification) {
      notification.dailyPrayerNotifications(
        hour: pt.getPrayerTimes.sunrise.hour,
        minute: pt.getPrayerTimes.sunrise.minute,
        title: AppString.appName,
        body: AppString.sunrise,
        id: AppNotificationService.sunriseNotificationID,
      );
    } else {
      notification.cancelNotificationWithId(AppNotificationService.sunriseNotificationID);
    }
    if (mainSettings.getDhuhrNotification) {
      notification.dailyPrayerNotifications(
        hour: pt.getPrayerTimes.dhuhr.hour,
        minute: pt.getPrayerTimes.dhuhr.minute,
        title: AppString.appName,
        body: AppString.dhuhr,
        id: AppNotificationService.dhuhrNotificationID,
      );
    } else {
      notification.cancelNotificationWithId(AppNotificationService.dhuhrNotificationID);
    }
    if (mainSettings.getAsrNotification) {
      notification.dailyPrayerNotifications(
        hour: pt.getPrayerTimes.asr.hour,
        minute: pt.getPrayerTimes.asr.minute,
        title: AppString.appName,
        body: AppString.asr,
        id: AppNotificationService.asrNotificationID,
      );
    } else {
      notification.cancelNotificationWithId(AppNotificationService.asrNotificationID);
    }
    if (mainSettings.getMaghribNotification) {
      notification.dailyPrayerNotifications(
        hour: pt.getPrayerTimes.maghrib.hour,
        minute: pt.getPrayerTimes.maghrib.minute,
        title: AppString.appName,
        body: AppString.maghrib,
        id: AppNotificationService.maghribNotificationID,
      );
    } else {
      notification.cancelNotificationWithId(
          AppNotificationService.maghribNotificationID);
    }
    if (mainSettings.getIshaNotification) {
      notification.dailyPrayerNotifications(
        hour: pt.getPrayerTimes.isha.hour,
        minute: pt.getPrayerTimes.isha.minute,
        title: AppString.appName,
        body: AppString.isha,
        id: AppNotificationService.ishaNotificationID,
      );
    } else {
      notification.cancelNotificationWithId(AppNotificationService.ishaNotificationID);
    }
    if (mainSettings.getMorningNSupplicationsNotification) {
      notification.dailyAdhkarNotifications(
        hour: pt.getPrayerTimes.fajr.add(const Duration(minutes: 30)).hour,
        minute: pt.getPrayerTimes.fajr.add(const Duration(minutes: 30)).minute,
        body: AppString.morningNotificationDescription,
        id: AppNotificationService.morningSupplicationsNotificationID,
      );
    } else {
      notification.cancelNotificationWithId(AppNotificationService.morningSupplicationsNotificationID);
    }
    if (mainSettings.getEveningSupplicationsNotification) {
      notification.dailyAdhkarNotifications(
        hour: pt.getPrayerTimes.asr.add(const Duration(minutes: 30)).hour,
        minute: pt.getPrayerTimes.asr.add(const Duration(minutes: 30)).minute,
        body: AppString.eveningNotificationDescription,
        id: AppNotificationService.eveningSupplicationsNotificationID,
      );
    } else {
      notification.cancelNotificationWithId(AppNotificationService.eveningSupplicationsNotificationID);
    }
    if (mainSettings.getFastMondayNotification) {
      notification.forWeeklyFast(
        id: AppNotificationService.fastMondayNotificationID,
        nextWeekFastDay: DateTime(now.year, now.month, now.day, 20, 0).add(Duration(days: daysUntilNextSunday)),
      );
    } else {
      notification.cancelNotificationWithId(AppNotificationService.fastMondayNotificationID);
    }
    if (mainSettings.getFastThursdayNotification) {
      notification.forWeeklyFast(
        id: AppNotificationService.fastThursdayNotificationID,
        nextWeekFastDay: DateTime(now.year, now.month, now.day, 20, 0).add(Duration(days: daysUntilNextWednesday)),
      );
    } else {
      notification.cancelNotificationWithId(AppNotificationService.fastThursdayNotificationID);
    }
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: DefaultScrollBehavior(),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      onGenerateRoute: AppRoutes.onGeneratorRoute,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: mainSettings.getIsAdaptiveTheme
          ? ThemeMode.system
          : mainSettings.getIsUserTheme
              ? ThemeMode.dark
              : ThemeMode.light,
      home: const HomePage(),
    );
  }
}
