import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/styles/app_styles.dart';
import '../widgets/app_wake_lock.dart';
import '../widgets/theme_color_picker.dart';
import '../widgets/theme_mode_drop_down.dart';

class AppSettingsPage extends StatelessWidget {
  const AppSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocale.settings),
      ),
      body: const SingleChildScrollView(
        padding: AppStyles.mainMardingMini,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ThemeModeDropDown(),
            Divider(indent: 16, endIndent: 16),
            ThemeColorPicker(),
            Divider(indent: 16, endIndent: 16),
            AppWakeLock()
          ],
        ),
      ),
    );
  }
}
