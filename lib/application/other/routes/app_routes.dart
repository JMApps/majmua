import 'package:flutter/material.dart';
import 'package:majmua/presentation/prayerTime/selectCountry/select_another_city_page.dart';
import 'package:majmua/presentation/prayerTime/selectCountry/select_country_page.dart';

class AppRoutes {
  static Route onGeneratorRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case 'select_country_page':
        return MaterialPageRoute(
          builder: (_) => const SelectCountryPage(),
        );
      case 'select_another_city_page':
        return MaterialPageRoute(
          builder: (_) => const SelectAnotherCityPage(),
        );
      default:
        throw Exception('Invalid route: ${routeSettings.name}');
    }
  }
}
