import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/routes/route_names.dart';
import '../../core/styles/app_styles.dart';
import '../state/adhan_time_state.dart';
import 'adhan_time_card.dart';
import 'models/prayer_model.dart';
import 'params/qibla_direction.dart';

class MainAdhanTimeCard extends StatelessWidget {
  const MainAdhanTimeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    final bool isPortrait = mediaQuery.orientation == Orientation.portrait;
    return Card(
      child: Padding(
        padding: AppStyles.mainMardingMini,
        child: Consumer<AdhanTimeState>(
          builder: (BuildContext context, AdhanTimeState adhanTimeState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, RouteNames.adhanParamsPage);
                        },
                        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                        tileColor: appColors.glass,
                        shape: AppStyles.leftTopShapeMini,
                        title: RichText(
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${adhanTimeState.country}, ',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                  color: appColors.onSurface,
                                  fontFamily: 'Raleway',
                                ),
                              ),
                              TextSpan(
                                text: adhanTimeState.city,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                  color: appColors.primary,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Raleway',
                                ),
                              ),
                            ],
                          ),
                        ),
                        trailing: Image.asset(
                          'assets/icons/angle-right.png',
                          width: screenWidth * 0.05,
                          height: screenWidth * 0.05,
                          color: appColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Card(
                      margin: EdgeInsets.zero,
                      color: appColors.glass,
                      shape: AppStyles.mainShapeMicro,
                      child: SizedBox(
                        width: isPortrait ? screenWidth * 0.1 : screenWidth * 0.07,
                        height: isPortrait ? screenWidth * 0.1 : screenWidth * 0.07,
                        child: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: appColors.surface,
                              builder: (_) => SingleChildScrollView(
                                child: QiblaDirection(
                                  qiblaDirection: adhanTimeState.getQiblaDirection,
                                ),
                              ),
                            );
                          },
                          splashRadius: 20,
                          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                          icon: Image.asset(
                            'assets/icons/kaaba.png',
                            width: screenWidth * 0.05,
                            height: screenWidth * 0.05,
                            color: appColors.primary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Card(
                      margin: EdgeInsets.zero,
                      color: appColors.glass,
                      shape: AppStyles.rightTopShapeMini,
                      child: SizedBox(
                        width: isPortrait ? screenWidth * 0.1 : screenWidth * 0.07,
                        height: isPortrait ? screenWidth * 0.1 : screenWidth * 0.07,
                        child: IconButton(
                          onPressed: () {
                            Share.share(
                              adhanTimeState.sharePrayerTimes(
                                fajr: appLocale!.fajr,
                                sunrise: appLocale.sunrise,
                                dhuhr: appLocale.dhuhr,
                                asr: appLocale.asr,
                                maghrib: appLocale.maghrib,
                                isha: appLocale.isha,
                                midnight: appLocale.midnight,
                                thirdNightPart: appLocale.thirdPart,
                                prayerCalculationMethod: appLocale.calculationMethod,
                                timeOffset: appLocale.timeOffset,
                                qiblaDirection: appLocale.qiblaDirection
                              ),
                              sharePositionOrigin: const Rect.fromLTWH(1, 1, 1, 2 / 2),
                            );
                          },
                          splashRadius: 20,
                          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                          icon: Image.asset(
                            'assets/icons/share.png',
                            width: screenWidth * 0.05,
                            height: screenWidth * 0.05,
                            color: appColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    AdhanTimeCard(
                      prayerModel: PrayerModel(
                        prayerName: appLocale!.fajr,
                        prayerIndex: Prayer.fajr,
                        currentPrayerTime: adhanTimeState.getFajrValueInMinutes,
                        prayerTime: adhanTimeState.getPrayerTimes.fajr,
                        beforePrayerTime: adhanTimeState.beforePrayerTime(Prayer.fajr),
                        afterPrayerTime: adhanTimeState.afterPrayerTime(Prayer.fajr),
                      ),
                    ),
                    const SizedBox(width: 8),
                    AdhanTimeCard(
                      prayerModel: PrayerModel(
                        prayerName: appLocale.sunrise,
                        prayerIndex: Prayer.sunrise,
                        currentPrayerTime: adhanTimeState.getSunriseValueInMinutes,
                        prayerTime: adhanTimeState.getPrayerTimes.sunrise,
                        beforePrayerTime: adhanTimeState.beforePrayerTime(Prayer.sunrise),
                        afterPrayerTime: adhanTimeState.afterPrayerTime(Prayer.sunrise),
                      ),
                    ),
                    const SizedBox(width: 8),
                    AdhanTimeCard(
                      prayerModel: PrayerModel(
                        prayerName: appLocale.dhuhr,
                        prayerIndex: Prayer.dhuhr,
                        currentPrayerTime: adhanTimeState.getDhuhrValueInMinutes,
                        prayerTime: adhanTimeState.getPrayerTimes.dhuhr,
                        beforePrayerTime: adhanTimeState.beforePrayerTime(Prayer.dhuhr),
                        afterPrayerTime: adhanTimeState.afterPrayerTime(Prayer.dhuhr),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    AdhanTimeCard(
                      prayerModel: PrayerModel(
                        prayerName: appLocale.asr,
                        prayerIndex: Prayer.asr,
                        currentPrayerTime: adhanTimeState.getAsrValueInMinutes,
                        prayerTime: adhanTimeState.getPrayerTimes.asr,
                        beforePrayerTime: adhanTimeState.beforePrayerTime(Prayer.asr),
                        afterPrayerTime: adhanTimeState.afterPrayerTime(Prayer.asr),
                      ),
                    ),
                    const SizedBox(width: 8),
                    AdhanTimeCard(
                      prayerModel: PrayerModel(
                        prayerName: appLocale.maghrib,
                        prayerIndex: Prayer.maghrib,
                        currentPrayerTime: adhanTimeState.getMaghribValueInMinutes,
                        prayerTime: adhanTimeState.getPrayerTimes.maghrib,
                        beforePrayerTime: adhanTimeState.beforePrayerTime(Prayer.maghrib),
                        afterPrayerTime: adhanTimeState.afterPrayerTime(Prayer.maghrib),
                      ),
                    ),
                    const SizedBox(width: 8),
                    AdhanTimeCard(
                      prayerModel: PrayerModel(
                        prayerName: appLocale.isha,
                        prayerIndex: Prayer.isha,
                        currentPrayerTime: adhanTimeState.getIshaValueInMinutes,
                        prayerTime: adhanTimeState.getPrayerTimes.isha,
                        beforePrayerTime: adhanTimeState.beforePrayerTime(Prayer.isha),
                        afterPrayerTime: adhanTimeState.afterPrayerTime(Prayer.isha),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      margin: EdgeInsets.zero,
                      color: appColors.glass,
                      shape: AppStyles.leftBottomShapeMini,
                      child: Padding(
                        padding: AppStyles.mainMardingMini,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: appLocale.midnight,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                  color: appColors.onSurface,
                                  fontFamily: 'Raleway',
                                ),
                              ),
                              TextSpan(
                                text: DateFormat.Hm().format(adhanTimeState.getMidnight),
                                style: TextStyle(
                                  fontSize: screenWidth * 0.038,
                                  color: appColors.primary,
                                  fontFamily: 'Bitter',
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 5,
                      child: Card(
                        margin: EdgeInsets.zero,
                        color: appColors.glass,
                        shape: AppStyles.rightBottomShapeMini,
                        child: Padding(
                          padding: AppStyles.mainMardingMini,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: appLocale.thirdPart,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.04,
                                    color: appColors.onSurface,
                                    fontFamily: 'Raleway',
                                  ),
                                ),
                                TextSpan(
                                  text: DateFormat.Hm().format(adhanTimeState.getThirdNightPart),
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.038,
                                    color: appColors.secondaryColor,
                                    fontFamily: 'Bitter',
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
