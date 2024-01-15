import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'core/strings/app_constraints.dart';
import 'data/services/notification_service.dart';
import 'presentation/pages/root_page.dart';
import 'presentation/state/adhan_time_state.dart';
import 'presentation/state/app_settings_state.dart';
import 'presentation/state/book_settings_state.dart';
import 'presentation/state/notifications_state.dart';
import 'presentation/state/rest_time_state.dart';
import 'presentation/state/salawat_counter_state.dart';
import 'presentation/state/surah_settings_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
  }
  await Hive.initFlutter();
  await Hive.openBox(AppConstraints.keySettingsPrayerTimeBox);
  await NotificationService().setupNotification();
  await Hive.openBox(AppConstraints.keyMainSettings);
  await Hive.openBox(AppConstraints.keyMainAppSettings);
  await Hive.openBox(AppConstraints.keyWeeklySalawatSettings);
  await Hive.openBox(AppConstraints.keyMainCounter);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppSettingsState(),
        ),
        ChangeNotifierProvider(
          create: (_) => AdhanTimeState(),
        ),
        ChangeNotifierProvider(
          create: (_) => RestTimeState(),
        ),
        ChangeNotifierProvider(
          create: (_) => SalawatCounterState(),
        ),
        ChangeNotifierProvider(
          create: (_) => NotificationsState(),
        ),
        ChangeNotifierProvider(
          create: (_) => SurahSettingsState(),
        ),
        ChangeNotifierProvider(
          create: (_) => BookSettingsState(),
        ),
      ],
      child: const RootPage(),
    ),
  );
}
