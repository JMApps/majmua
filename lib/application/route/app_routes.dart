import 'package:flutter/material.dart';
import 'package:majmua/presentation/pages/page_library.dart';
import 'package:majmua/presentation/prayerTime/prayer_settings.dart';

class AppRoutes {
  static Route appGeneratorRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case 'page_library':
        return MaterialPageRoute(
          builder: (_) => const PageLibrary(),
        );
      case 'region_settings_page':
        // final ArgumentsCountySettings argumentsCountySettings =
        //     routeSettings.arguments as ArgumentsCountySettings;
        return MaterialPageRoute(
          builder: (_) => const RegionSettings(),
        );
      default:
        throw Exception(
          'Invalid route ${routeSettings.name}',
        );
    }
  }
}
