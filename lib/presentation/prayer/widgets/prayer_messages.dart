import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../state/prayer_state.dart';
import 'prayer_message_item.dart';

class PrayerMessages extends StatelessWidget {
  const PrayerMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Consumer<PrayerState>(
      builder: (context, prayerState, _) {
        return Column(
          children: [
            PrayerMessageItem(
              isVisible: prayerState.isAdhan(prayer: prayerState.prayerTimes.currentPrayer()),
              iconName: AppStringConstraints.iconAqsa,
              message: appLocale.adhanTime,
              fortressChapterId: 0,
              iconColor: appColors.primary,
            ),
            PrayerMessageItem(
              isVisible: prayerState.isDhikr(prayer: prayerState.prayerTimes.currentPrayer()),
              iconName: AppStringConstraints.iconHandsFill,
              message: appLocale.adhkarsTime,
              fortressChapterId: 0,
              iconColor: appColors.primary,
            ),
            PrayerMessageItem(
              isVisible: prayerState.isLastFridayHour,
              iconName: AppStringConstraints.iconHandsFill,
              message: appLocale.lastFridayHour,
              fortressChapterId: 0,
              iconColor: appColors.primary,
            ),
            PrayerMessageItem(
              isVisible: prayerState.isMorning,
              iconName: AppStringConstraints.iconHandsFill,
              message: appLocale.morningAdhkarsTime,
              fortressChapterId: 0,
              iconColor: appColors.tertiary,
            ),
            PrayerMessageItem(
              isVisible: prayerState.isEvening,
              iconName: AppStringConstraints.iconHandsFill,
              message: appLocale.eveningAdhkarsTime,
              fortressChapterId: 0,
              iconColor: appColors.tertiary,
            ),
            PrayerMessageItem(
              isVisible: prayerState.isNight,
              iconName: AppStringConstraints.iconHandsFill,
              message: appLocale.nightAdhkarsTime,
              fortressChapterId: 0,
              iconColor: appColors.secondary,
            ),
          ],
        );
      },
    );
  }
}
