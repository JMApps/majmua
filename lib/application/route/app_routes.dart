import 'package:flutter/material.dart';
import 'package:majmua/presentation/pages/page_library.dart';

class AppRoutes {
  static Route appGeneratorRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case 'page_library':
        return MaterialPageRoute(
          builder: (_) => const PageLibrary(),
        );
      default:
        throw Exception(
          'Invalid route ${routeSettings.name}',
        );
    }
  }
}
