import 'package:flutter/material.dart';
import 'package:majmua/application/routes/app_routes.dart';
import 'package:majmua/application/state/main_notifications_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/pages/home_page.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notificationState = context.watch<MainNotificationsSate>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      onGenerateRoute: AppRoutes.onGeneratorRoute,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: notificationState.getIsAdaptiveTheme ? ThemeMode.system : notificationState.getIsUserTheme ? ThemeMode.dark : ThemeMode.light,
      home: const HomePage(),
    );
  }
}
