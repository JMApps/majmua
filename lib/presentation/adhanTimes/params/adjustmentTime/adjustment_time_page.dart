import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/adhanTimes/params/adjustmentTime/adjustment_item.dart';
import 'package:majmua/presentation/state/adhan_time_state.dart';
import 'package:majmua/presentation/widgets/user_back_button.dart';
import 'package:provider/provider.dart';

class AdjustmentTimePage extends StatelessWidget {
  const AdjustmentTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Consumer<AdhanTimeState>(
      builder: (BuildContext context, AdhanTimeState adhanTimeState, _) {
        return Scaffold(
          appBar: AppBar(
            leading: const UserBackButton(),
            title: Text(appLocale!.prayerTimeAdjustment),
          ),
          body: SingleChildScrollView(
            padding: AppStyles.mainMardingMini,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: AppStyles.mardingVerticalMini,
                  padding: AppStyles.mainMardingMini,
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
                  prayerIndex: 1,
                  prayerTime: adhanTimeState.getPrayerTimes.fajr,
                ),
                const Divider(indent: 16, endIndent: 16),
                AdjustmentItem(
                  prayerName: appLocale.sunrise,
                  prayerIndex: 2,
                  prayerTime: adhanTimeState.getPrayerTimes.sunrise,
                ),
                const Divider(indent: 16, endIndent: 16),
                AdjustmentItem(
                  prayerName: appLocale.dhuhr,
                  prayerIndex: 3,
                  prayerTime: adhanTimeState.getPrayerTimes.dhuhr,
                ),
                const Divider(indent: 16, endIndent: 16),
                AdjustmentItem(
                  prayerName: appLocale.asr,
                  prayerIndex: 4,
                  prayerTime: adhanTimeState.getPrayerTimes.asr,
                ),
                const Divider(indent: 16, endIndent: 16),
                AdjustmentItem(
                  prayerName: appLocale.maghrib,
                  prayerIndex: 5,
                  prayerTime: adhanTimeState.getPrayerTimes.maghrib,
                ),
                const Divider(indent: 16, endIndent: 16),
                AdjustmentItem(
                  prayerName: appLocale.isha,
                  prayerIndex: 6,
                  prayerTime: adhanTimeState.getPrayerTimes.isha,
                ),
              ],
            ),
          ),
          bottomNavigationBar: MaterialButton(
            onPressed: () {
              adhanTimeState.setFajrAdjustment = 0;
              adhanTimeState.setSunriseAdjustment = 0;
              adhanTimeState.setDhuhrAdjustment = 0;
              adhanTimeState.setAsrAdjustment = 0;
              adhanTimeState.setMaghribAdjustment = 0;
              adhanTimeState.setIshaAdjustment = 0;
              adhanTimeState.initPrayerTime();
            },
            elevation: 0,
            height: 60,
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
      },
    );
  }
}
