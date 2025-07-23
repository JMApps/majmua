import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/prayer_state.dart';
import '../items/time_period_percent.dart';

class DayTimesContainer extends StatelessWidget {
  const DayTimesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    final is24h = MediaQuery.of(context).alwaysUse24HourFormat;
    final timeFormatter = DateFormat(is24h ? 'HH:mm' : 'hh:mm a');

    return Card(
      margin: AppStyles.mainMardingMini,
      child: Padding(
        padding: AppStyles.mainMardingMini,
        child: Consumer<PrayerState>(
          builder: (context, prayerState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TimePeriodPercent(
                  isState: prayerState.isDuha,
                  remainingTime: prayerState.restPrayerTime(
                    isBefore: true,
                    time: prayerState.prayerTimes.sunrise,
                  ),
                  title: !prayerState.isDuha ? appLocale.sunrise : appLocale.adDuhaTime,
                  targetTime: timeFormatter.format(prayerState.prayerTimes.sunrise.toLocal()),
                  cardColor: appColors.primaryContainer,
                  textColor: appColors.primary,
                ),
                const SizedBox(height: 8),
                TimePeriodPercent(
                  isState: prayerState.isMidnight,
                  remainingTime: prayerState.restPrayerTime(
                    isBefore: true,
                    time: prayerState.sunnahTimes.middleOfTheNight,
                  ),
                  title: appLocale.midnight,
                  targetTime: timeFormatter.format(prayerState.sunnahTimes.middleOfTheNight.toLocal()),
                  cardColor: appColors.secondaryContainer,
                  textColor: appColors.secondary,
                ),
                const SizedBox(height: 8),
                TimePeriodPercent(
                  isState: prayerState.isLastThird,
                  remainingTime: prayerState.restPrayerTime(
                    isBefore: true,
                    time: prayerState.sunnahTimes.lastThirdOfTheNight,
                  ),
                  title: appLocale.lastThirdNightPart,
                  targetTime: timeFormatter.format(prayerState.sunnahTimes.lastThirdOfTheNight.toLocal()),
                  cardColor: appColors.tertiaryContainer,
                  textColor: appColors.tertiary,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}