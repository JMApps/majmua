import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:majmua/application/state/prayer_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:provider/provider.dart';

class AdjustmentMinutesLayout extends StatelessWidget {
  const AdjustmentMinutesLayout({
    Key? key,
    required this.prayerName,
    required this.prayerTime,
  }) : super(key: key);

  final String prayerName;
  final DateTime prayerTime;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Consumer<PrayerTimeState>(
      builder: (context, prayerTimeState, _) {
        return Row(
          children: [
            Expanded(
              child: FloatingActionButton(
                onPressed: () {
                  switch (prayerName) {
                    case AppString.fajr:
                      prayerTimeState.setFajrAdjustment =
                          prayerTimeState.getFajrAdjustment - 1;
                      break;
                    case AppString.sunrise:
                      prayerTimeState.setSunriseAdjustment =
                          prayerTimeState.getSunriseAdjustment - 1;
                      break;
                    case AppString.dhuhr:
                      prayerTimeState.setDhuhrAdjustment =
                          prayerTimeState.getDhuhrAdjustment - 1;
                      break;
                    case AppString.asr:
                      prayerTimeState.setAsrAdjustment =
                          prayerTimeState.getAsrAdjustment - 1;
                      break;
                    case AppString.maghrib:
                      prayerTimeState.setMaghribAdjustment =
                          prayerTimeState.getMaghribAdjustment - 1;
                      break;
                    case AppString.isha:
                      prayerTimeState.setIshaAdjustment =
                          prayerTimeState.getIshaAdjustment - 1;
                      break;
                  }
                },
                shape: AppWidgetStyle.mainRectangleBorderMini,
                elevation: 0,
                backgroundColor: appColors.thirdAppColor,
                child: const Icon(Icons.remove),
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                '$prayerName\n${DateFormat.Hm().format(prayerTime)}',
                style: const TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: FloatingActionButton(
                onPressed: () {
                  switch (prayerName) {
                    case AppString.fajr:
                      prayerTimeState.setFajrAdjustment =
                          prayerTimeState.getFajrAdjustment + 1;
                      break;
                    case AppString.sunrise:
                      prayerTimeState.setSunriseAdjustment =
                          prayerTimeState.getSunriseAdjustment + 1;
                      break;
                    case AppString.dhuhr:
                      prayerTimeState.setDhuhrAdjustment =
                          prayerTimeState.getDhuhrAdjustment + 1;
                      break;
                    case AppString.asr:
                      prayerTimeState.setAsrAdjustment =
                          prayerTimeState.getAsrAdjustment + 1;
                      break;
                    case AppString.maghrib:
                      prayerTimeState.setMaghribAdjustment =
                          prayerTimeState.getMaghribAdjustment + 1;
                      break;
                    case AppString.isha:
                      prayerTimeState.setIshaAdjustment =
                          prayerTimeState.getIshaAdjustment + 1;
                      break;
                  }
                },
                shape: AppWidgetStyle.mainRectangleBorderMini,
                elevation: 0,
                backgroundColor: appColors.secondAppColor,
                child: const Icon(Icons.add),
              ),
            ),
          ],
        );
      },
    );
  }
}
