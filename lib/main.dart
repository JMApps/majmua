import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/application/strings/app_constants.dart';
import 'package:majmua/presentation/pages/root_page.dart';

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
  runApp(
    const RootPage(),
  );
}
