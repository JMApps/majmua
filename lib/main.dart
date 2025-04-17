import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'core/strings/app_string_constraints.dart';
import 'data/services/notification/notification_service.dart';
import 'presentation/pages/root_page.dart';
import 'presentation/state/app_settings_state.dart';
import 'presentation/state/notifications_state.dart';
import 'presentation/state/prayer_state.dart';
import 'presentation/state/salawat_state.dart';
import 'presentation/state/time_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox(AppStringConstraints.keyMainSettings);
  await Hive.openBox(AppStringConstraints.keyMainScrollStatesBox);
  await Hive.openBox(AppStringConstraints.keyMainAppSettings);
  await Hive.openBox(AppStringConstraints.keySettingsPrayerTimeBox);
  await Hive.openBox(AppStringConstraints.keyMainCounter);
  await Hive.openBox(AppStringConstraints.keyWeeklySalawatSettings);

  NotificationService notificationService = NotificationService();
  await notificationService.setupNotification();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppSettingsState(),
        ),
        ChangeNotifierProvider(
          create: (_) => PrayerState(
            Hive.box(AppStringConstraints.keySettingsPrayerTimeBox),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => TimeState(),
        ),
        ChangeNotifierProvider(
          create: (_) => NotificationsState(
            Hive.box(AppStringConstraints.keyMainSettings),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => SalawatState(),
        ),
      ],
      child: const RootPage(),
    ),
  );
}
