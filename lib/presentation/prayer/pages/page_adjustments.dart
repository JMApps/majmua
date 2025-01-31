import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
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
                const Card(
                  child: Padding(
                    padding: AppStyles.mainMardingMini,
                    child: Text(
                      'Description',
                      style: AppStyles.mainTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                ListTile(
                  leading: FilledButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                    },
                    child: const Icon(Icons.remove),
                  ),
                  title: Text(
                    '${appLocale.fajr}\n${DateFormat('HH:mm').format(prayerState.prayerTimes.fajr)}',
                    style: AppStyles.mainTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  trailing: FilledButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
                ListTile(
                  leading: FilledButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                    },
                    child: const Icon(Icons.remove),
                  ),
                  title: Text(
                    '${appLocale.sunrise}\n${DateFormat('HH:mm').format(prayerState.prayerTimes.sunrise)}',
                    style: AppStyles.mainTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  trailing: FilledButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
                ListTile(
                  leading: FilledButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                    },
                    child: const Icon(Icons.remove),
                  ),
                  title: Text(
                    '${appLocale.dhuhr}\n${DateFormat('HH:mm').format(prayerState.prayerTimes.dhuhr)}',
                    style: AppStyles.mainTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  trailing: FilledButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
                ListTile(
                  leading: FilledButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                    },
                    child: const Icon(Icons.remove),
                  ),
                  title: Text(
                    '${appLocale.asr}\n${DateFormat('HH:mm').format(prayerState.prayerTimes.asr)}',
                    style: AppStyles.mainTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  trailing: FilledButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
                ListTile(
                  leading: FilledButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                    },
                    child: const Icon(Icons.remove),
                  ),
                  title: Text(
                    '${appLocale.maghrib}\n${DateFormat('HH:mm').format(prayerState.prayerTimes.maghrib)}',
                    style: AppStyles.mainTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  trailing: FilledButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
                ListTile(
                  leading: FilledButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                    },
                    child: const Icon(Icons.remove),
                  ),
                  title: Text(
                    '${appLocale.isha}\n${DateFormat('HH:mm').format(prayerState.prayerTimes.isha)}',
                    style: AppStyles.mainTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  trailing: FilledButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
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
        child: FilledButton(
          onPressed: () {
            HapticFeedback.lightImpact();
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
