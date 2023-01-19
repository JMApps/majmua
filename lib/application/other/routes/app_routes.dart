import 'package:flutter/material.dart';
import 'package:majmua/presentation/prayerTime/addCountry/add_country_page.dart';
import 'package:majmua/presentation/prayerTime/prayerParams/prayer_params_page.dart';
import 'package:majmua/presentation/prayerTime/selectCountry/select_another_city_page.dart';

class AppRoutes {
  static Route onGeneratorRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case 'prayer_params_page':
        return MaterialPageRoute(
          builder: (_) => const PrayerParamsPage(),
        );
      case 'select_another_city_page':
        return MaterialPageRoute(
          builder: (_) => const SelectAnotherCityPage(),
        );
      case 'add_country_page':
        return MaterialPageRoute(
          builder: (_) => const AddCountryPage(),
        );
      default:
        throw Exception('Invalid route: ${routeSettings.name}');
    }
  }
}
