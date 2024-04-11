import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:provider/provider.dart';

import '../../core/routes/route_names.dart';
import '../../core/strings/app_constraints.dart';
import '../../core/strings/app_strings.dart';
import '../../data/services/notification_service.dart';
import '../lists/main_widgets_list.dart';
import '../state/adhan_time_state.dart';
import '../state/app_settings_state.dart';
import '../state/notifications_state.dart';
import '../state/rest_time_state.dart';

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

    final NotificationService notificationService = NotificationService();
    final NotificationsState notificationsState = Provider.of<NotificationsState>(context);
    final AdhanTimeState adhanTimeState = Provider.of<AdhanTimeState>(context);
    final RestTimeState restTimeState = Provider.of<RestTimeState>(context);
    final DateTime dateTime = DateTime.now();
    DateTime fixed20Time = DateTime(dateTime.year, dateTime.month, dateTime.day, 20, 0);

    if (notificationsState.fajrNotification) {
      notificationService.prayerNotifications(
        id: AppConstraints.fajrNotificationID,
        title: appLocale!.prayerNotification,
        body: appLocale.fajr,
        prayerTime: adhanTimeState.getPrayerTimes.fajr,
      );
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.fajrNotificationID);
    }
    if (notificationsState.sunriseNotification) {
      notificationService.timeNotifications(
        id: AppConstraints.sunriseNotificationID,
        title: appLocale!.prayerNotification,
        body: appLocale.sunriseDuha,
        dateTime: adhanTimeState.getPrayerTimes.sunrise
            .add(const Duration(minutes: 30)),
      );
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.sunriseNotificationID);
    }
    if (notificationsState.dhuhrNotification) {
      notificationService.prayerNotifications(
        id: AppConstraints.dhuhrNotificationID,
        title: appLocale!.prayerNotification,
        body: appLocale.dhuhr,
        prayerTime: adhanTimeState.getPrayerTimes.dhuhr,
      );
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.dhuhrNotificationID);
    }
    if (notificationsState.asrNotification) {
      notificationService.prayerNotifications(
        id: AppConstraints.asrNotificationID,
        title: appLocale!.prayerNotification,
        body: appLocale.asr,
        prayerTime: adhanTimeState.getPrayerTimes.asr,
      );
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.asrNotificationID);
    }
    if (notificationsState.maghribNotification) {
      notificationService.prayerNotifications(
        id: AppConstraints.maghribNotificationID,
        title: appLocale!.prayerNotification,
        body: appLocale.maghrib,
        prayerTime: adhanTimeState.getPrayerTimes.maghrib,
      );
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.maghribNotificationID);
    }
    if (notificationsState.ishaNotification) {
      notificationService.prayerNotifications(
        id: AppConstraints.ishaNotificationID,
        title: appLocale!.prayerNotification,
        body: appLocale.isha,
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
      notificationService.cancelNotificationWithId(AppConstraints.morningSupplicationsNotificationID);
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
      if (restTimeState.isOpenWhiteDays) {
        notificationService.dayNotifications(
          id: AppConstraints.fastMondayNotificationID,
          title: appLocale!.remind,
          body: appLocale.fastMondayTime,
          dateTime: fixed20Time.add(Duration(days: restTimeState.getDaysUntilNextSunday)),
        );
      } else {
        notificationService.cancelNotificationWithId(AppConstraints.fastMondayNotificationID);
      }
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.fastMondayNotificationID);
    }
    if (notificationsState.fastThursdayNotification) {
      if (restTimeState.isOpenWhiteDays) {
        notificationService.dayNotifications(
          id: AppConstraints.fastThursdayNotificationID,
          title: appLocale!.remind,
          body: appLocale.fastThursdayTime,
          dateTime: fixed20Time
              .add(Duration(days: restTimeState.getDaysUntilNextWednesday)),
        );
      } else {
        notificationService.cancelNotificationWithId(AppConstraints.fastThursdayNotificationID);
      }
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.fastThursdayNotificationID);
    }
    if (notificationsState.fastWhiteDaysNotification) {
      if (restTimeState.isOpenWhiteDays) {
        notificationService.monthNotifications(
          id: AppConstraints.fastWhiteDaysNotificationID,
          title: appLocale!.remind,
          body: appLocale.fastWhiteDaysTime,
          dateTime: DateTime(
              restTimeState.getNext12thDay.year,
              restTimeState.getNext12thDay.month,
              restTimeState.getNext12thDay.day,
              21,
              0),
        );
      } else {
        notificationService.cancelNotificationWithId(AppConstraints.fastWhiteDaysNotificationID);
      }
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.fastWhiteDaysNotificationID);
    }
    if (notificationsState.fridayNotification) {
      notificationService.dayNotifications(
        id: AppConstraints.fridayNotificationID,
        title: appLocale!.remind,
        body: appLocale.fridayTime,
        dateTime: fixed20Time
            .add(Duration(days: restTimeState.getDaysUntilNextThursday)),
      );
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.fridayNotificationID);
    }
    if (notificationsState.lastHourFridayNotification) {
      notificationService.dayNotifications(
        id: AppConstraints.lastHourFridayNotificationID,
        title: appLocale!.remind,
        body: appLocale.lastHourFridayTime,
        dateTime: DateTime(
                dateTime.year,
                dateTime.month,
                dateTime.day,
                adhanTimeState.getPrayerTimes.maghrib.hour - 1,
                adhanTimeState.getPrayerTimes.maghrib.minute)
            .add(Duration(days: restTimeState.getDaysUntilNextFriday)),
      );
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.lastHourFridayNotificationID);
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/pictures/${AppStrings.backgroundPictureNames[Provider.of<AppSettingsState>(context).getBackgroundPictureIndex]}',
          ),
          fit: BoxFit.cover,
          opacity:
              Theme.of(context).brightness == Brightness.dark ? 0.20 : 0.75,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: appColors.primaryDark.withOpacity(
                  Theme.of(context).brightness == Brightness.dark
                      ? 0.75
                      : 0.55),
              title: Text(
                appLocale!.appName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              elevation: 0,
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, RouteNames.notificationParamsPage);
                  },
                  tooltip: appLocale.notifications,
                  splashRadius: 20,
                  icon: Image.asset(
                    'assets/icons/notifications.png',
                    width: 25,
                    height: 25,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // TODO add share
                  },
                  tooltip: appLocale.notifications,
                  splashRadius: 20,
                  icon: Image.asset(
                    'assets/icons/share.png',
                    width: 25,
                    height: 25,
                    color: Colors.white,
                  ),
                ),
              ],
              leading: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.appSettingsPage);
                },
                tooltip: appLocale.settings,
                splashRadius: 20,
                icon: Image.asset(
                  'assets/icons/setting.png',
                  width: 25,
                  height: 25,
                  color: Colors.white,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: MainWidgetsList(),
            ),
          ],
        ),
      ),
    );
  }
}
