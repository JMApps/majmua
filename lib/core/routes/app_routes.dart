import 'package:flutter/material.dart';
import 'package:majmua/core/routes/route_names.dart';
import 'package:majmua/presentation/adhanTimes/params/addCity/add_city_page.dart';
import 'package:majmua/presentation/adhanTimes/params/adhan_params_page.dart';
import 'package:majmua/presentation/adhanTimes/params/adjustmentTime/adjustment_time_page.dart';
import 'package:majmua/presentation/adhanTimes/params/calculation_info_page.dart';
import 'package:majmua/presentation/adhanTimes/params/selectCity/select_city_page.dart';
import 'package:majmua/presentation/counter/app_counter_page.dart';
import 'package:majmua/presentation/notifications/notification_settings_page.dart';
import 'package:majmua/presentation/settings/app_settings_page.dart';

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
      default:
        throw Exception('Invalid route ${routeSettings.name}');
    }
  }
}
