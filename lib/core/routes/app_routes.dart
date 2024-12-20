import 'package:flutter/material.dart';

import '../../presentation/prayer/pages/prayer_params_page.dart';
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
    AppRouteNames.pagePrayerParams: (context, args) => const PrayerParamsPage(),
    // AppRouteNames.pagePrayerParams: (context, args) {
    //   final CollectionArgs collectionArgs = args;
    //   return CollectionDetailPage(
    //     collectionModel: collectionArgs.collectionModel,
    //   );
    // },
  };
}
