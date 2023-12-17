import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    if (notificationsState.fajrNotification) {
      notificationService.timeNotifications(
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
        prayerTime: adhanTimeState.getPrayerTimes.sunrise.add(const Duration(minutes: 30)),
      );
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.sunriseNotificationID);
    }
    if (notificationsState.dhuhrNotification) {
      notificationService.timeNotifications(
        id: AppConstraints.dhuhrNotificationID,
        title: appLocale!.notification,
        body: appLocale.dhuhrTime,
        prayerTime: adhanTimeState.getPrayerTimes.dhuhr,
      );
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.dhuhrNotificationID);
    }
    if (notificationsState.asrNotification) {
      notificationService.timeNotifications(
        id: AppConstraints.asrNotificationID,
        title: appLocale!.notification,
        body: appLocale.asrTime,
        prayerTime: adhanTimeState.getPrayerTimes.asr,
      );
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.asrNotificationID);
    }
    if (notificationsState.maghribNotification) {
      notificationService.timeNotifications(
        id: AppConstraints.maghribNotificationID,
        title: appLocale!.notification,
        body: appLocale.maghribTime,
        prayerTime: adhanTimeState.getPrayerTimes.maghrib,
      );
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.maghribNotificationID);
    }
    if (notificationsState.ishaNotification) {
      notificationService.timeNotifications(
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
        prayerTime: adhanTimeState.getPrayerTimes.fajr.add(const Duration(minutes: 30)),
      );
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.morningSupplicationsNotificationID);
    }
    if (notificationsState.eveningSupplicationsNotification) {
      notificationService.timeNotifications(
        id: AppConstraints.eveningSupplicationsNotificationID,
        title: appLocale!.remind,
        body: appLocale.eveningAdhkarsTime,
        prayerTime: adhanTimeState.getPrayerTimes.asr.add(const Duration(minutes: 30)),
      );
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.eveningSupplicationsNotificationID);
    }
    if (notificationsState.nightSupplicationsNotification) {
      notificationService.timeNotifications(
        id: AppConstraints.nightSupplicationsNotificationID,
        title: appLocale!.remind,
        body: appLocale.nightAdhkarsTime,
        prayerTime: adhanTimeState.getPrayerTimes.isha.add(const Duration(hours: 1)),
      );
    } else {
      notificationService.cancelNotificationWithId(AppConstraints.nightSupplicationsNotificationID);
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
                    style: TextStyle(
                        fontSize: 18,
                        color: appColors.inverseSurface
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
}
