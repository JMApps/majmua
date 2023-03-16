import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:majmua/application/state/prayer_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/prayerTime/prayer_model.dart';
import 'package:majmua/presentation/prayerTime/prayer_supplications.dart';
import 'package:provider/provider.dart';

class ItemCardAdhanNameTime extends StatelessWidget {
  const ItemCardAdhanNameTime({Key? key, required this.prayerModel})
      : super(key: key);

  final PrayerModel prayerModel;

  @override
  Widget build(BuildContext context) {
    final int currentTimeValue = context.watch<PrayerTimeState>().getMinutesOfDay;
    final bool isPrayerTime = currentTimeValue >= prayerModel.currentPrayerTimeValue - 59 && currentTimeValue <= prayerModel.currentPrayerTimeValue + 30;
    final bool isRemainingTime = currentTimeValue >= prayerModel.currentPrayerTimeValue - 59 && currentTimeValue < prayerModel.currentPrayerTimeValue;
    final bool isPastTime = currentTimeValue >= prayerModel.currentPrayerTimeValue + 1 && currentTimeValue <= prayerModel.currentPrayerTimeValue + 30;
    final appColors = Theme.of(context).colorScheme;
    return Expanded(
      child: Card(
        color: appColors.glassOnGlassCardColor,
        shape: RoundedRectangleBorder(
          borderRadius: AppWidgetStyle.mainBorderRadius,
          side: BorderSide(
            width: 3,
            color: isPrayerTime && isRemainingTime
                ? appColors.thirdAppColor
                : isPrayerTime && isPastTime
                    ? appColors.firstAppColor
                    : appColors.secondAppColor
                        .withOpacity(isPrayerTime ? 1 : 0),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 75,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    prayerModel.prayerName,
                    style: TextStyle(
                      fontWeight: isPrayerTime ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  subtitle: Text(
                    DateFormat.Hm().format(prayerModel.prayerTime),
                    style: TextStyle(
                      fontWeight: isPrayerTime ? FontWeight.bold : FontWeight.normal,
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
              ),
              PrayerSupplications(
                showButton: prayerModel.isMorning,
                color: appColors.mainTextColor,
                supplicationsIndex: 1,
              ),
              PrayerSupplications(
                showButton: prayerModel.isEvening,
                color: appColors.mainTextColor,
                supplicationsIndex: 2,
              ),
              PrayerSupplications(
                showButton: prayerModel.isNight,
                color: appColors.mainTextColor,
                supplicationsIndex: 3,
              ),
              PrayerSupplications(
                showButton: isPrayerTime && isPastTime && prayerModel.prayerName != AppString.sunrise,
                color: appColors.firstAppColor,
                supplicationsIndex: 0,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(seconds: 1),
                  style: TextStyle(
                    fontSize: isPrayerTime && isPastTime ? 14 : 0,
                  ),
                  child: Text(
                    DateFormat.m().format(prayerModel.afterPrayerTime),
                    style: TextStyle(
                      color: appColors.firstAppColor,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(seconds: 1),
                  style: TextStyle(
                    fontSize: isPrayerTime && isRemainingTime ? 14 : 0,
                  ),
                  child: Text(
                    '–${DateFormat.m().format(prayerModel.beforePrayerTime)}',
                    style: TextStyle(
                      color: appColors.thirdAppColor,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
