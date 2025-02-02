import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../state/prayer_state.dart';

class PrayerMessages extends StatefulWidget {
  const PrayerMessages({super.key});

  @override
  State<PrayerMessages> createState() => _PrayerMessagesState();
}

class _PrayerMessagesState extends State<PrayerMessages> {
  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Consumer<PrayerState>(
      builder: (context, prayerState, _) {
        final bool isVisible = prayerState.prayerTimes.currentPrayer() != Prayer.sunrise &&
            prayerState.isAdhan(prayer: prayerState.prayerTimes.currentPrayer()) ||
            prayerState.isDhikr(prayer: prayerState.prayerTimes.currentPrayer());
        String isMessage() {
          String message;
          if (prayerState.isMorning) {
            message = appLocale.morningAdhkarsTime;
          } else if (prayerState.isEvening) {
            message = appLocale.eveningAdhkarsTime;
          } else if (prayerState.isNight) {
            message = appLocale.nightAdhkarsTime;
          } else {
            message = '';
          }
          return message;
        }

        return Column(
          children: [
            AnimatedSize(
              duration: const Duration(milliseconds: 1500),
              child: Visibility(
                visible: prayerState.isMorning || prayerState.isEvening || prayerState.isNight,
                child: Card(
                  margin: AppStyles.mardingWithoutTopMini,
                  color: appColors.surface,
                  child: ListTile(
                    onTap: () {
                      HapticFeedback.lightImpact();
                      // Open fortress with chapter id
                    },
                    shape: AppStyles.mainShapeMini,
                    splashColor: appColors.tertiaryContainer,
                    contentPadding: AppStyles.mardingRightMini,
                    dense: true,
                    visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                    minVerticalPadding: 0,
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Text(
                      isMessage(),
                      style: AppStyles.mainTextStyleMicro,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: appColors.primary,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 1500),
              child: Visibility(
                visible: isVisible,
                child: Card(
                  margin: AppStyles.mardingWithoutTopMini,
                  color: appColors.surface,
                  child: ListTile(
                    onTap: () {
                      HapticFeedback.lightImpact();
                      // Open fortress with chapter id if adhanTime
                    },
                    shape: AppStyles.mainShapeMini,
                    splashColor: appColors.tertiaryContainer,
                    contentPadding: AppStyles.mardingRightMini,
                    dense: true,
                    visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                    minVerticalPadding: 0,
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Text(
                      prayerState.isAdhan(prayer: prayerState.prayerTimes.currentPrayer()) ? appLocale.adhanTime : appLocale.adhkarsTime,
                      style: AppStyles.mainTextStyleMicro,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: appColors.primary,
                      size: 15.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
