import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/strings/app_constraints.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/data/services/notification_service.dart';
import 'package:majmua/presentation/state/notifications_state.dart';
import 'package:majmua/presentation/widgets/user_back_button.dart';
import 'package:provider/provider.dart';

class NotificationSettingsPage extends StatelessWidget {
  const NotificationSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    final NotificationService notificationService = NotificationService();
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocale!.notifications),
        leading: const UserBackButton(),
      ),
      body: Consumer<NotificationsState>(
        builder: (BuildContext context, NotificationsState notificationsState, _) {
          return ListView(
            padding: AppStyles.mainMarding,
            children: [
              Text(
                appLocale.prayerNotifications,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Card(
                margin: EdgeInsets.zero,
                color: appColors.glass,
                child: Padding(
                  padding: AppStyles.mainMardingMicro,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SwitchListTile.adaptive(
                        title: Text(appLocale.fajr),
                        value: notificationsState.fajrNotification,
                        shape: AppStyles.topShapeMini,
                        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                        activeColor: appColors.quaternaryColor,
                        onChanged: (bool onChanged) {
                          notificationsState.setFajrNotification = onChanged;
                          if (!onChanged) {
                            notificationService.cancelNotificationWithId(AppConstraints.fajrNotificationID);
                          }
                        },
                      ),
                      const Divider(indent: 16, endIndent: 16),
                      SwitchListTile.adaptive(
                        title: Text(appLocale.sunriseDuha),
                        value: notificationsState.sunriseNotification,
                        shape: AppStyles.mainShapeMicro,
                        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                        activeColor: appColors.quaternaryColor,
                        onChanged: (bool onChanged) {
                          notificationsState.setSunriseNotification = onChanged;
                          if (!onChanged) {
                            notificationService.cancelNotificationWithId(AppConstraints.sunriseNotificationID);
                          }
                        },
                      ),
                      const Divider(indent: 16, endIndent: 16),
                      SwitchListTile.adaptive(
                        title: Text(appLocale.dhuhr),
                        value: notificationsState.dhuhrNotification,
                        shape: AppStyles.mainShapeMicro,
                        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                        activeColor: appColors.quaternaryColor,
                        onChanged: (bool onChanged) {
                          notificationsState.setDhuhrNotification = onChanged;
                          if (!onChanged) {
                            notificationService.cancelNotificationWithId(AppConstraints.dhuhrNotificationID);
                          }
                        },
                      ),
                      const Divider(indent: 16, endIndent: 16),
                      SwitchListTile.adaptive(
                        title: Text(appLocale.asr),
                        value: notificationsState.asrNotification,
                        shape: AppStyles.mainShapeMicro,
                        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                        activeColor: appColors.quaternaryColor,
                        onChanged: (bool onChanged) {
                          notificationsState.setAsrNotification = onChanged;
                          if (!onChanged) {
                            notificationService.cancelNotificationWithId(AppConstraints.asrNotificationID);
                          }
                        },
                      ),
                      const Divider(indent: 16, endIndent: 16),
                      SwitchListTile.adaptive(
                        title: Text(appLocale.maghrib),
                        value: notificationsState.maghribNotification,
                        shape: AppStyles.mainShapeMicro,
                        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                        activeColor: appColors.quaternaryColor,
                        onChanged: (bool onChanged) {
                          notificationsState.setMaghribNotification = onChanged;
                          if (!onChanged) {
                            notificationService.cancelNotificationWithId(AppConstraints.maghribNotificationID);
                          }
                        },
                      ),
                      const Divider(indent: 16, endIndent: 16),
                      SwitchListTile.adaptive(
                        title: Text(appLocale.isha),
                        value: notificationsState.ishaNotification,
                        shape: AppStyles.bottomShapeMini,
                        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                        activeColor: appColors.quaternaryColor,
                        onChanged: (bool onChanged) {
                          notificationsState.setIshaNotification = onChanged;
                          if (!onChanged) {
                            notificationService.cancelNotificationWithId(AppConstraints.ishaNotificationID);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                appLocale.adhkarsNotifications,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Card(
                margin: EdgeInsets.zero,
                color: appColors.glass,
                child: Padding(
                  padding: AppStyles.mainMardingMicro,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SwitchListTile.adaptive(
                        title: Text(appLocale.morningAdhkars),
                        value: notificationsState.morningSupplicationsNotification,
                        shape: AppStyles.topShapeMini,
                        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                        activeColor: appColors.quaternaryColor,
                        onChanged: (bool onChanged) {
                          notificationsState.setMorningSupplicationsNotification = onChanged;
                          if (!onChanged) {
                            notificationService.cancelNotificationWithId(AppConstraints.morningSupplicationsNotificationID);
                          }
                        },
                      ),
                      const Divider(indent: 16, endIndent: 16),
                      SwitchListTile.adaptive(
                        title: Text(appLocale.eveningAdhkars),
                        value: notificationsState.eveningSupplicationsNotification,
                        shape: AppStyles.mainShapeMicro,
                        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                        activeColor: appColors.quaternaryColor,
                        onChanged: (bool onChanged) {
                          notificationsState.eveningSupplicationsNotification = onChanged;
                          if (!onChanged) {
                            notificationService.cancelNotificationWithId(AppConstraints.eveningSupplicationsNotificationID);
                          }
                        },
                      ),
                      const Divider(indent: 16, endIndent: 16),
                      SwitchListTile.adaptive(
                        title: Text(appLocale.nightAdhkars),
                        value: notificationsState.nightSupplicationsNotification,
                        shape: AppStyles.bottomShapeMini,
                        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                        activeColor: appColors.quaternaryColor,
                        onChanged: (bool onChanged) {
                          notificationsState.setNightSupplicationsNotification = onChanged;
                          if (!onChanged) {
                            notificationService.cancelNotificationWithId(AppConstraints.nightSupplicationsNotificationID);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                appLocale.fastNotifications,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Card(
                margin: EdgeInsets.zero,
                color: appColors.glass,
                child: Padding(
                  padding: AppStyles.mainMardingMicro,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SwitchListTile.adaptive(
                        title: Text(appLocale.fastMonday),
                        value: notificationsState.fastMondayNotification,
                        shape: AppStyles.topShapeMini,
                        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                        activeColor: appColors.quaternaryColor,
                        onChanged: (bool onChanged) {
                          notificationsState.setFastMondayNotification = onChanged;
                          if (!onChanged) {
                            notificationService.cancelNotificationWithId(AppConstraints.fastMondayNotificationID);
                          }
                        },
                      ),
                      const Divider(indent: 16, endIndent: 16),
                      SwitchListTile.adaptive(
                        title: Text(appLocale.fastThursday),
                        value: notificationsState.fastThursdayNotification,
                        shape: AppStyles.mainShapeMicro,
                        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                        activeColor: appColors.quaternaryColor,
                        onChanged: (bool onChanged) {
                          notificationsState.setFastThursdayNotification = onChanged;
                          if (!onChanged) {
                            notificationService.cancelNotificationWithId(AppConstraints.fastThursdayNotificationID);
                          }
                        },
                      ),
                      const Divider(indent: 16, endIndent: 16),
                      SwitchListTile.adaptive(
                        title: Text(appLocale.fastWhiteDays),
                        value: notificationsState.fastWhiteDaysNotification,
                        shape: AppStyles.bottomShapeMini,
                        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                        activeColor: appColors.quaternaryColor,
                        onChanged: (bool onChanged) {
                          notificationsState.setFastWhiteDaysNotification = onChanged;
                          if (!onChanged) {
                            notificationService.cancelNotificationWithId(AppConstraints.fastWhiteDaysNotificationID);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                appLocale.fridayNotifications,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Card(
                margin: EdgeInsets.zero,
                color: appColors.glass,
                child: Padding(
                  padding: AppStyles.mainMardingMicro,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SwitchListTile.adaptive(
                        title: Text(appLocale.friday),
                        value: notificationsState.fridayNotification,
                        shape: AppStyles.topShapeMini,
                        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                        activeColor: appColors.quaternaryColor,
                        onChanged: (bool onChanged) {
                          notificationsState.setFridayNotification = onChanged;
                          if (!onChanged) {
                            notificationService.cancelNotificationWithId(AppConstraints.fridayNotificationID);
                          }
                        },
                      ),
                      const Divider(indent: 16, endIndent: 16),
                      SwitchListTile.adaptive(
                        title: Text(appLocale.lastHourFriday),
                        value: notificationsState.lastHourFridayNotification,
                        shape: AppStyles.bottomShapeMini,
                        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                        activeColor: appColors.quaternaryColor,
                        onChanged: (bool onChanged) {
                          notificationsState.setLastHourFridayNotification = onChanged;
                          if (!onChanged) {
                            notificationService.cancelNotificationWithId(AppConstraints.lastHourFridayNotificationID);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
