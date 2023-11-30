import 'package:adhan/adhan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/adhanTimes/models/prayer_model.dart';
import 'package:majmua/presentation/adhanTimes/supplication_is_show.dart';
import 'package:majmua/presentation/state/adhan_time_state.dart';
import 'package:provider/provider.dart';

class AdhanTimeCard extends StatelessWidget {
  const AdhanTimeCard({
    super.key,
    required this.prayerModel,
  });

  final PrayerModel prayerModel;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    final currentTimeValue = context.watch<AdhanTimeState>().getMinutesOfDay;
    final bool isRemainingTime = currentTimeValue >= prayerModel.currentPrayerTime - 59 && currentTimeValue < prayerModel.currentPrayerTime - 1;
    final bool isPastTime = currentTimeValue >= prayerModel.currentPrayerTime + 2 && currentTimeValue <= prayerModel.currentPrayerTime + 30;
    final bool isPrayer = currentTimeValue >= (prayerModel.currentPrayerTime) - 1 && currentTimeValue <= prayerModel.currentPrayerTime + 1;
    return Flexible(
      child: Card(
        margin: EdgeInsets.zero,
        color: appColors.glass,
        shape: RoundedRectangleBorder(
          borderRadius: AppStyles.mainBorderRadiusMini,
          side: BorderSide(
            width: 2,
            color: isRemainingTime
                ? appColors.error
                : isPastTime
                ? appColors.primaryColor
                : appColors.secondaryColor.withOpacity(isPrayer ? 1 : 0),
          ),
        ),
        child: Container(
          height: screenWidth * 0.18,
          width: double.infinity,
          padding: AppStyles.mainMardingMini,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      prayerModel.prayerName,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: appColors.onSurface.withOpacity(0.75),
                        fontWeight: isRemainingTime || isPrayer || isPastTime ? FontWeight.bold : FontWeight.normal,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Expanded(
                      child: Text(
                        DateFormat.Hm().format(prayerModel.prayerTime),
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontFamily: 'Helvetica Neue',
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Visibility(
                    visible: isPrayer && prayerModel.prayerIndex != Prayer.sunrise,
                    child: AnimatedSize(
                      duration: const Duration(seconds: 1),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: AppStyles.mainBorderRadius,
                        child: Icon(
                          Icons.mosque,
                          size: screenWidth * 0.04,
                          color: appColors.secterColor,
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: prayerModel.isDuha && prayerModel.prayerIndex == Prayer.sunrise,
                    child: AnimatedSize(
                      duration: const Duration(seconds: 1),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: AppStyles.mainBorderRadius,
                        child: Icon(
                          CupertinoIcons.sunrise,
                          size: screenWidth * 0.05,
                          color: appColors.secterColor,
                        ),
                      ),
                    ),
                  ),
                  SupplicationIsShow(
                    isShow: prayerModel.isMorning && prayerModel.prayerIndex == Prayer.fajr,
                    supplicationsId: 26,
                    iconColor: appColors.secterColor,
                  ),
                  SupplicationIsShow(
                    isShow: prayerModel.isEvening && prayerModel.prayerIndex == Prayer.asr,
                    supplicationsId: 27,
                    iconColor: appColors.secterColor,
                  ),
                  SupplicationIsShow(
                    isShow: prayerModel.isNight && prayerModel.prayerIndex == Prayer.isha,
                    supplicationsId: 28,
                    iconColor: appColors.secterColor,
                  ),
                  Visibility(
                    visible: isRemainingTime,
                    child: AnimatedSize(
                      duration: const Duration(seconds: 1),
                      child: Text(
                        '–${DateFormat.m().format(prayerModel.beforePrayerTime)}',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontFamily: 'Helvetica Neue',
                          fontWeight: FontWeight.bold,
                          color: appColors.error,
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isPastTime,
                    child: AnimatedSize(
                      duration: const Duration(seconds: 1),
                      child: Text(
                        DateFormat.m().format(prayerModel.afterPrayerTime),
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontFamily: 'Helvetica Neue',
                          fontWeight: FontWeight.bold,
                          color: appColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  SupplicationIsShow(
                    isShow: isPastTime && prayerModel.prayerIndex != Prayer.sunrise,
                    supplicationsId: 25,
                    iconColor: appColors.primaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
