import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/prayer_state.dart';

class PageAdjustments extends StatelessWidget {
  const PageAdjustments({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocale.adjustmentTimes),
      ),
      body: SingleChildScrollView(
        padding: AppStyles.mainMardingMini,
        child: Consumer<PrayerState>(
          builder: (context, prayerState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  child: Padding(
                    padding: AppStyles.mainMardingMini,
                    child: Text(
                      appLocale.adjustmentMessage,
                      style: AppStyles.mainTextStyleMini,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                ListTile(
                  leading: OutlinedButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      prayerState.fajrAdjustment = prayerState.fajrAdjustment - 1;
                    },
                    child: const Icon(Icons.remove),
                  ),
                  title: Text(
                    '${appLocale.fajr}\n${DateFormat('HH:mm').format(prayerState.prayerTimes.fajr)}',
                    style: AppStyles.mainTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  trailing: OutlinedButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      prayerState.fajrAdjustment = prayerState.fajrAdjustment + 1;
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
                ListTile(
                  leading: OutlinedButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      prayerState.sunriseAdjustment = prayerState.sunriseAdjustment - 1;
                    },
                    child: const Icon(Icons.remove),
                  ),
                  title: Text(
                    '${appLocale.sunrise}\n${DateFormat('HH:mm').format(prayerState.prayerTimes.sunrise)}',
                    style: AppStyles.mainTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  trailing: OutlinedButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      prayerState.sunriseAdjustment = prayerState.sunriseAdjustment + 1;
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
                ListTile(
                  leading: OutlinedButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      prayerState.dhuhrAdjustment = prayerState.dhuhrAdjustment - 1;
                    },
                    child: const Icon(Icons.remove),
                  ),
                  title: Text(
                    '${appLocale.dhuhr}\n${DateFormat('HH:mm').format(prayerState.prayerTimes.dhuhr)}',
                    style: AppStyles.mainTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  trailing: OutlinedButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      prayerState.dhuhrAdjustment = prayerState.dhuhrAdjustment + 1;
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
                ListTile(
                  leading: OutlinedButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      prayerState.asrAdjustment = prayerState.asrAdjustment - 1;
                    },
                    child: const Icon(Icons.remove),
                  ),
                  title: Text(
                    '${appLocale.asr}\n${DateFormat('HH:mm').format(prayerState.prayerTimes.asr)}',
                    style: AppStyles.mainTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  trailing: OutlinedButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      prayerState.asrAdjustment = prayerState.asrAdjustment + 1;
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
                ListTile(
                  leading: OutlinedButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      prayerState.maghribAdjustment = prayerState.maghribAdjustment - 1;
                    },
                    child: const Icon(Icons.remove),
                  ),
                  title: Text(
                    '${appLocale.maghrib}\n${DateFormat('HH:mm').format(prayerState.prayerTimes.maghrib)}',
                    style: AppStyles.mainTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  trailing: OutlinedButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      prayerState.maghribAdjustment = prayerState.maghribAdjustment + 1;
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
                ListTile(
                  leading: OutlinedButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      prayerState.ishaAdjustment = prayerState.ishaAdjustment - 1;
                    },
                    child: const Icon(Icons.remove),
                  ),
                  title: Text(
                    '${appLocale.isha}\n${DateFormat('HH:mm').format(prayerState.prayerTimes.isha)}',
                    style: AppStyles.mainTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  trailing: OutlinedButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      prayerState.ishaAdjustment = prayerState.ishaAdjustment + 1;
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: AppStyles.mainMarding,
        child: FilledButton.tonal(
          onPressed: () {
            HapticFeedback.lightImpact();
            Provider.of<PrayerState>(context, listen: false).defaultAdjustments;
          },
          child: Text(
            appLocale.defaultAdjustments,
            style: AppStyles.mainTextStyleMini,
          ),
        ),
      ),
    );
  }
}
