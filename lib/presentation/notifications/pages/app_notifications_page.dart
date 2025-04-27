import 'package:flutter/material.dart';
import '../../../l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../state/notifications_state.dart';
import '../items/notification_item.dart';

class AppNotificationsPage extends StatelessWidget {
  const AppNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocale.notifications),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Consumer<NotificationsState>(
            builder: (context, notificationsState, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: AppStyles.mardingHorizontal,
                    child: Text(
                      appLocale.prayerNotifications,
                      style: AppStyles.mainTextStyleBold,
                    ),
                  ),
                  Card(
                    margin: AppStyles.mardingWithoutBottomMini,
                    child: Padding(
                      padding: AppStyles.mainMardingMini,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          NotificationItem(
                            title: appLocale.fajr,
                            switchState: notificationsState.isFajrNotification,
                            onChanged: (onChanged) => notificationsState.isFajrNotification = onChanged,
                          ),
                          const Divider(),
                          NotificationItem(
                            title: appLocale.sunrise,
                            switchState: notificationsState.isSunriseNotification,
                            onChanged: (onChanged) => notificationsState.isSunriseNotification = onChanged,
                          ),
                          const Divider(),
                          NotificationItem(
                            title: appLocale.dhuhr,
                            switchState: notificationsState.isDhuhrNotification,
                            onChanged: (onChanged) => notificationsState.isDhuhrNotification = onChanged,
                          ),
                          const Divider(),
                          NotificationItem(
                            title: appLocale.asr,
                            switchState: notificationsState.isAsrNotification,
                            onChanged: (onChanged) => notificationsState.isAsrNotification = onChanged,
                          ),
                          const Divider(),
                          NotificationItem(
                            title: appLocale.maghrib,
                            switchState: notificationsState.isMaghribNotification,
                            onChanged: (onChanged) => notificationsState.isMaghribNotification = onChanged,
                          ),
                          const Divider(),
                          NotificationItem(
                            title: appLocale.isha,
                            switchState: notificationsState.isIshaNotification,
                            onChanged: (onChanged) => notificationsState.isIshaNotification = onChanged,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: AppStyles.mardingHorizontal,
                    child: Text(
                      appLocale.adhkarsNotifications,
                      style: AppStyles.mainTextStyleBold,
                    ),
                  ),
                  Card(
                    margin: AppStyles.mardingWithoutBottomMini,
                    child: Padding(
                      padding: AppStyles.mainMardingMini,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          NotificationItem(
                            title: appLocale.morningAdhkars,
                            switchState: notificationsState.isMorningAdhkarsNotification,
                            onChanged: (onChanged) => notificationsState.isMorningAdhkarsNotification = onChanged,
                          ),
                          const Divider(),
                          NotificationItem(
                            title: appLocale.eveningAdhkars,
                            switchState: notificationsState.isEveningAdhkarsNotification,
                            onChanged: (onChanged) => notificationsState.isEveningAdhkarsNotification = onChanged,
                          ),
                          const Divider(),
                          NotificationItem(
                            title: appLocale.nightAdhkars,
                            switchState: notificationsState.isNightAdhkarsNotification,
                            onChanged: (onChanged) => notificationsState.isNightAdhkarsNotification = onChanged,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: AppStyles.mardingHorizontal,
                    child: Text(
                      appLocale.fastingNotifications,
                      style: AppStyles.mainTextStyleBold,
                    ),
                  ),
                  Card(
                    margin: AppStyles.mardingWithoutBottomMini,
                    child: Padding(
                      padding: AppStyles.mainMardingMini,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          NotificationItem(
                            title: appLocale.fastMonday,
                            switchState: notificationsState.isFastMondayNotification,
                            onChanged: (onChanged) => notificationsState.isFastMondayNotification = onChanged,
                          ),
                          const Divider(),
                          NotificationItem(
                            title: appLocale.fastThursday,
                            switchState: notificationsState.isFastThursdayNotification,
                            onChanged: (onChanged) => notificationsState.isFastThursdayNotification = onChanged,
                          ),
                          const Divider(),
                          NotificationItem(
                            title: appLocale.whiteDays,
                            switchState: notificationsState.isWhiteDaysNotification,
                            onChanged: (onChanged) => notificationsState.isWhiteDaysNotification = onChanged,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: AppStyles.mardingHorizontal,
                    child: Text(
                      appLocale.fridayNotifications,
                      style: AppStyles.mainTextStyleBold,
                    ),
                  ),
                  Card(
                    margin: AppStyles.mainMardingMini,
                    child: Padding(
                      padding: AppStyles.mainMardingMini,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          NotificationItem(
                            title: appLocale.friday,
                            switchState: notificationsState.isFridayNotification,
                            onChanged: (onChanged) => notificationsState.isFridayNotification = onChanged,
                          ),
                          const Divider(),
                          NotificationItem(
                            title: appLocale.lastFridayHour,
                            switchState: notificationsState.isLastHourFridayNotification,
                            onChanged: (onChanged) => notificationsState.isLastHourFridayNotification = onChanged,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
