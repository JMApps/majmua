import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/application/state/main_notifications_state.dart';
import 'package:majmua/application/state/prayer_time_state.dart';
import 'package:majmua/application/state/rest_time_state.dart';
import 'package:majmua/application/strings/app_constants.dart';
import 'package:majmua/presentation/pages/root_page.dart';
import 'package:provider/provider.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  await Hive.initFlutter();
  await Hive.openBox(AppConstants.keyWeeklySalawatSettings);
  await Hive.openBox(AppConstants.keySettingsPrayerTimeBox);
  await Hive.openBox(AppConstants.keyMainAppSettings);
  await Hive.openBox(AppConstants.keyMainNotificationsSettings);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<RestTimeState>(
          create: (_) => RestTimeState(),
        ),
        ChangeNotifierProvider<PrayerTimeState>(
          create: (_) => PrayerTimeState(),
        ),
        ChangeNotifierProvider<MainNotificationsSate>(
          create: (_) => MainNotificationsSate(),
        ),
      ],
      child: const RootPage(),
    ),
  );
}
