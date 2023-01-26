import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';

class AppSettingsPage extends StatelessWidget {
  const AppSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            elevation: 0,
            centerTitle: true,
            pinned: false,
            floating: false,
            title: Text(
              AppString.settings,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: AppWidgetStyle.verticalPadding,
              child: Column(
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
                  const Divider(indent: 16, endIndent: 16),
                  SwitchListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    title: const Text(AppString.dailyNotif),
                    value: true,
                    onChanged: (bool? value) {},
                  ),
                  const Divider(indent: 16, endIndent: 16),
                  SwitchListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    title: const Text(AppString.firstFastNotif),
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  const Divider(indent: 16, endIndent: 16),
                  SwitchListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    title: const Text(AppString.secondFastNotif),
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  const Divider(indent: 16, endIndent: 16),
                  SwitchListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    title: const Text(AppString.whiteDaysNotif),
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  const Divider(indent: 16, endIndent: 16),
                  const Padding(
                    padding: AppWidgetStyle.horizontalPadding,
                    child: Text(
                      AppString.prayersNotification,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(indent: 16, endIndent: 16),
                  SwitchListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    title: const Text(AppString.fajr),
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  const Divider(indent: 16, endIndent: 16),
                  SwitchListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    title: const Text(AppString.sunrise),
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  const Divider(indent: 16, endIndent: 16),
                  SwitchListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    title: const Text(AppString.dhuhr),
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  const Divider(indent: 16, endIndent: 16),
                  SwitchListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    title: const Text(AppString.asr),
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  const Divider(indent: 16, endIndent: 16),
                  SwitchListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    title: const Text(AppString.maghrib),
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  const Divider(indent: 16, endIndent: 16),
                  SwitchListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    title: const Text(AppString.isha),
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  const Divider(indent: 16, endIndent: 16),
                  const Padding(
                    padding: EdgeInsets.only(right: 16, top: 16, left: 16),
                    child: Text(
                      AppString.appTheme,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(indent: 16, endIndent: 16),
                  SwitchListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    title: const Text(AppString.adaptiveTheme),
                    value: true,
                    onChanged: (bool? value) {},
                  ),
                  const Divider(indent: 16, endIndent: 16),
                  SwitchListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    title: const Text(AppString.userTheme),
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  const Divider(indent: 16, endIndent: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
