import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../state/surah_settings_state.dart';

class SurahSettings extends StatelessWidget {
  const SurahSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Consumer<SurahSettingsState>(
      builder: (BuildContext context, SurahSettingsState surahSettings, _) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: Text(appLocale!.backgroundWarmth),
              subtitle: Slider.adaptive(
                value: surahSettings.getWarmthValue,
                min: 0.0,
                max: 35.0,
                onChanged: (double value) {
                  surahSettings.setWarmthValue = value;
                },
              ),
            ),
            ListTile(
              title: Text(appLocale.fontContrast),
              subtitle: Slider.adaptive(
                value: surahSettings.getFontContrast,
                min: 50.0,
                max: 100.0,
                onChanged: (double value) {
                  surahSettings.setFontContrast = value;
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
