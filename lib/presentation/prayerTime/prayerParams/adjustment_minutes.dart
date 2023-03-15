import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/state/prayer_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/prayerTime/prayerParams/adjustment_minutes_layout.dart';
import 'package:provider/provider.dart';

class AdjustmentMinutes extends StatelessWidget {
  const AdjustmentMinutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      color: appColors.mainReverse,
      margin: AppWidgetStyle.mainMargin,
      child: Padding(
        padding: AppWidgetStyle.mainPadding,
        child: Consumer<PrayerTimeState>(
          builder: (context, prayerTimeState, _) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AdjustmentMinutesLayout(
                    prayerName: AppString.fajr,
                    prayerTime: prayerTimeState.getPrayerTimes.fajr,
                  ),
                  const Divider(),
                  AdjustmentMinutesLayout(
                    prayerName: AppString.sunrise,
                    prayerTime: prayerTimeState.getPrayerTimes.sunrise,
                  ),
                  const Divider(),
                  AdjustmentMinutesLayout(
                    prayerName: AppString.dhuhr,
                    prayerTime: prayerTimeState.getPrayerTimes.dhuhr,
                  ),
                  const Divider(),
                  AdjustmentMinutesLayout(
                    prayerName: AppString.asr,
                    prayerTime: prayerTimeState.getPrayerTimes.asr,
                  ),
                  const Divider(),
                  AdjustmentMinutesLayout(
                    prayerName: AppString.maghrib,
                    prayerTime: prayerTimeState.getPrayerTimes.maghrib,
                  ),
                  const Divider(),
                  AdjustmentMinutesLayout(
                    prayerName: AppString.isha,
                    prayerTime: prayerTimeState.getPrayerTimes.isha,
                  ),
                  const Divider(),
                  CupertinoButton(
                    onPressed: () {
                      prayerTimeState.setFajrAdjustment = 0;
                      prayerTimeState.setSunriseAdjustment = 0;
                      prayerTimeState.setDhuhrAdjustment = 0;
                      prayerTimeState.setAsrAdjustment = 0;
                      prayerTimeState.setMaghribAdjustment = 0;
                      prayerTimeState.setIshaAdjustment = 0;
                    },
                    color: appColors.firstAppColor,
                    child: const Text(
                      AppString.defaultOffset,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
