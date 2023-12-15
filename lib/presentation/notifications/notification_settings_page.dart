import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/state/notifications_state.dart';
import 'package:majmua/presentation/widgets/user_back_button.dart';
import 'package:provider/provider.dart';

class NotificationSettingsPage extends StatelessWidget {
  const NotificationSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocale!.notifications),
        leading: const UserBackButton(),
      ),
      body: SingleChildScrollView(
        child: CupertinoScrollbar(
          child: Consumer<NotificationsState>(
            builder: (BuildContext context, NotificationsState notificationsState, _) {
              return ListView(
                padding: AppStyles.mainMardingMini,
                children: [
                  Text(
                    appLocale.prayerNotifications,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Card(
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: AppStyles.mainMardingMini,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SwitchListTile.adaptive(
                            title: Text(appLocale.fajr),
                            value: notificationsState.fajrNotification,
                            shape: AppStyles.topShapeMini,
                            activeTrackColor: appColors.quaternaryColor,
                            onChanged: (bool onChanged) {
                              notificationsState.setFajrNotification = onChanged;
                            },
                          ),
                          SwitchListTile.adaptive(
                            title: Text(appLocale.sunriseDuha),
                            value: notificationsState.sunriseNotification,
                            shape: AppStyles.mainShapeMini,
                            activeTrackColor: appColors.quaternaryColor,
                            onChanged: (bool onChanged) {
                              notificationsState.setSunriseNotification = onChanged;
                            },
                          ),
                          SwitchListTile.adaptive(
                            title: Text(appLocale.dhuhr),
                            value: notificationsState.dhuhrNotification,
                            shape: AppStyles.mainShapeMini,
                            activeTrackColor: appColors.quaternaryColor,
                            onChanged: (bool onChanged) {
                              notificationsState.setDhuhrNotification = onChanged;
                            },
                          ),
                          SwitchListTile.adaptive(
                            title: Text(appLocale.asr),
                            value: notificationsState.asrNotification,
                            shape: AppStyles.mainShapeMini,
                            activeTrackColor: appColors.quaternaryColor,
                            onChanged: (bool onChanged) {
                              notificationsState.setAsrNotification = onChanged;
                            },
                          ),
                          SwitchListTile.adaptive(
                            title: Text(appLocale.maghrib),
                            value: notificationsState.maghribNotification,
                            shape: AppStyles.mainShapeMini,
                            activeTrackColor: appColors.quaternaryColor,
                            onChanged: (bool onChanged) {
                              notificationsState.setMaghribNotification = onChanged;
                            },
                          ),
                          SwitchListTile.adaptive(
                            title: Text(appLocale.isha),
                            value: notificationsState.ishaNotification,
                            shape: AppStyles.bottomShapeMini,
                            activeTrackColor: appColors.quaternaryColor,
                            onChanged: (bool onChanged) {
                              notificationsState.setIshaNotification = onChanged;
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
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Card(
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: AppStyles.mainMardingMini,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SwitchListTile.adaptive(
                            title: Text(appLocale.morningAdhkars),
                            value: notificationsState.morningSupplicationsNotification,
                            shape: AppStyles.topShapeMini,
                            activeTrackColor: appColors.quaternaryColor,
                            onChanged: (bool onChanged) {
                              notificationsState.morningSupplicationsNotification = onChanged;
                            },
                          ),
                          SwitchListTile.adaptive(
                            title: Text(appLocale.eveningAdhkars),
                            value: notificationsState.eveningSupplicationsNotification,
                            shape: AppStyles.mainShapeMini,
                            activeTrackColor: appColors.quaternaryColor,
                            onChanged: (bool onChanged) {
                              notificationsState.eveningSupplicationsNotification = onChanged;
                            },
                          ),
                          SwitchListTile.adaptive(
                            title: Text(appLocale.nightAdhkars),
                            value: notificationsState.nightSupplicationsNotification,
                            shape: AppStyles.bottomShapeMini,
                            activeTrackColor: appColors.quaternaryColor,
                            onChanged: (bool onChanged) {
                              notificationsState.nightSupplicationsNotification = onChanged;
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
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Card(
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: AppStyles.mainMardingMini,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SwitchListTile.adaptive(
                            title: Text(appLocale.fastMonday),
                            value: notificationsState.fastMondayNotification,
                            shape: AppStyles.topShapeMini,
                            activeTrackColor: appColors.quaternaryColor,
                            onChanged: (bool onChanged) {
                              notificationsState.fastMondayNotification = onChanged;
                            },
                          ),
                          SwitchListTile.adaptive(
                            title: Text(appLocale.fastThursday),
                            value: notificationsState.fastThursdayNotification,
                            shape: AppStyles.mainShapeMini,
                            activeTrackColor: appColors.quaternaryColor,
                            onChanged: (bool onChanged) {
                              notificationsState.fastThursdayNotification = onChanged;
                            },
                          ),
                          SwitchListTile.adaptive(
                            title: Text(appLocale.fastWhiteDays),
                            value: notificationsState.fastWhiteDaysNotification,
                            shape: AppStyles.bottomShapeMini,
                            activeTrackColor: appColors.quaternaryColor,
                            onChanged: (bool onChanged) {
                              notificationsState.fastWhiteDaysNotification = onChanged;
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
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Card(
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: AppStyles.mainMardingMini,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SwitchListTile.adaptive(
                            title: Text(appLocale.friday),
                            value: notificationsState.fridayNotification,
                            shape: AppStyles.topShapeMini,
                            activeTrackColor: appColors.quaternaryColor,
                            onChanged: (bool onChanged) {
                              notificationsState.fridayNotification = onChanged;
                            },
                          ),
                          SwitchListTile.adaptive(
                            title: Text(appLocale.lastHourFriday),
                            value: notificationsState.lastHourFridayNotification,
                            shape: AppStyles.bottomShapeMini,
                            activeTrackColor: appColors.quaternaryColor,
                            onChanged: (bool onChanged) {
                              notificationsState.lastHourFridayNotification = onChanged;
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
        ),
      ),
    );
  }
}
