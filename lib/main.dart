import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/application/notification/app_notification_service.dart';
import 'package:majmua/application/state/main_settings_state.dart';
import 'package:majmua/application/state/prayer_time_state.dart';
import 'package:majmua/application/state/rest_time_state.dart';
import 'package:majmua/application/state/text_settings_state.dart';
import 'package:majmua/application/strings/app_constants.dart';
import 'package:majmua/data/database/services/default_countries_database_helper.dart';
import 'package:majmua/presentation/pages/root_page.dart';
import 'package:provider/provider.dart';

void main() async {
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
  }
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(AppConstants.keyMainSettings);
  await Hive.openBox(AppConstants.keyMainAppSettings);
  await Hive.openBox(AppConstants.keyWeeklySalawatSettings);
  await Hive.openBox(AppConstants.keySettingsPrayerTimeBox);
  await Hive.openBox(AppConstants.keyMainCounter);
  await DefaultCountriesDatabaseHelper().initializeDatabase();
  await AppNotificationService().setupNotification();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MainSettingsState>(
          create: (_) => MainSettingsState(),
        ),
        ChangeNotifierProvider(
          create: (_) => TextSettingsState(),
        ),
        ChangeNotifierProvider<RestTimeState>(
          create: (_) => RestTimeState(),
        ),
        ChangeNotifierProvider<PrayerTimeState>(
          create: (_) => PrayerTimeState(),
        ),
      ],
      child: const RootPage(),
    ),
  );
}
