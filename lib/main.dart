import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/core/strings/app_constraints.dart';
import 'package:majmua/presentation/pages/root_page.dart';
import 'package:majmua/presentation/state/adhan_time_state.dart';
import 'package:majmua/presentation/state/main_app_state.dart';
import 'package:majmua/presentation/state/rest_time_state.dart';
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
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainAppState(),
        ),
        ChangeNotifierProvider(
          create: (_) => RestTimeState(),
        ),
        ChangeNotifierProvider(
          create: (_) => AdhanTimeState(),
        ),
      ],
      child: const RootPage(),
    ),
  );
}
