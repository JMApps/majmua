import 'package:flutter/material.dart';
import 'package:majmua/presentation/library/strength/strength_page.dart';

import '../../data/models/args/supplication_args.dart';
import '../../data/models/args/surah_args.dart';
import '../../presentation/adhanTimes/params/addCity/add_city_page.dart';
import '../../presentation/adhanTimes/params/adhan_params_page.dart';
import '../../presentation/adhanTimes/params/adjustmentTime/adjustment_time_page.dart';
import '../../presentation/adhanTimes/params/calculation_info_page.dart';
import '../../presentation/adhanTimes/params/selectCity/select_city_page.dart';
import '../../presentation/counter/app_counter_page.dart';
import '../../presentation/fortress/fortress_chapters_page.dart';
import '../../presentation/fortress/fortress_content_page.dart';
import '../../presentation/gems/gems_page.dart';
import '../../presentation/library/hadeeths/hadeeths_page.dart';
import '../../presentation/library/lessons/lessons_page.dart';
import '../../presentation/library/namesOf/names_of_page.dart';
import '../../presentation/library/questions/questions_page.dart';
import '../../presentation/library/raqaiq/raqaiq_page.dart';
import '../../presentation/notifications/notification_settings_page.dart';
import '../../presentation/settings/app_settings_page.dart';
import '../../presentation/sfq/sfq_page.dart';
import '../../presentation/surah/surahs_page.dart';
import 'route_names.dart';

class AppRoutes {
  static Route onGeneratorRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.notificationParamsPage:
        return MaterialPageRoute(
          builder: (_) => const NotificationSettingsPage(),
        );
      case RouteNames.appSettingsPage:
        return MaterialPageRoute(
          builder: (_) => const AppSettingsPage(),
        );
      case RouteNames.adhanParamsPage:
        return MaterialPageRoute(
          builder: (_) => const AdhanParamsPage(),
        );
      case RouteNames.selectCityPage:
        return MaterialPageRoute(
          builder: (_) => const SelectCityPage(),
        );
      case RouteNames.addCityPage:
        return MaterialPageRoute(
          builder: (_) => const AddCityPage(),
        );
      case RouteNames.prayerTimeAdjustmentPage:
        return MaterialPageRoute(
          builder: (_) => const AdjustmentTimePage(),
        );
      case RouteNames.informationPage:
        return MaterialPageRoute(
          builder: (_) => const CalculationInfoPage(),
        );
      case RouteNames.appCounterPage:
        return MaterialPageRoute(
          builder: (_) => const AppCounterPage(),
        );
      case RouteNames.fortressChaptersPage:
        return MaterialPageRoute(
          builder: (_) => const FortressChaptersPage(),
        );
      case RouteNames.fortressContentPage:
        final SupplicationArgs args = routeSettings.arguments as SupplicationArgs;
        return MaterialPageRoute(
          builder: (_) => FortressContentPage(chapterId: args.chapterId),
        );
      case RouteNames.surahsPage:
        final SurahArgs args = routeSettings.arguments as SurahArgs;
        return MaterialPageRoute(
          builder: (_) => SurahsPage(surahNumber: args.surahNumber, surahName: args.surahName),
        );
      case RouteNames.sfqPage:
        return MaterialPageRoute(
          builder: (_) => const SFQPage(),
        );
      case RouteNames.gemsPage:
        return MaterialPageRoute(
          builder: (_) => const GemsPage(),
        );
      case RouteNames.namesOfPage:
        return MaterialPageRoute(
          builder: (_) => const NamesOfPage(),
        );
      case RouteNames.questionsPage:
        return MaterialPageRoute(
          builder: (_) => const QuestionsPage(),
        );
      case RouteNames.hadeethsPage:
        return MaterialPageRoute(
          builder: (_) => const HadeethsPage(),
        );
      case RouteNames.lessonsPage:
        return MaterialPageRoute(
          builder: (_) => const LessonsPage(),
        );
      case RouteNames.raqaiqPage:
        return MaterialPageRoute(
          builder: (_) => const RaqaiqPage(),
        );
      case RouteNames.strengthPage:
        return MaterialPageRoute(
          builder: (_) => const StrengthPage(),
        );
      default:
        throw Exception('Invalid route ${routeSettings.name}');
    }
  }
}
