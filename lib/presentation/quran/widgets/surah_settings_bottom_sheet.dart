import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/surah_settings_state.dart';

class SurahSettingsBottomSheet extends StatelessWidget {
  const SurahSettingsBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Padding(
      padding: AppStyles.mardingWithoutTop,
      child: Consumer<SurahSettingsState>(
        builder: (context, surahState, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                appLocale.backgroundWarmth,
                style: AppStyles.mainTextStyleMini,
              ),
              Slider.adaptive(
                value: surahState.getWarmthValue,
                min: 0.0,
                max: 35.0,
                onChanged: (value) => surahState.setWarmthValue = value,
              ),
              Text(
                appLocale.textContrast,
                style: AppStyles.mainTextStyleMini,
              ),
              Slider.adaptive(
                value: surahState.getFontContrast,
                min: 50.0,
                max: 100.0,
                onChanged: (value) => surahState.setFontContrast = value,
              ),
            ],
          );
        },
      ),
    );
  }
}
