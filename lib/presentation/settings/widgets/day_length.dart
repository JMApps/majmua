import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/app_settings_state.dart';

class DayLength extends StatelessWidget {
  const DayLength({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Consumer<AppSettingsState>(
      builder: (context, settingsState, _) {
        return ListTile(
          title: Text(
            appLocale.lengthOfDay,
            style: AppStyles.mainTextStyleMini,
          ),
          leading: const Icon(Icons.access_time_outlined),
          trailing: Switch(
            value: settingsState.dayLengthState,
            onChanged: (bool onChanged) {
              settingsState.dayLengthState = onChanged;
            },
          ),
        );
      },
    );
  }
}
