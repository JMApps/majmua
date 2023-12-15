import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/state/adhan_time_state.dart';
import 'package:provider/provider.dart';

class AdjustmentItem extends StatelessWidget {
  const AdjustmentItem({
    super.key,
    required this.prayerName,
    required this.prayerIndex,
    required this.prayerTime,
  });

  final String prayerName;
  final int prayerIndex;
  final DateTime prayerTime;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Consumer<AdhanTimeState>(
      builder: (BuildContext context, AdhanTimeState adhanTimeState, _) {
        return Row(
          children: <Widget>[
            const SizedBox(width: 8),
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  switch (prayerIndex) {
                    case 1:
                      adhanTimeState.setFajrAdjustment =
                          adhanTimeState.fajrAdjustment - 1;
                      break;
                    case 2:
                      adhanTimeState.setSunriseAdjustment =
                          adhanTimeState.sunriseAdjustment - 1;
                      break;
                    case 3:
                      adhanTimeState.setDhuhrAdjustment =
                          adhanTimeState.dhuhrAdjustment - 1;
                      break;
                    case 4:
                      adhanTimeState.setAsrAdjustment =
                          adhanTimeState.asrAdjustment - 1;
                      break;
                    case 5:
                      adhanTimeState.setMaghribAdjustment =
                          adhanTimeState.maghribAdjustment - 1;
                      break;
                    case 6:
                      adhanTimeState.setIshaAdjustment =
                          adhanTimeState.ishaAdjustment - 1;
                      break;
                  }
                  adhanTimeState.initPrayerTime();
                },
                elevation: 0,
                shape: AppStyles.mainShapeMini,
                color: appColors.quaternaryColor,
                child: const Icon(Icons.remove),
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Expanded(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$prayerName\n',
                      style: TextStyle(
                        color: appColors.onSurface,
                        fontSize: 18,
                        fontFamily: 'Nexa',
                      ),
                    ),
                    TextSpan(
                      text: DateFormat.Hm().format(prayerTime),
                      style: TextStyle(
                        color: appColors.onSurface,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Bitter',
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  switch (prayerIndex) {
                    case 1:
                      adhanTimeState.setFajrAdjustment =
                          adhanTimeState.fajrAdjustment + 1;
                      break;
                    case 2:
                      adhanTimeState.setSunriseAdjustment =
                          adhanTimeState.sunriseAdjustment + 1;
                      break;
                    case 3:
                      adhanTimeState.setDhuhrAdjustment =
                          adhanTimeState.dhuhrAdjustment + 1;
                      break;
                    case 4:
                      adhanTimeState.setAsrAdjustment =
                          adhanTimeState.asrAdjustment + 1;
                      break;
                    case 5:
                      adhanTimeState.setMaghribAdjustment =
                          adhanTimeState.maghribAdjustment + 1;
                      break;
                    case 6:
                      adhanTimeState.setIshaAdjustment =
                          adhanTimeState.ishaAdjustment + 1;
                      break;
                  }
                  adhanTimeState.initPrayerTime();
                },
                elevation: 0,
                shape: AppStyles.mainShapeMini,
                color: appColors.secondaryColor,
                child: const Icon(Icons.add),
              ),
            ),
            const SizedBox(width: 8),
          ],
        );
      },
    );
  }
}
