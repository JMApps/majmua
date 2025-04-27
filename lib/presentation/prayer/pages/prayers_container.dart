import 'package:adhan/adhan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/app_route_names.dart';
import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../data/services/notification/notification_service.dart';
import '../../qiblah/qiblah_direction_container.dart';
import '../../state/notifications_state.dart';
import '../../state/prayer_state.dart';
import '../../state/time_state.dart';
import '../../widgets/main_icon_button.dart';
import '../items/prayer_item.dart';
import '../items/select_city_item.dart';
import '../widgets/prayer_messages.dart';

class PrayersContainer extends StatefulWidget {
  const PrayersContainer({super.key});

  @override
  State<PrayersContainer> createState() => _PrayersContainerState();
}

class _PrayersContainerState extends State<PrayersContainer> {
  final NotificationService _notificationService = NotificationService();

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Consumer3<NotificationsState, PrayerState, TimeState>(
      builder: (context, notification, prayer, time, _) {
        if (notification.isFajrNotification) {
          _notificationService.prayerNotification(id: AppStringConstraints.fajrNotificationID, title: appLocale.prayerTime, body: appLocale.fajr, dateTime: prayer.prayerTimes.fajr);
        } else {
          _notificationService.cancelNotificationWithId(AppStringConstraints.fajrNotificationID);
        }
        if (notification.isSunriseNotification) {
          _notificationService.dailyNotification(id: AppStringConstraints.sunriseNotificationID, title: appLocale.sunrise, body: appLocale.adDuhaTime, dateTime: prayer.prayerTimes.sunrise.add(const Duration(minutes: 45)));
        } else {
          _notificationService.cancelNotificationWithId(AppStringConstraints.sunriseNotificationID);
        }
        if (notification.isDhuhrNotification) {
          _notificationService.prayerNotification(id: AppStringConstraints.dhuhrNotificationID, title: appLocale.prayerTime, body: appLocale.dhuhr, dateTime: prayer.prayerTimes.dhuhr);
        } else {
          _notificationService.cancelNotificationWithId(AppStringConstraints.dhuhrNotificationID);
        }
        if (notification.isAsrNotification) {
          _notificationService.prayerNotification(id: AppStringConstraints.asrNotificationID, title: appLocale.prayerTime, body: appLocale.asr, dateTime: prayer.prayerTimes.asr);
        } else {
          _notificationService.cancelNotificationWithId(AppStringConstraints.asrNotificationID);
        }
        if (notification.isMaghribNotification) {
          _notificationService.prayerNotification(id: AppStringConstraints.maghribNotificationID, title: appLocale.prayerTime, body: appLocale.maghrib, dateTime: prayer.prayerTimes.maghrib);
        } else {
          _notificationService.cancelNotificationWithId(AppStringConstraints.maghribNotificationID);
        }
        if (notification.isIshaNotification) {
          _notificationService.prayerNotification(id: AppStringConstraints.ishaNotificationID, title: appLocale.prayerTime, body: appLocale.isha, dateTime: prayer.prayerTimes.isha);
        } else {
          _notificationService.cancelNotificationWithId(AppStringConstraints.ishaNotificationID);
        }
        if (notification.isMorningAdhkarsNotification) {
          _notificationService.dailyNotification(id: AppStringConstraints.morningSupplicationsNotificationID, title: appLocale.remind, body: '${appLocale.morningAdhkarsTime} 🤲', dateTime: prayer.prayerTimes.fajr.add(const Duration(minutes: 30)));
        } else {
          _notificationService.cancelNotificationWithId(AppStringConstraints.morningSupplicationsNotificationID);
        }
        if (notification.isEveningAdhkarsNotification) {
          _notificationService.dailyNotification(id: AppStringConstraints.eveningSupplicationsNotificationID, title: appLocale.remind, body: '${appLocale.eveningAdhkarsTime} 🤲', dateTime: prayer.prayerTimes.asr.add(const Duration(minutes: 30)));
        } else {
          _notificationService.cancelNotificationWithId(AppStringConstraints.eveningSupplicationsNotificationID);
        }
        if (notification.isNightAdhkarsNotification) {
          _notificationService.dailyNotification(id: AppStringConstraints.nightSupplicationsNotificationID, title: appLocale.remind, body: '${appLocale.nightAdhkarsTime} 🤲', dateTime: prayer.prayerTimes.isha.add(const Duration(minutes: 30)));
        } else {
          _notificationService.cancelNotificationWithId(AppStringConstraints.nightSupplicationsNotificationID);
        }
        if (notification.isFastThursdayNotification && time.isFasting()) {
          _notificationService.weeklyNotification(id: AppStringConstraints.fastThursdayNotificationID, title: appLocale.remind, body: appLocale.nearFastingDay, dateTime: prayer.weeklyWednesday);
        } else {
          _notificationService.cancelNotificationWithId(AppStringConstraints.fastThursdayNotificationID);
        }
        if (notification.isFastMondayNotification && time.isFasting()) {
          _notificationService.weeklyNotification(id: AppStringConstraints.fastMondayNotificationID, title: appLocale.remind, body: appLocale.nearFastingDay, dateTime: prayer.weeklySunday);
        } else {
          _notificationService.cancelNotificationWithId(AppStringConstraints.fastMondayNotificationID);
        }
        if (notification.isFridayNotification) {
          _notificationService.weeklyNotification(id: AppStringConstraints.fridayNotificationID, title: appLocale.remind, body: appLocale.tomorrowFriday, dateTime: prayer.weeklyThursday);
        } else {
          _notificationService.cancelNotificationWithId(AppStringConstraints.fridayNotificationID);
        }
        if (notification.isLastHourFridayNotification) {
          _notificationService.weeklyNotification(id: AppStringConstraints.lastHourFridayNotificationID, title: appLocale.remind, body: '${appLocale.lastFridayHour} 🤲🤲🤲', dateTime: prayer.lastFridayHour);
        } else {
          _notificationService.cancelNotificationWithId(AppStringConstraints.lastHourFridayNotificationID);
        }
        if (notification.isWhiteDaysNotification && time.isFasting()) {
          _notificationService.monthlyNotification(id: AppStringConstraints.fastWhiteDaysNotificationID, title: appLocale.remind, body: appLocale.nearWhiteDays, dateTime: time.twelfthyDay);
        } else {
          _notificationService.cancelNotificationWithId(AppStringConstraints.fastWhiteDaysNotificationID);
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Consumer<TimeState>(
              builder: (context, timeState, _) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AnimatedSize(
                      duration: const Duration(milliseconds: 500),
                      child: Visibility(
                        visible: timeState.isNearWhiteDays(),
                        child: Card(
                          margin: AppStyles.mardingHorizontalMini,
                          child: Padding(
                            padding: AppStyles.mainMardingMicro,
                            child: Text(
                              appLocale.nearWhiteDays,
                              style: AppStyles.mainTextStyleMini,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 500),
                      child: Visibility(
                        visible: timeState.isWhiteDays(),
                        child: Card(
                          margin: AppStyles.mardingHorizontalMini,
                          child: Padding(
                            padding: AppStyles.mainMardingMicro,
                            child: Text(
                              appLocale.whiteDays,
                              style: AppStyles.mainTextStyleMini,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Row(
              children: [
                const Expanded(
                  child: SelectCityItem(),
                ),
                const SizedBox(width: 8),
                MainIconButton(
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    Navigator.pushNamed(
                      context,
                      AppRouteNames.pagePrayerParams,
                    );
                  },
                  tooltip: appLocale.prayerParams,
                  iconName: AppStringConstraints.iconParams,
                  iconColor: appColors.primary,
                ),
                MainIconButton(
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    Navigator.pushNamed(
                      context,
                      AppRouteNames.pagePrayerSchedule,
                    );
                  },
                  tooltip: appLocale.prayerCalendar,
                  iconName: AppStringConstraints.iconCalendar,
                  iconColor: appColors.primary,
                ),
                Padding(
                  padding: AppStyles.mardingRightMini,
                  child: MainIconButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => const QiblahDirectionContainer(),
                      );
                    },
                    tooltip: appLocale.qiblah,
                    iconName: AppStringConstraints.iconQiblah,
                    iconColor: appColors.primary,
                  ),
                ),
              ],
            ),
            Card(
              margin: AppStyles.mardingHorizontalMini,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 8),
                  Padding(
                    padding: AppStyles.mardingHorizontalMini,
                    child: Row(
                      children: [
                        PrayerItem(
                          prayer: Prayer.fajr,
                          prayerName: appLocale.fajr,
                          prayerIcon: CupertinoIcons.sunrise_fill,
                        ),
                        const SizedBox(width: 8),
                        PrayerItem(
                          prayer: Prayer.dhuhr,
                          prayerName: appLocale.dhuhr,
                          prayerIcon: CupertinoIcons.sun_max_fill,
                        ),
                        const SizedBox(width: 8),
                        PrayerItem(
                          prayer: Prayer.asr,
                          prayerName: appLocale.asr,
                          prayerIcon: CupertinoIcons.sun_min_fill,
                        ),
                        const SizedBox(width: 8),
                        PrayerItem(
                          prayer: Prayer.maghrib,
                          prayerName: appLocale.maghrib,
                          prayerIcon: CupertinoIcons.sunset_fill,
                        ),
                        const SizedBox(width: 8),
                        PrayerItem(
                          prayer: Prayer.isha,
                          prayerName: appLocale.isha,
                          prayerIcon: CupertinoIcons.moon_stars_fill,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  const PrayerMessages(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
