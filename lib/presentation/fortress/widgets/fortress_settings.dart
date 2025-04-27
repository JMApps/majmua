import 'package:flutter/material.dart';
import '../../../l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../state/fortress_state.dart';

class FortressSettings extends StatelessWidget {
  const FortressSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      padding: AppStyles.mardingWithoutTop,
      child: Consumer<FortressState>(
        builder: (context, fortressState, _) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                appLocale.arabicTextSize,
                style: AppStyles.mainTextStyle,
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      if (fortressState.arabicTextSize > 12) {
                        fortressState.arabicTextSize--;
                      }
                    },
                    child: const Icon(Icons.remove),
                  ),
                  Flexible(
                    child: Slider(
                      padding: AppStyles.mainMarding,
                      value: fortressState.arabicTextSize,
                      min: 12.0,
                      max: 72.0,
                      divisions: 30,
                      label: fortressState.arabicTextSize.toStringAsFixed(0),
                      secondaryTrackValue: fortressState.arabicTextSize,
                      onChanged: (double value) {
                        fortressState.arabicTextSize = value;
                      },
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      if (fortressState.arabicTextSize < 72) {
                        fortressState.arabicTextSize++;
                      }
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              Text(
                appLocale.translationTextSize,
                style: AppStyles.mainTextStyle,
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      if (fortressState.translationTextSize > 12) {
                        fortressState.translationTextSize--;
                      }
                    },
                    child: const Icon(Icons.remove),
                  ),
                  Flexible(
                    child: Slider(
                      padding: AppStyles.mainMarding,
                      value: fortressState.translationTextSize,
                      min: 12.0,
                      max: 72.0,
                      divisions: 30,
                      label:
                          fortressState.translationTextSize.toStringAsFixed(0),
                      secondaryTrackValue: fortressState.translationTextSize,
                      onChanged: (double value) {
                        fortressState.translationTextSize = value;
                      },
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      if (fortressState.translationTextSize < 72) {
                        fortressState.translationTextSize++;
                      }
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              SwitchListTile.adaptive(
                title: Text(
                  appLocale.transcription,
                  style: AppStyles.mainTextStyle,
                ),
                visualDensity: VisualDensity.compact,
                shape: AppStyles.mainShapeMini,
                contentPadding: AppStyles.mainMardingMini,
                value: fortressState.transcriptionIsShow,
                activeColor: appColors.inversePrimary,
                onChanged: (bool onChanged) {
                  fortressState.transcriptionIsShow = onChanged;
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
