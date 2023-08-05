import 'package:flutter/material.dart';
import 'package:majmua/application/state/main_settings_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:provider/provider.dart';

class AppSettingsPage extends StatelessWidget {
  const AppSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            elevation: 0,
            centerTitle: true,
            floating: true,
            title: Text(
              AppString.settings,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: AppWidgetStyle.verticalPadding,
              child: Consumer<MainSettingsState>(
                builder: (BuildContext context, notificationState, _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding: AppWidgetStyle.horizontalPadding,
                        child: Text(
                          AppString.notifications,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Card(
                        margin: AppWidgetStyle.mainMargin,
                        color: appColors.mainReverse,
                        child: Padding(
                          padding: AppWidgetStyle.verticalPadding,
                          child: Wrap(
                            children: [
                              SwitchListTile.adaptive(
                                activeColor: appColors.thirdAppColor,
                                visualDensity: const VisualDensity(vertical: -4),
                                title: const Text(AppString.fajr),
                                value: notificationState.getFajrNotification,
                                onChanged: (bool? value) {
                                  notificationState.setFajrNotification = value!;
                                },
                              ),
                              const Divider(indent: 16, endIndent: 16),
                              SwitchListTile.adaptive(
                                activeColor: appColors.thirdAppColor,
                                visualDensity: const VisualDensity(vertical: -4),
                                title: const Text(AppString.sunrise),
                                value: notificationState.getSunriseNotification,
                                onChanged: (bool? value) {
                                  notificationState.setSunriseNotification = value!;
                                },
                              ),
                              const Divider(indent: 16, endIndent: 16),
                              SwitchListTile.adaptive(
                                activeColor: appColors.thirdAppColor,
                                visualDensity: const VisualDensity(vertical: -4),
                                title: const Text(AppString.dhuhr),
                                value: notificationState.getDhuhrNotification,
                                onChanged: (bool? value) {
                                  notificationState.setDhuhrNotification = value!;
                                },
                              ),
                              const Divider(indent: 16, endIndent: 16),
                              SwitchListTile.adaptive(
                                activeColor: appColors.thirdAppColor,
                                visualDensity: const VisualDensity(vertical: -4),
                                title: const Text(AppString.asr),
                                value: notificationState.getAsrNotification,
                                onChanged: (bool? value) {
                                  notificationState.setAsrNotification = value!;
                                },
                              ),
                              const Divider(indent: 16, endIndent: 16),
                              SwitchListTile.adaptive(
                                activeColor: appColors.thirdAppColor,
                                visualDensity: const VisualDensity(vertical: -4),
                                title: const Text(AppString.maghrib),
                                value: notificationState.getMaghribNotification,
                                onChanged: (bool? value) {
                                  notificationState.setMaghribNotification = value!;
                                },
                              ),
                              const Divider(indent: 16, endIndent: 16),
                              SwitchListTile.adaptive(
                                activeColor: appColors.thirdAppColor,
                                visualDensity: const VisualDensity(vertical: -4),
                                title: const Text(AppString.isha),
                                value: notificationState.getIshaNotification,
                                onChanged: (bool? value) {
                                  notificationState.setIshaNotification = value!;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        margin: AppWidgetStyle.horizontalMargin,
                        color: appColors.mainReverse,
                        child: Padding(
                          padding: AppWidgetStyle.verticalPadding,
                          child: Wrap(
                            children: [
                              SwitchListTile.adaptive(
                                activeColor: appColors.thirdAppColor,
                                visualDensity: const VisualDensity(vertical: -4),
                                title: const Text(AppString.morningNotification),
                                value: notificationState.getMorningNSupplicationsNotification,
                                onChanged: (bool? value) {
                                  notificationState.setMorningSupplicationsNotification = value!;
                                },
                              ),
                              const Divider(indent: 16, endIndent: 16),
                              SwitchListTile.adaptive(
                                activeColor: appColors.thirdAppColor,
                                visualDensity: const VisualDensity(vertical: -4),
                                title: const Text(AppString.eveningNotification),
                                value: notificationState.getEveningSupplicationsNotification,
                                onChanged: (bool? value) {
                                  notificationState.setEveningSupplicationsNotification = value!;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Card(
                        margin: AppWidgetStyle.horizontalMargin,
                        color: appColors.mainReverse,
                        child: Padding(
                          padding: AppWidgetStyle.verticalPadding,
                          child: Wrap(
                            children: [
                              SwitchListTile.adaptive(
                                activeColor: appColors.thirdAppColor,
                                visualDensity: const VisualDensity(vertical: -4),
                                title: const Text(AppString.firstFastNotif),
                                value: notificationState.getFastMondayNotification,
                                onChanged: (bool? value) {
                                  notificationState.setFastMondayNotification = value!;
                                },
                              ),
                              const Divider(indent: 16, endIndent: 16),
                              SwitchListTile.adaptive(
                                activeColor: appColors.thirdAppColor,
                                visualDensity: const VisualDensity(vertical: -4),
                                title: const Text(AppString.secondFastNotif),
                                value: notificationState.getFastThursdayNotification,
                                onChanged: (bool? value) {
                                  notificationState.setFastThursdayNotification = value!;
                                },
                              ),
                              // const Divider(indent: 16, endIndent: 16),
                              // SwitchListTile.adaptive(
                              //   activeColor: appColors.thirdAppColor,
                              //   visualDensity: const VisualDensity(vertical: -4),
                              //   title: const Text(AppString.whiteDaysNotif),
                              //   value: notificationState.getFastWhiteDaysNotification,
                              //   onChanged: (bool? value) {
                              //     notificationState.setFastWhiteDaysNotification = value!;
                              //   },
                              // ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Padding(
                        padding: AppWidgetStyle.horizontalPadding,
                        child: Text(
                          AppString.appTheme,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Card(
                        margin: AppWidgetStyle.mainMargin,
                        color: appColors.mainReverse,
                        child: Padding(
                          padding: AppWidgetStyle.verticalPadding,
                          child: Wrap(
                            children: [
                              SwitchListTile.adaptive(
                                activeColor: appColors.thirdAppColor,
                                visualDensity: const VisualDensity(vertical: -4),
                                title: const Text(AppString.adaptiveTheme),
                                value: notificationState.getIsAdaptiveTheme,
                                onChanged: (bool? value) {
                                  notificationState.setAdaptiveTheme = value!;
                                },
                              ),
                              const Divider(indent: 16, endIndent: 16),
                              SwitchListTile.adaptive(
                                activeColor: appColors.thirdAppColor,
                                visualDensity: const VisualDensity(vertical: -4),
                                title: const Text(AppString.userTheme),
                                value: notificationState.getIsUserTheme,
                                onChanged: !notificationState.getIsAdaptiveTheme ? (bool? value) {
                                  notificationState.setUserTheme = value!;
                                } : null,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: AppWidgetStyle.horizontalPadding,
                        child: Text(
                          AppString.display,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Card(
                        margin: AppWidgetStyle.mainMargin,
                        color: appColors.mainReverse,
                        child: Padding(
                          padding: AppWidgetStyle.verticalPadding,
                          child: Wrap(
                            children: [
                              SwitchListTile.adaptive(
                                activeColor: appColors.thirdAppColor,
                                visualDensity: const VisualDensity(vertical: -4),
                                title: const Text(AppString.displayOnOff),
                                value: notificationState.getIsWakeLock,
                                onChanged: (bool? value) {
                                  notificationState.setWakeLockTheme = value!;
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
        ],
      ),
    );
  }
}
