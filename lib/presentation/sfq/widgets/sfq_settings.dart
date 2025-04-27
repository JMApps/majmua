import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/sfq_state.dart';

class SfqSettings extends StatelessWidget {
  const SfqSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Padding(
      padding: AppStyles.mardingWithoutTop,
      child: Consumer<SFQState>(
        builder: (context, sfqState, _) {
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
                      if (sfqState.arabicTextSize > 12) {
                        sfqState.arabicTextSize--;
                      }
                    },
                    child: const Icon(Icons.remove),
                  ),
                  Flexible(
                    child: Slider(
                      padding: AppStyles.mainMarding,
                      value: sfqState.arabicTextSize,
                      min: 12.0,
                      max: 72.0,
                      divisions: 30,
                      label: sfqState.arabicTextSize.toStringAsFixed(0),
                      secondaryTrackValue: sfqState.arabicTextSize,
                      onChanged: (double value) {
                        sfqState.arabicTextSize = value;
                      },
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      if (sfqState.arabicTextSize < 72) {
                        sfqState.arabicTextSize++;
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
                      if (sfqState.translationTextSize > 12) {
                        sfqState.translationTextSize--;
                      }
                    },
                    child: const Icon(Icons.remove),
                  ),
                  Flexible(
                    child: Slider(
                      padding: AppStyles.mainMarding,
                      value: sfqState.translationTextSize,
                      min: 12.0,
                      max: 72.0,
                      divisions: 30,
                      label: sfqState.translationTextSize.toStringAsFixed(0),
                      secondaryTrackValue: sfqState.translationTextSize,
                      onChanged: (double value) {
                        sfqState.translationTextSize = value;
                      },
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      if (sfqState.translationTextSize < 72) {
                        sfqState.translationTextSize++;
                      }
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
