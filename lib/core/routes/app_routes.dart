import 'package:flutter/material.dart';

import '../../presentation/prayer/pages/add_city_page.dart';
import '../../presentation/settings/pages/app_settings_page.dart';
import '../../presentation/notifications/pages/app_notifications_page.dart';
import '../../presentation/prayer/pages/page_adjustments.dart';
import '../../presentation/prayer/pages/page_information.dart';
import '../../presentation/prayer/pages/prayer_params_page.dart';
import '../../presentation/prayer/pages/prayers_schedule_page.dart';
import '../../presentation/prayer/pages/select_city_page.dart';
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
    // AppRouteNames.pagePrayerParams: (context, args) {
    //   final CollectionArgs collectionArgs = args;
    //   return CollectionDetailPage(
    //     collectionModel: collectionArgs.collectionModel,
    //   );
    // },
  };
}
