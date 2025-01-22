import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/presentation/prayer/items/time_period_percent.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';

class DayTimesContainer extends StatelessWidget {
  const DayTimesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppStyles.mainMardingMini,
      child: Padding(
        padding: AppStyles.mainMardingMini,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TimePeriodPercent(
              dayTitle: appLocale.sunrise,
              partName: AppStringConstraints.timeSunrise,
              cardColor: appColors.primaryContainer,
            ),
            const SizedBox(height: 8),
            TimePeriodPercent(
              dayTitle: appLocale.midnight,
              partName: AppStringConstraints.timeMiddleNight,
              cardColor: appColors.secondaryContainer,
            ),
            const SizedBox(height: 8),
            TimePeriodPercent(
              dayTitle: appLocale.lastThirdNightPart,
              partName: AppStringConstraints.timeLastThird,
              cardColor: appColors.tertiaryContainer,
            ),
          ],
        ),
      ),
    );
  }
}
