import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/routes/app_routes.dart';
import '../../core/strings/app_string_constraints.dart';
import '../../core/themes/app_themes.dart';
import '../../l10n/app_localizations.dart';
import '../state/app_settings_state.dart';
import 'home_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppSettingsState>(
      builder: (context, appSettings, _) {
        final AppThemes appThemes = AppThemes(appSettings.appThemeColor, appSettings.getAppLocaleIndex == 4 ? AppStringConstraints.fontRubik : AppStringConstraints.fontGilroy);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: AppStringConstraints.appLocales[appSettings.getAppLocaleIndex],
          onGenerateTitle: (context) => AppLocalizations.of(context)!.appName,
          onGenerateRoute: AppRoutes.onRouteGenerator,
          theme: appThemes.lightTheme,
          darkTheme: appThemes.darkTheme,
          themeMode: appSettings.appThemeMode,
          builder: (context, child) {
            final mediaQuery = MediaQuery.of(context);
            final bottomInset = mediaQuery.viewPadding.bottom;
            return SafeArea(
              top: false,
              right: false,
              left: false,
              bottom: Platform.isAndroid && bottomInset > 24.0,
              child: child!,
            );
          },
          home: const HomePage(),
        );
      },
    );
  }
}
