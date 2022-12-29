import 'package:flutter/material.dart';
import 'package:majmua/presentation/fortress/evening_supplications_page.dart';
import 'package:majmua/presentation/fortress/morning_supplications_page.dart';
import 'package:majmua/presentation/fortress/night_supplications_page.dart';
import 'package:majmua/presentation/library/hadeeth/hadeeth_page.dart';
import 'package:majmua/presentation/library/lessons/lessons_ramadan_page.dart';
import 'package:majmua/presentation/library/library_page.dart';
import 'package:majmua/presentation/library/namesOf/names_of_page.dart';
import 'package:majmua/presentation/library/questions/questions_page.dart';
import 'package:majmua/presentation/library/raqaiq/raqaiq_page.dart';
import 'package:majmua/presentation/pages/page_library.dart';
import 'package:majmua/presentation/prayerTime/prayer_settings.dart';
import 'package:majmua/presentation/quran/surah_mulk_page.dart';
import 'package:majmua/presentation/quran/surah_qahf_page.dart';
import 'package:majmua/presentation/quran/surah_sajdah_page.dart';
import 'package:majmua/presentation/supplicationsQuran/sfq_page.dart';

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
      case 'evening_supplications_page':
        return MaterialPageRoute(
          builder: (_) => const EveningSupplicationsPage(),
        );
      case 'night_supplications_page':
        return MaterialPageRoute(
          builder: (_) => const NightSupplicationsPage(),
        );
      case 'surah_qahf_page':
        return MaterialPageRoute(
          builder: (_) => const SurahQahfPage(),
        );
      case 'surah_sajdah_page':
        return MaterialPageRoute(
          builder: (_) => const SurahSajdahPage(),
        );
      case 'surah_mulk_page':
        return MaterialPageRoute(
          builder: (_) => const SurahMulkPage(),
        );
      case 'sfq_page':
        return MaterialPageRoute(
          builder: (_) => const SfqPage(),
        );
      case 'library_page':
        return MaterialPageRoute(
          builder: (_) => const LibraryPage(),
        );
      case 'names_of_page':
        return MaterialPageRoute(
          builder: (_) => const NamesOfPage(),
        );
      case 'questions_page':
        return MaterialPageRoute(
          builder: (_) => const QuestionsPage(),
        );
      case 'hadeeth_page':
        return MaterialPageRoute(
          builder: (_) => const HadeethPage(),
        );
      case 'lessons_ramadan_page':
        return MaterialPageRoute(
          builder: (_) => const LessonsRamadanPage(),
        );
      case 'raqaiq_page':
        return MaterialPageRoute(
          builder: (_) => const RaqaiqPage(),
        );
      default:
        throw Exception(
          'Invalid route ${routeSettings.name}',
        );
    }
  }
}
