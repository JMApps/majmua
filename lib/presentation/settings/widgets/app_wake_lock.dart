import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/app_settings_state.dart';

class AppWakeLock extends StatelessWidget {
  const AppWakeLock({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Consumer<AppSettingsState>(
      builder: (context, settingsState, _) {
        return ListTile(
          title: Text(
            appLocale.alwaysOnDisplay,
            style: AppStyles.mainTextStyleMini,
          ),
          leading: const Icon(Icons.light_mode_outlined),
          trailing: Switch(
            value: settingsState.wakeLockState,
            onChanged: (bool onChanged) {
              settingsState.wakeLockState = onChanged;
            },
          ),
        );
      },
    );
  }
}
