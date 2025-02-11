import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/styles/app_styles.dart';
import '../../state/surah_settings_state.dart';

class SurahSettingsBottomSheet extends StatelessWidget {
  const SurahSettingsBottomSheet({
    super.key,
    required this.surahState,
  });

  final SurahSettingsState surahState;

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Padding(
      padding: AppStyles.mardingWithoutTop,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(appLocale.backgroundWarmth),
          Slider.adaptive(
            value: surahState.getWarmthValue,
            min: 0.0,
            max: 35.0,
            onChanged: (value) => surahState.setWarmthValue = value,
          ),
          Text(appLocale.textContrast),
          Slider.adaptive(
            value: surahState.getFontContrast,
            min: 50.0,
            max: 100.0,
            onChanged: (value) => surahState.setFontContrast = value,
          ),
        ],
      ),
    );
  }
}
