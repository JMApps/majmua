import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/core/strings/app_constraints.dart';
import 'package:majmua/data/services/notification_service.dart';
import 'package:majmua/presentation/pages/root_page.dart';
import 'package:majmua/presentation/state/adhan_time_state.dart';
import 'package:majmua/presentation/state/app_settings_state.dart';
import 'package:majmua/presentation/state/notifications_state.dart';
import 'package:majmua/presentation/state/rest_time_state.dart';
import 'package:majmua/presentation/state/salawat_counter_state.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
  }
  await Hive.initFlutter();
  await Hive.openBox(AppConstraints.keyMainSettings);
  await Hive.openBox(AppConstraints.keyMainAppSettings);
  await Hive.openBox(AppConstraints.keyWeeklySalawatSettings);
  await Hive.openBox(AppConstraints.keySettingsPrayerTimeBox);
  await Hive.openBox(AppConstraints.keyMainCounter);
  NotificationService().setupNotification();
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
      ],
      child: const RootPage(),
    ),
  );
}
