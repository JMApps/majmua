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
    if (mainSettings.getFajrNotification) {
      notification.zonedScheduleNotification(
        pt.getPrayerTimes.fajr.hour,
        pt.getPrayerTimes.fajr.minute,
        AppString.appName,
        AppString.fajr,
        AppNotificationService.fajrNotificationID,
      );
    } else {
      notification.cancelNotificationWithId(AppNotificationService.fajrNotificationID);
    }
    if (mainSettings.getSunriseNotification) {
      notification.zonedScheduleNotification(
        pt.getPrayerTimes.sunrise.hour,
        pt.getPrayerTimes.sunrise.minute,
        AppString.appName,
        AppString.sunrise,
        AppNotificationService.sunriseNotificationID,
      );
    } else {
      notification.cancelNotificationWithId(AppNotificationService.sunriseNotificationID);
    }
    if (mainSettings.getDhuhrNotification) {
      notification.zonedScheduleNotification(
        pt.getPrayerTimes.dhuhr.hour,
        pt.getPrayerTimes.dhuhr.minute,
        AppString.appName,
        AppString.dhuhr,
        AppNotificationService.dhuhrNotificationID,
      );
    } else {
      notification.cancelNotificationWithId(AppNotificationService.dhuhrNotificationID);
    }
    if (mainSettings.getAsrNotification) {
      notification.zonedScheduleNotification(
        pt.getPrayerTimes.asr.hour,
        pt.getPrayerTimes.asr.minute,
        AppString.appName,
        AppString.asr,
        AppNotificationService.asrNotificationID,
      );
    } else {
      notification.cancelNotificationWithId(AppNotificationService.asrNotificationID);
    }
    if (mainSettings.getMaghribNotification) {
      notification.zonedScheduleNotification(
        pt.getPrayerTimes.maghrib.hour,
        pt.getPrayerTimes.maghrib.minute,
        AppString.appName,
        AppString.maghrib,
        AppNotificationService.maghribNotificationID,
      );
    } else {
      notification.cancelNotificationWithId(AppNotificationService.maghribNotificationID);
    }
    if (mainSettings.getIshaNotification) {
      notification.zonedScheduleNotification(
        pt.getPrayerTimes.isha.hour,
        pt.getPrayerTimes.isha.minute,
        AppString.appName,
        AppString.isha,
        AppNotificationService.ishaNotificationID,
      );
    } else {
      notification.cancelNotificationWithId(AppNotificationService.ishaNotificationID);
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
