import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/app_settings_state.dart';
import '../../state/prayer_state.dart';

class DayLengthCard extends StatelessWidget {
  const DayLengthCard({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Consumer<PrayerState>(
      builder: (context, prayerState, _) {
        return Visibility(
          visible: Provider.of<AppSettingsState>(context).dayLengthState,
          child: Card(
            margin: AppStyles.mardingWithoutTopMini,
            child: ListTile(
              contentPadding: AppStyles.mardingHorizontalMini,
              visualDensity: VisualDensity(horizontal: -4, vertical: -4),
              title: Card(
                color: appColors.surface,
                margin: AppStyles.mardingBottomMini,
                child: Text(
                  appLocale.lengthOfDay,
                  textAlign: TextAlign.center,
                ),
              ),
              subtitle: Card(
                color: appColors.surface,
                child: Text(
                  '${prayerState.fromFajrToMaghribFormatted(timeVariations: appLocale.hourMinuteValues.split(', '))}${prayerState.isNightTime ? '' : ' / -${prayerState.restPrayerTime(isBefore: true, time: prayerState.prayerTimes.maghrib)}'}',
                  style: TextStyle(
                    color: appColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(appLocale.start),
                  Text(
                    DateFormat('HH:mm').format(
                      prayerState.prayerTimes.fajr,
                    ),
                    style: TextStyle(
                      color: appColors.tertiary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(appLocale.end),
                  Text(
                    DateFormat('HH:mm').format(
                      prayerState.prayerTimes.maghrib,
                    ),
                    style: TextStyle(
                      color: appColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
