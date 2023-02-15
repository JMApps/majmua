import 'package:flutter/material.dart';
import 'package:majmua/data/database/arguments/supplication_arguments.dart';
import 'package:majmua/data/database/arguments/surah_arguments.dart';
import 'package:majmua/presentation/prayerTime/addCountry/add_country_page.dart';
import 'package:majmua/presentation/prayerTime/prayerParams/prayer_params_page.dart';
import 'package:majmua/presentation/prayerTime/calculationInfo/prayer_calculation_method_page.dart';
import 'package:majmua/presentation/prayerTime/selectCountry/select_another_city_page.dart';
import 'package:majmua/presentation/settings/app_settings_page.dart';
import 'package:majmua/presentation/sfq/page/sfq_page.dart';
import 'package:majmua/presentation/supplications/page/supplications_page.dart';
import 'package:majmua/presentation/surah/page/surah_page.dart';

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
      case 'prayer_calculation_method_page':
        return MaterialPageRoute(
          builder: (_) => const PrayerCalculationMethodPage(),
        );
      case 'app_settings_page':
        return MaterialPageRoute(
          builder: (_) => const AppSettingsPage(),
        );
      case 'supplications_page':
        final SupplicationArguments supplicationArguments = routeSettings.arguments as SupplicationArguments;
        return MaterialPageRoute(
          builder: (_) => SupplicationsPage(supplicationIndex: supplicationArguments.supplicationIndex),
        );
      case 'sfq_page':
        return MaterialPageRoute(
          builder: (_) => const SfqPage(),
        );
      case 'surah_page':
        final SurahArguments surahArguments = routeSettings.arguments as SurahArguments;
        return MaterialPageRoute(
          builder: (_) => SurahPage(surahIndex: surahArguments.surahIndex,),
        );
      default:
        throw Exception('Invalid route: ${routeSettings.name}');
    }
  }
}
