import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/adhanTimes/supplication_is_show.dart';
import 'package:provider/provider.dart';

import '../../core/routes/route_names.dart';
import '../../core/styles/app_styles.dart';
import '../../data/models/args/supplication_args.dart';
import '../state/adhan_time_state.dart';
import 'models/prayer_model.dart';

class AdhanTimeCard extends StatelessWidget {
  const AdhanTimeCard({
    super.key,
    required this.prayerModel,
  });

  final PrayerModel prayerModel;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    final AdhanTimeState adhanTimeState = Provider.of<AdhanTimeState>(context);
    final double screenWidth = MediaQuery.of(context).size.width;
    final int currentTimeValue = adhanTimeState.getMinutesOfDay;
    final bool isRemainingTime = currentTimeValue >= prayerModel.currentPrayerTime - 59 && currentTimeValue < prayerModel.currentPrayerTime - 1;
    final bool isPastTime = currentTimeValue >= prayerModel.currentPrayerTime + 4 && currentTimeValue <= prayerModel.currentPrayerTime + 30;
    final bool isPrayer = currentTimeValue >= prayerModel.currentPrayerTime - 1 && currentTimeValue <= prayerModel.currentPrayerTime + 3;
    return Flexible(
      child: Card(
        margin: EdgeInsets.zero,
        color: appColors.glass,
        shape: RoundedRectangleBorder(
          borderRadius: AppStyles.mainBorderRadiusMicro,
          side: BorderSide(
            width: 2,
            color: isRemainingTime
                ? appColors.quaternaryColor
                : isPastTime
                    ? appColors.primary
                    : appColors.secondaryColor.withOpacity(isPrayer ? 1 : 0),
          ),
        ),
        child: Container(
          width: double.infinity,
          height: screenWidth * 0.175,
          padding: AppStyles.mainMardingMini,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      prayerModel.prayerName,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: appColors.onSurface.withOpacity(0.85),
                        fontWeight: isRemainingTime || isPrayer || isPastTime
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(
                      child: Text(
                        DateFormat.Hm().format(prayerModel.prayerTime),
                        style: TextStyle(
                          fontSize: screenWidth * 0.0425,
                          fontFamily: 'Bitter',
                          fontWeight: isRemainingTime || isPrayer || isPastTime
                              ? FontWeight.bold
                              : FontWeight.normal,
                          letterSpacing: 0.5,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Visibility(
                      visible: isRemainingTime,
                      child: Flexible(
                        child: AnimatedSize(
                          duration: const Duration(seconds: 1),
                          child: Text(
                            '–${DateFormat.m().format(prayerModel.beforePrayerTime)}',
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              color: appColors.quaternaryColor,
                              fontFamily: 'Bitter',
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isPastTime,
                      child: Flexible(
                        child: AnimatedSize(
                          duration: const Duration(seconds: 1),
                          child: Text(
                            DateFormat.m().format(prayerModel.afterPrayerTime),
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              color: appColors.primary,
                              fontFamily: 'Bitter',
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SupplicationIsShow(
                      isShow: adhanTimeState.getIsMorning && prayerModel.prayerIndex == Prayer.fajr,
                      fortressChapterId: 27,
                      fortressChapterTitle: appLocale!.morning,
                      iconColor: appColors.secterColor,
                    ),
                    SupplicationIsShow(
                      isShow: adhanTimeState.getIsEvening && prayerModel.prayerIndex == Prayer.asr,
                      fortressChapterId: 28,
                      fortressChapterTitle: appLocale.evening,
                      iconColor: appColors.secterColor,
                    ),
                    SupplicationIsShow(
                      isShow: adhanTimeState.getIsNight && prayerModel.prayerIndex == Prayer.isha,
                      fortressChapterId: 29,
                      fortressChapterTitle: appLocale.beforeSleep,
                      iconColor: appColors.secterColor,
                    ),
                    SupplicationIsShow(
                      isShow: isPastTime && prayerModel.prayerIndex != Prayer.sunrise,
                      fortressChapterId: 25,
                      fortressChapterTitle: appLocale.afterPrayer,
                      iconColor: appColors.primary,
                    ),
                    Visibility(
                      visible: isPrayer && prayerModel.prayerIndex != Prayer.sunrise,
                      child: Flexible(
                        child: AnimatedSize(
                          duration: const Duration(seconds: 1),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RouteNames.fortressContentPage,
                                arguments: const SupplicationArgs(chapterId: 15),
                              );
                            },
                            borderRadius: AppStyles.mainBorderRadius,
                            child: Image.asset(
                              'assets/icons/aqsa.png',
                              width: screenWidth * 0.045,
                              height: screenWidth * 0.045,
                              color: appColors.secondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: adhanTimeState.getIsDuha && prayerModel.prayerIndex == Prayer.sunrise,
                      child: Flexible(
                        child: AnimatedSize(
                          duration: const Duration(seconds: 1),
                          child: Image.asset(
                            'assets/icons/sunrise.png',
                            width: screenWidth * 0.05,
                            height: screenWidth * 0.05,
                            color: appColors.secterColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
