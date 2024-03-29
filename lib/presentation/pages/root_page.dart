import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../core/routes/app_routes.dart';
import '../../core/themes/app_themes.dart';
import '../state/app_settings_state.dart';
import 'main_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppSettingsState settings = Provider.of<AppSettingsState>(context);
    return MaterialApp(
      key: navigatorKey,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appName,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: settings.getThemeIndex == 2
          ? ThemeMode.system
          : settings.getThemeIndex == 0
              ? ThemeMode.light
              : ThemeMode.dark,
      onGenerateRoute: AppRoutes.onGeneratorRoute,
      home: const MainPage(),
    );
  }
}
