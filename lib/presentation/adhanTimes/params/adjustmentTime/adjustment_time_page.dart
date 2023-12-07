import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/adhanTimes/params/adjustmentTime/adjustment_item.dart';
import 'package:majmua/presentation/state/adhan_time_state.dart';
import 'package:provider/provider.dart';

class AdjustmentTimePage extends StatelessWidget {
  const AdjustmentTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocale!.prayerTimeAdjustment),
      ),
      body: Consumer<AdhanTimeState>(
        builder: (BuildContext context, AdhanTimeState adhanTimeState, _) {
          return SingleChildScrollView(
            padding: AppStyles.mainMardingMini,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: AppStyles.mardingVerticalMini,
                  padding: AppStyles.mainMarding,
                  decoration: BoxDecoration(
                    color: appColors.primaryContainer,
                    borderRadius: AppStyles.mainBorderRadiusMini,
                  ),
                  child: Text(
                    appLocale.prayerTimeAdjustmentDescription,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                AdjustmentItem(
                  prayerName: appLocale.fajr,
                  prayerTime: adhanTimeState.getPrayerTimes.fajr,
                ),
                const Divider(indent: 16, endIndent: 16),
                AdjustmentItem(
                  prayerName: appLocale.sunrise,
                  prayerTime: adhanTimeState.getPrayerTimes.sunrise,
                ),
                const Divider(indent: 16, endIndent: 16),
                AdjustmentItem(
                  prayerName: appLocale.dhuhr,
                  prayerTime: adhanTimeState.getPrayerTimes.dhuhr,
                ),
                const Divider(indent: 16, endIndent: 16),
                AdjustmentItem(
                  prayerName: appLocale.asr,
                  prayerTime: adhanTimeState.getPrayerTimes.asr,
                ),
                const Divider(indent: 16, endIndent: 16),
                AdjustmentItem(
                  prayerName: appLocale.maghrib,
                  prayerTime: adhanTimeState.getPrayerTimes.maghrib,
                ),
                const Divider(indent: 16, endIndent: 16),
                AdjustmentItem(
                  prayerName: appLocale.isha,
                  prayerTime: adhanTimeState.getPrayerTimes.isha,
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: MaterialButton(
        onPressed: () {
          // Default adjustments
        },
        elevation: 0,
        height: 50,
        color: appColors.quaternaryColor,
        shape: AppStyles.mainShapeMini,
        child: Text(
          appLocale.defaultVal,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
