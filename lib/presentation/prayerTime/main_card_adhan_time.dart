import 'package:adhan/adhan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:majmua/application/state/prayer_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/prayerTime/item_card_adhan_name_time.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class MainCardAdhanTime extends StatelessWidget {
  const MainCardAdhanTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppWidgetStyle.horizontalMarginMini,
      child: Padding(
        padding: AppWidgetStyle.mainPaddingMini,
        child: Consumer<PrayerTimeState>(
          builder: (BuildContext context, prayerTimeState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: appColors.glassOnGlassCardColor,
                        child: ListTile(
                          onTap: () {
                            Navigator.pushNamed(context, 'prayer_params_page');
                          },
                          contentPadding: AppWidgetStyle.horizontalPadding,
                          shape: AppWidgetStyle.mainRectangleBorder,
                          visualDensity: const VisualDensity(vertical: -4),
                          title: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '${prayerTimeState.getCountry}, ',
                                  style: TextStyle(
                                    color: appColors.mainTextColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Nexa',
                                  ),
                                ),
                                TextSpan(
                                  text: prayerTimeState.getCity,
                                  style: TextStyle(
                                    color: appColors.firstAppColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Nexa',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 17.5,
                            color: appColors.mainTextColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Card(
                      color: appColors.glassOnGlassCardColor,
                      child: IconButton(
                        onPressed: () {
                          Share.share(
                            prayerTimeState.getContentForShare,
                            sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10 / 2),
                          );
                        },
                        visualDensity: const VisualDensity(vertical: -4),
                        splashRadius: 17.5,
                        icon: const Icon(
                          CupertinoIcons.share_up,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ItemCardAdhanNameTime(
                      prayerName: AppString.fajr,
                      prayerTime: prayerTimeState.getPrayerTimes.fajr,
                      currentPrayerTimeValue:
                          prayerTimeState.getFajrValueInMinutes,
                      toPrayerTime: prayerTimeState.toPrayerTime(Prayer.fajr),
                      fromPrayerTime:
                          prayerTimeState.fromPrayerTime(Prayer.fajr),
                    ),
                    const SizedBox(width: 8),
                    ItemCardAdhanNameTime(
                      prayerName: AppString.sunrise,
                      prayerTime: prayerTimeState.getPrayerTimes.sunrise,
                      currentPrayerTimeValue:
                          prayerTimeState.getSunriseValueInMinutes,
                      toPrayerTime:
                          prayerTimeState.toPrayerTime(Prayer.sunrise),
                      fromPrayerTime:
                          prayerTimeState.fromPrayerTime(Prayer.sunrise),
                    ),
                    const SizedBox(width: 8),
                    ItemCardAdhanNameTime(
                      prayerName: AppString.dhuhr,
                      prayerTime: prayerTimeState.getPrayerTimes.dhuhr,
                      currentPrayerTimeValue:
                          prayerTimeState.getDhuhrValueInMinutes,
                      toPrayerTime: prayerTimeState.toPrayerTime(Prayer.dhuhr),
                      fromPrayerTime:
                          prayerTimeState.fromPrayerTime(Prayer.dhuhr),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ItemCardAdhanNameTime(
                      prayerName: AppString.asr,
                      prayerTime: prayerTimeState.getPrayerTimes.asr,
                      currentPrayerTimeValue:
                          prayerTimeState.getAsrValueInMinutes,
                      toPrayerTime: prayerTimeState.toPrayerTime(Prayer.asr),
                      fromPrayerTime:
                          prayerTimeState.fromPrayerTime(Prayer.asr),
                    ),
                    const SizedBox(width: 8),
                    ItemCardAdhanNameTime(
                      prayerName: AppString.maghrib,
                      prayerTime: prayerTimeState.getPrayerTimes.maghrib,
                      currentPrayerTimeValue:
                          prayerTimeState.getMaghribValueInMinutes,
                      toPrayerTime:
                          prayerTimeState.toPrayerTime(Prayer.maghrib),
                      fromPrayerTime:
                          prayerTimeState.fromPrayerTime(Prayer.maghrib),
                    ),
                    const SizedBox(width: 8),
                    ItemCardAdhanNameTime(
                      prayerName: AppString.isha,
                      prayerTime: prayerTimeState.getPrayerTimes.isha,
                      currentPrayerTimeValue:
                          prayerTimeState.getIshaValueInMinutes,
                      toPrayerTime: prayerTimeState.toPrayerTime(Prayer.isha),
                      fromPrayerTime:
                          prayerTimeState.fromPrayerTime(Prayer.isha),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Card(
                  color: appColors.glassOnGlassCardColor,
                  child: Padding(
                    padding: AppWidgetStyle.mainPaddingMini,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${AppString.lastThirdNight} ',
                            style: TextStyle(
                              fontFamily: 'Nexa',
                              color: appColors.mainTextColor,
                            ),
                          ),
                          TextSpan(
                            text: DateFormat.Hm()
                                .format(prayerTimeState.getThirdNightPart),
                            style: TextStyle(
                              fontFamily: 'Lato',
                              color: appColors.secondAppColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Card(
                  color: appColors.glassOnGlassCardColor,
                  child: Padding(
                    padding: AppWidgetStyle.mainPaddingMini,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${AppString.midnight} ',
                            style: TextStyle(
                              fontFamily: 'Nexa',
                              color: appColors.mainTextColor,
                            ),
                          ),
                          TextSpan(
                            text: DateFormat.Hm()
                                .format(prayerTimeState.getMidnight),
                            style: TextStyle(
                              fontFamily: 'Lato',
                              color: appColors.firstAppColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
