import 'package:flutter/material.dart';
import 'package:majmua/presentation/fortress/morning_supplications_page.dart';
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
        return MaterialPageRoute(
          builder: (_) => const RegionSettings(),
        );
      case 'morning_supplications_page':
        return MaterialPageRoute(
          builder: (_) => const MorningSupplicationsPage(),
        );
      default:
        throw Exception(
          'Invalid route ${routeSettings.name}',
        );
    }
  }
}
