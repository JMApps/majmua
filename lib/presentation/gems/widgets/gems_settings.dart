import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/gems_state.dart';

class GemsSettings extends StatelessWidget {
  const GemsSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Padding(
      padding: AppStyles.mardingWithoutTop,
      child: Consumer<GemsState>(
        builder: (context, gemsState, _) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                appLocale.textSize,
                style: AppStyles.mainTextStyle,
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      if (gemsState.textSize > 12) {
                        gemsState.textSize--;
                      }
                    },
                    child: const Icon(Icons.remove),
                  ),
                  Flexible(
                    child: Slider(
                      padding: AppStyles.mainMarding,
                      value: gemsState.textSize,
                      min: 12.0,
                      max: 72.0,
                      divisions: 30,
                      label: gemsState.textSize.toStringAsFixed(0),
                      secondaryTrackValue: gemsState.textSize,
                      onChanged: (double value) {
                        gemsState.textSize = value;
                      },
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      if (gemsState.textSize < 72) {
                        gemsState.textSize++;
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
