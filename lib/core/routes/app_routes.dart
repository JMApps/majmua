import 'package:flutter/material.dart';
import 'package:majmua/core/routes/route_names.dart';
import 'package:majmua/data/models/args/supplication_args.dart';
import 'package:majmua/data/models/args/surah_args.dart';
import 'package:majmua/presentation/adhanTimes/params/addCity/add_city_page.dart';
import 'package:majmua/presentation/adhanTimes/params/adhan_params_page.dart';
import 'package:majmua/presentation/adhanTimes/params/adjustmentTime/adjustment_time_page.dart';
import 'package:majmua/presentation/adhanTimes/params/calculation_info_page.dart';
import 'package:majmua/presentation/adhanTimes/params/selectCity/select_city_page.dart';
import 'package:majmua/presentation/counter/app_counter_page.dart';
import 'package:majmua/presentation/fortress/fortress_content_page.dart';
import 'package:majmua/presentation/notifications/notification_settings_page.dart';
import 'package:majmua/presentation/settings/app_settings_page.dart';
import 'package:majmua/presentation/supplicationsAndQuran/istikhara_page.dart';
import 'package:majmua/presentation/supplicationsAndQuran/sfq/sfq_page.dart';
import 'package:majmua/presentation/supplicationsAndQuran/surah/surahs_page.dart';

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
      case RouteNames.fortressContentPage:
        final SupplicationArgs args = routeSettings.arguments as SupplicationArgs;
        return MaterialPageRoute(
          builder: (_) => FortressContentPage(chapterTitle: args.chapterTitle, chapterId: args.chapterId),
        );
      case RouteNames.istikharaPage:
        return MaterialPageRoute(
          builder: (_) => const IstikharaPage(),
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
      default:
        throw Exception('Invalid route ${routeSettings.name}');
    }
  }
}
