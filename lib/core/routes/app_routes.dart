import 'package:flutter/material.dart';
import 'package:majmua/presentation/adhanTimes/params/adhan_params_page.dart';
import 'package:majmua/presentation/pages/notification_settings_page.dart';

class AppRoutes {
  static Route onGeneratorRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/notifications_page':
        return MaterialPageRoute(
          builder: (_) => const NotificationSettingsPage(),
        );
      case '/adhan_params_page':
        return MaterialPageRoute(
          builder: (_) => const AdhanParamsPage(),
        );
      default:
        throw Exception('Invalid route ${routeSettings.name}');
    }
  }
}
