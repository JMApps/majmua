import 'package:flutter/material.dart';
import 'package:majmua/data/database/arguments/lessons_ramadan_arguments.dart';
import 'package:majmua/data/database/arguments/supplication_arguments.dart';
import 'package:majmua/data/database/arguments/surah_arguments.dart';
import 'package:majmua/presentation/library/hadeeth/hadeeth_page.dart';
import 'package:majmua/presentation/library/lessons/lessons_ramadan_page.dart';
import 'package:majmua/presentation/library/lessons/lessons_ramadan_select_page.dart';
import 'package:majmua/presentation/library/namesOf/names_of_page.dart';
import 'package:majmua/presentation/library/questions/questions_page.dart';
import 'package:majmua/presentation/library/raqaiq/raqaiq_page.dart';
import 'package:majmua/presentation/counter/app_counter_page.dart';
import 'package:majmua/presentation/prayerTime/addCountry/add_country_page.dart';
import 'package:majmua/presentation/prayerTime/calculationInfo/prayer_calculation_method_page.dart';
import 'package:majmua/presentation/prayerTime/prayerParams/prayer_params_page.dart';
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
      case 'app_counter_page':
        return MaterialPageRoute(
          builder: (_) => const AppCounterPage(),
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
      case 'book_hadeeth_page':
        return MaterialPageRoute(
          builder: (_) => const HadeethPage(),
        );
      case 'book_lessons_ramadan_page':
        return MaterialPageRoute(
          builder: (_) => const LessonsRamadanPage(),
        );
      case 'book_lessons_ramadan_select_page':
        final LessonsRamadanArguments lessonsRamadanArguments = routeSettings.arguments as LessonsRamadanArguments;
        return MaterialPageRoute(
          builder: (_) => LessonsRamadanSelectPage(selectPage: lessonsRamadanArguments.selectPage),
        );
      case 'book_the_names_of_page':
        return MaterialPageRoute(
          builder: (_) => const NamesOfPage(),
        );
      case 'book_questions_page':
        return MaterialPageRoute(
          builder: (_) => const QuestionsPage(),
        );
      case 'book_raqaiq_page':
        return MaterialPageRoute(
          builder: (_) => const RaqaiqPage(),
        );
      default:
        throw Exception('Invalid route: ${routeSettings.name}');
    }
  }
}
