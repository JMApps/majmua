import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/application/constants/app_constants.dart';
import 'package:majmua/application/root_page.dart';
import 'package:majmua/application/state/country_coordinates_state.dart';
import 'package:provider/provider.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  await Hive.initFlutter();
  await Hive.openBox(AppConstants.keySettingsPrayerTimeBox);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CountryCoordinatesState>(
          create: (_) => CountryCoordinatesState(),
        ),
      ],
      child: const RootPage(),
    ),
  );
}
