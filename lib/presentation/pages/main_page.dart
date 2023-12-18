import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/core/routes/route_names.dart';
import 'package:majmua/core/strings/app_constraints.dart';
import 'package:majmua/core/strings/app_strings.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/data/services/notification_service.dart';
import 'package:majmua/presentation/lists/main_widgets_list.dart';
import 'package:majmua/presentation/state/adhan_time_state.dart';
import 'package:majmua/presentation/state/app_settings_state.dart';
import 'package:majmua/presentation/state/notifications_state.dart';
import 'package:majmua/presentation/state/rest_time_state.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    Hive.close();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      Provider.of<RestTimeState>(context, listen: false).changeNotifiers();
      Provider.of<AdhanTimeState>(context, listen: false).changeNotifiers();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    final AppSettingsState appSettingsState = Provider.of<AppSettingsState>(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final NotificationService notificationService = NotificationService();
    final NotificationsState notificationsState = NotificationsState();
    final AdhanTimeState adhanTimeState = Provider.of<AdhanTimeState>(context);
    final RestTimeState restTimeState = Provider.of<RestTimeState>(context);
    final DateTime dateTime = DateTime.now();
    int daysUntilNextSunday = DateTime.sunday - dateTime.weekday;
    if (daysUntilNextSunday <= 0) {
      daysUntilNextSunday += 7;
    }
    int daysUntilNextWednesday = DateTime.wednesday - dateTime.weekday;
    if (daysUntilNextWednesday <= 0) {
      daysUntilNextWednesday += 7;
    }
    int daysUntilNextThursday = DateTime.thursday - dateTime.weekday;
    if (daysUntilNextThursday <= 0) {
      daysUntilNextThursday += 7;
    }
    int daysUntilNextFriday = DateTime.friday - dateTime.weekday;
    if (daysUntilNextFriday <= 0) {
      daysUntilNextFriday += 7;
    }
    if (notificationsState.fajrNotification) {
      notificationService.prayerNotifications(
        id: AppConstraints.fajrNotificationID,
        title: appLocale!.notification,
        body: appLocale.fajrTime,
        prayerTime: adhanTimeState.getPrayerTimes.fajr,
      );
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.fajrNotificationID);
    }
    if (notificationsState.sunriseNotification) {
      notificationService.timeNotifications(
        id: AppConstraints.sunriseNotificationID,
        title: appLocale!.notification,
        body: appLocale.sunriseDuhaTime,
        dateTime: adhanTimeState.getPrayerTimes.sunrise.add(const Duration(minutes: 30)),
      );
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.sunriseNotificationID);
    }
    if (notificationsState.dhuhrNotification) {
      notificationService.prayerNotifications(
        id: AppConstraints.dhuhrNotificationID,
        title: appLocale!.notification,
        body: appLocale.dhuhrTime,
        prayerTime: adhanTimeState.getPrayerTimes.dhuhr,
      );
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.dhuhrNotificationID);
    }
    if (notificationsState.asrNotification) {
      notificationService.prayerNotifications(
        id: AppConstraints.asrNotificationID,
        title: appLocale!.notification,
        body: appLocale.asrTime,
        prayerTime: adhanTimeState.getPrayerTimes.asr,
      );
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.asrNotificationID);
    }
    if (notificationsState.maghribNotification) {
      notificationService.prayerNotifications(
        id: AppConstraints.maghribNotificationID,
        title: appLocale!.notification,
        body: appLocale.maghribTime,
        prayerTime: adhanTimeState.getPrayerTimes.maghrib,
      );
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.maghribNotificationID);
    }
    if (notificationsState.ishaNotification) {
      notificationService.prayerNotifications(
        id: AppConstraints.ishaNotificationID,
        title: appLocale!.notification,
        body: appLocale.ishaTime,
        prayerTime: adhanTimeState.getPrayerTimes.isha,
      );
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.ishaNotificationID);
    }
    if (notificationsState.morningSupplicationsNotification) {
      notificationService.timeNotifications(
        id: AppConstraints.morningSupplicationsNotificationID,
        title: appLocale!.remind,
        body: appLocale.morningAdhkarsTime,
        dateTime: adhanTimeState.getPrayerTimes.fajr.add(const Duration(minutes: 30)),
      );
    } else {
      notificationService.cancelNotificationWithId(
          AppConstraints.morningSupplicationsNotificationID);
    }
    if (notificationsState.eveningSupplicationsNotification) {
      notificationService.timeNotifications(
        id: AppConstraints.eveningSupplicationsNotificationID,
        title: appLocale!.remind,
        body: appLocale.eveningAdhkarsTime,
        dateTime: adhanTimeState.getPrayerTimes.asr.add(const Duration(minutes: 30)),
      );
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.eveningSupplicationsNotificationID);
    }
    if (notificationsState.nightSupplicationsNotification) {
      notificationService.timeNotifications(
        id: AppConstraints.nightSupplicationsNotificationID,
        title: appLocale!.remind,
        body: appLocale.nightAdhkarsTime,
        dateTime: adhanTimeState.getPrayerTimes.isha.add(const Duration(hours: 1)),
      );
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.nightSupplicationsNotificationID);
    }
    if (notificationsState.fastMondayNotification) {
      if (!restTimeState.isRamadan && !restTimeState.holidaysRamadan && !restTimeState.isNineDays && !restTimeState.holidaysHijjah) {
        notificationService.dayNotifications(
          id: AppConstraints.fastMondayNotificationID,
          title: appLocale!.remind,
          body: appLocale.fastMondayTime,
          dateTime: DateTime(dateTime.year, dateTime.month, dateTime.day, 20, 0).add(Duration(days: daysUntilNextSunday)),
        );
      } else {
        notificationService.cancelNotificationWithId(AppConstraints.fastMondayNotificationID);
      }
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.fastMondayNotificationID);
    }
    if (notificationsState.fastThursdayNotification) {
      if (!restTimeState.isRamadan && !restTimeState.holidaysRamadan && !restTimeState.isNineDays && !restTimeState.holidaysHijjah) {
        notificationService.dayNotifications(
          id: AppConstraints.fastThursdayNotificationID,
          title: appLocale!.remind,
          body: appLocale.fastThursdayTime,
          dateTime: DateTime(dateTime.year, dateTime.month, dateTime.day, 20, 0).add(Duration(days: daysUntilNextWednesday)),
        );
      } else {
        notificationService.cancelNotificationWithId(AppConstraints.fastThursdayNotificationID);
      }
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.fastThursdayNotificationID);
    }
    if (notificationsState.fastWhiteDaysNotification) {
      if (!restTimeState.isRamadan && !restTimeState.holidaysRamadan && !restTimeState.isNineDays && !restTimeState.holidaysHijjah) {
        DateTime next12thDay = calculateNext12thDay(HijriCalendar.now());
        notificationService.monthNotifications(
          id: AppConstraints.fastWhiteDaysNotificationID,
          title: appLocale!.remind,
          body: appLocale.fastWhiteDaysTime,
          dateTime: DateTime(next12thDay.year, next12thDay.month, next12thDay.day, 20, 0),
        );
      } else {
        notificationService.cancelNotificationWithId(AppConstraints.fastThursdayNotificationID);
      }
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.fastThursdayNotificationID);
    }
    if (notificationsState.fridayNotification) {
      notificationService.dayNotifications(
        id: AppConstraints.fridayNotificationID,
        title: appLocale!.remind,
        body: appLocale.fridayTime,
        dateTime: DateTime(dateTime.year, dateTime.month, dateTime.day, 20, 0).add(Duration(days: daysUntilNextThursday)),
      );
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.fridayNotificationID);
    }
    if (notificationsState.lastHourFridayNotification) {
      notificationService.timeNotifications(
        id: AppConstraints.lastHourFridayNotificationID,
        title: appLocale!.remind,
        body: appLocale.lastHourFridayTime,
        dateTime: DateTime(dateTime.year, dateTime.month, dateTime.day, adhanTimeState.getPrayerTimes.maghrib.hour + 2, adhanTimeState.getPrayerTimes.maghrib.minute).add(Duration(days: daysUntilNextFriday)),
      );
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.fastThursdayNotificationID);
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/pictures/${AppStrings.backgroundPictureNames[appSettingsState.getBackgroundPictureIndex]}',
          ),
          fit: BoxFit.cover,
          opacity: isDarkMode ? 0.25 : 1,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              title: Card(
                margin: EdgeInsets.zero,
                child: Container(
                  padding: AppStyles.mainMardingMini,
                  width: double.infinity,
                  child: Text(
                    appLocale!.appName,
                    style: TextStyle(fontSize: 18, color:
                    appColors.inverseSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              elevation: 0,
              centerTitle: true,
              pinned: false,
              floating: true,
              actions: [
                Card(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.appSettingsPage);
                    },
                    tooltip: appLocale.settings,
                    splashRadius: 20,
                    color: appColors.primary,
                    icon: const Icon(CupertinoIcons.settings),
                  ),
                ),
                Card(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.notificationParamsPage);
                    },
                    tooltip: appLocale.notifications,
                    splashRadius: 20,
                    color: appColors.primary,
                    icon: const Icon(CupertinoIcons.bell),
                  ),
                ),
              ],
            ),
            const SliverToBoxAdapter(
              child: MainWidgetsList(),
            ),
          ],
        ),
      ),
    );
  }

  DateTime calculateNext12thDay(HijriCalendar hijriCalendar) {
    int desiredDay = 12;
    int daysUntilNext12thDay = desiredDay - hijriCalendar.hDay;
    if (daysUntilNext12thDay <= 0) {
      hijriCalendar.addMonth(hijriCalendar.hYear, hijriCalendar.hMonth + 1);
      daysUntilNext12thDay = desiredDay - hijriCalendar.hDay;
    }
    return hijriCalendar.hijriToGregorian(
      hijriCalendar.hYear,
      hijriCalendar.hMonth,
      desiredDay,
    );
  }
}
