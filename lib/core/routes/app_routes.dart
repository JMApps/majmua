import 'package:flutter/material.dart';

import '../../data/models/args/fortress_chapter_args.dart';
import '../../data/models/args/quran_args.dart';
import '../../presentation/fortress/pages/fortress_content_page.dart';
import '../../presentation/fortress/pages/main_fortress_page.dart';
import '../../presentation/gems/pages/gems_page.dart';
import '../../presentation/library/pages/hadith_page.dart';
import '../../presentation/library/pages/lessons_page.dart';
import '../../presentation/library/pages/names_of_page.dart';
import '../../presentation/library/pages/questions_page.dart';
import '../../presentation/library/pages/raqaiq_page.dart';
import '../../presentation/library/pages/strength_page.dart';
import '../../presentation/prayer/pages/add_city_page.dart';
import '../../presentation/quran/pages/quran_page.dart';
import '../../presentation/settings/pages/app_settings_page.dart';
import '../../presentation/notifications/pages/app_notifications_page.dart';
import '../../presentation/prayer/pages/page_adjustments.dart';
import '../../presentation/prayer/pages/page_information.dart';
import '../../presentation/prayer/pages/prayer_params_page.dart';
import '../../presentation/prayer/pages/prayers_schedule_page.dart';
import '../../presentation/prayer/pages/select_city_page.dart';
import '../../presentation/counter/pages/counter_page.dart';
import '../../presentation/sfq/pages/sfq_page.dart';
import 'app_route_names.dart';

class AppRoutes {
  static Route<dynamic> onRouteGenerator(RouteSettings routeSettings) {
    final builder = routes[routeSettings.name];

    if (builder != null) {
      return MaterialPageRoute(
        builder: (context) {
          return builder(context, routeSettings.arguments);
        },
      );
    }
    throw Exception('Invalid route');
  }

  static Map<String, Widget Function(BuildContext, dynamic)> routes = {
    AppRouteNames.pageAppSettings: (context, args) => const AppSettingsPage(),
    AppRouteNames.pageAppNotifications: (context, args) => const AppNotificationsPage(),
    AppRouteNames.pagePrayerParams: (context, args) => const PrayerParamsPage(),
    AppRouteNames.pagePrayerSchedule: (context, args) => const PrayersSchedulePage(),
    AppRouteNames.pageSelectCity: (context, args) => const SelectCityPage(),
    AppRouteNames.pageAddCity: (context, args) => const AddCityPage(),
    AppRouteNames.pageAdjustments: (context, args) => const PageAdjustments(),
    AppRouteNames.pageInformation: (context, args) => const PageInformation(),
    AppRouteNames.pageQuran: (context, args) {
      final QuranArgs quranArgs = args;
      return QuranPage(
        surahName: quranArgs.surahName,
        listPages: quranArgs.listPages,
      );
    },
    AppRouteNames.pageSFQ: (context, args) => const SfqPage(),
    AppRouteNames.pageGems: (context, args) => const GemsPage(),
    AppRouteNames.pageCounter: (context, args) => const CounterPage(),
    AppRouteNames.pageFortress: (context, args) => const MainFortressPage(),
    AppRouteNames.pageContentFortress: (context, args) {
      final FortressChapterArgs fortressChapterArgs = args;
      return FortressContentPage(
        chapterId: fortressChapterArgs.chapterId,
      );
    },
    AppRouteNames.pageNamesOfContent: (context, args) => const NamesOfPage(),
    AppRouteNames.pageQuestionsContent: (context, args) => const QuestionsPage(),
    AppRouteNames.pageHadithsContent: (context, args) => const HadithPage(),
    AppRouteNames.pageLessonsContent: (context, args) => const LessonsPage(),
    AppRouteNames.pageRaqaiqContent: (context, args) => const RaqaiqPage(),
    AppRouteNames.pageStrengthContent: (context, args) => const StrengthPage(),
  };
}
