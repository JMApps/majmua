import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'core/strings/app_string_constraints.dart';
import 'presentation/pages/root_page.dart';
import 'presentation/state/app_settings_state.dart';
import 'presentation/state/prayer_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox(AppStringConstraints.keyMainSettings);
  await Hive.openBox(AppStringConstraints.keyMainAppSettings);
  await Hive.openBox(AppStringConstraints.keySettingsPrayerTimeBox);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppSettingsState(),
        ),
        ChangeNotifierProvider(
          create: (_) => PrayerState(Hive.box(AppStringConstraints.keySettingsPrayerTimeBox)),
        ),
      ],
      child: const RootPage(),
    ),
  );
}
