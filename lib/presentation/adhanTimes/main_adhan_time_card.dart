import 'package:adhan/adhan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:majmua/core/routes/route_names.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/adhanTimes/adhan_time_card.dart';
import 'package:majmua/presentation/adhanTimes/models/prayer_model.dart';
import 'package:majmua/presentation/state/adhan_time_state.dart';
import 'package:provider/provider.dart';

class MainAdhanTimeCard extends StatelessWidget {
  const MainAdhanTimeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
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
                                  color: appColors.onSurface,
                                  fontSize: screenWidth * 0.04,
                                  fontFamily: 'Nexa',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: adhanTimeState.city,
                                style: TextStyle(
                                  color: appColors.primaryColor,
                                  fontSize: screenWidth * 0.04,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Nexa',
                                ),
                              ),
                            ],
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: screenWidth * 0.05,
                          color: appColors.primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Card(
                      margin: EdgeInsets.zero,
                      color: appColors.glass,
                      shape: AppStyles.mainShapeMicro,
                      child: SizedBox(
                        width: mediaQuery.orientation == Orientation.portrait
                            ? screenWidth * 0.1
                            : screenWidth * 0.07,
                        height: mediaQuery.orientation == Orientation.portrait
                            ? screenWidth * 0.1
                            : screenWidth * 0.07,
                        child: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: appColors.surface,
                              builder: (_) => Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    margin: AppStyles.mainMardingMini,
                                    padding: AppStyles.mainMardingMini,
                                    decoration: BoxDecoration(
                                      color: appColors.primaryContainer,
                                      borderRadius: AppStyles.mainBorderRadiusMini,
                                    ),
                                    child: Text('${appLocale!.qiblaOn} ${adhanTimeState.getQiblaDirection.toStringAsFixed(1)}°',
                                      style: const TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: AppStyles.mainMarding,
                                    child: Text(
                                      appLocale.qiblaInformation,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          splashRadius: 20,
                          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                          icon: Image.asset(
                            'assets/icons/kaaba.png',
                            width: screenWidth * 0.05,
                            height: screenWidth * 0.05,
                            color: appColors.primaryColor,
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
                        width: mediaQuery.orientation == Orientation.portrait
                            ? screenWidth * 0.1
                            : screenWidth * 0.07,
                        height: mediaQuery.orientation == Orientation.portrait
                            ? screenWidth * 0.1
                            : screenWidth * 0.07,
                        child: IconButton(
                          onPressed: () {},
                          splashRadius: 20,
                          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                          icon: Icon(
                            CupertinoIcons.share,
                            size: screenWidth * 0.05,
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
                        isMorning: adhanTimeState.getIsMorning,
                        isDuha: adhanTimeState.getIsDuha,
                        isEvening: adhanTimeState.getIsEvening,
                        isNight: adhanTimeState.getIsNight,
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
                        isMorning: adhanTimeState.getIsMorning,
                        isDuha: adhanTimeState.getIsDuha,
                        isEvening: adhanTimeState.getIsEvening,
                        isNight: adhanTimeState.getIsNight,
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
                        isMorning: adhanTimeState.getIsMorning,
                        isDuha: adhanTimeState.getIsDuha,
                        isEvening: adhanTimeState.getIsEvening,
                        isNight: adhanTimeState.getIsNight,
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
                        isMorning: adhanTimeState.getIsMorning,
                        isDuha: adhanTimeState.getIsDuha,
                        isEvening: adhanTimeState.getIsEvening,
                        isNight: adhanTimeState.getIsNight,
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
                        isMorning: adhanTimeState.getIsMorning,
                        isDuha: adhanTimeState.getIsDuha,
                        isEvening: adhanTimeState.getIsEvening,
                        isNight: adhanTimeState.getIsNight,
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
                        isMorning: adhanTimeState.getIsMorning,
                        isDuha: adhanTimeState.getIsDuha,
                        isEvening: adhanTimeState.getIsEvening,
                        isNight: adhanTimeState.getIsNight,
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
                                  fontFamily: 'Nexa',
                                  fontSize: screenWidth * 0.04,
                                  color: appColors.onSurface,
                                ),
                              ),
                              TextSpan(
                                text: DateFormat.Hm().format(adhanTimeState.getMidnight),
                                style: TextStyle(
                                  color: appColors.primaryColor,
                                  fontSize: screenWidth * 0.038,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  fontFamily: 'Bitter',
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
                                    color: appColors.onSurface,
                                    fontSize: screenWidth * 0.04,
                                    fontFamily: 'Nexa',
                                  ),
                                ),
                                TextSpan(
                                  text: DateFormat.Hm().format(adhanTimeState.getThirdNightPart),
                                  style: TextStyle(
                                    color: appColors.secondaryColor,
                                    fontSize: screenWidth * 0.038,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    fontFamily: 'Bitter',
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
