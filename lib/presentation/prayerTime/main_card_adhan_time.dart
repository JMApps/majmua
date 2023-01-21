import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:majmua/application/state/prayer_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/prayerTime/item_card_adhan_name_time.dart';
import 'package:provider/provider.dart';

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
                          visualDensity:
                              const VisualDensity(horizontal: 0, vertical: -4),
                          title: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '${prayerTimeState.getCountry}, ',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Nexa',
                                    fontWeight: FontWeight.bold,
                                    color: appColors.firstAppColor,
                                  ),
                                ),
                                TextSpan(
                                  text: prayerTimeState.getCity,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Nexa',
                                    color: appColors.mainTextColor,
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
                        onPressed: () {},
                        visualDensity:
                            const VisualDensity(horizontal: 0, vertical: -4),
                        splashRadius: 17.5,
                        icon: const Icon(
                          CupertinoIcons.settings,
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
                      prayerColor: Colors.indigo,
                      prayerTime: prayerTimeState.getPrayerTimes.fajr,
                    ),
                    const SizedBox(width: 8),
                    ItemCardAdhanNameTime(
                      prayerName: AppString.sunrise,
                      prayerColor: Colors.red,
                      prayerTime: prayerTimeState.getPrayerTimes.sunrise,
                    ),
                    const SizedBox(width: 8),
                    ItemCardAdhanNameTime(
                      prayerName: AppString.dhuhr,
                      prayerColor: Colors.orange,
                      prayerTime: prayerTimeState.getPrayerTimes.dhuhr,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ItemCardAdhanNameTime(
                      prayerName: AppString.asr,
                      prayerColor: Colors.teal,
                      prayerTime: prayerTimeState.getPrayerTimes.asr,
                    ),
                    const SizedBox(width: 8),
                    ItemCardAdhanNameTime(
                      prayerName: AppString.maghrib,
                      prayerColor: Colors.brown,
                      prayerTime: prayerTimeState.getPrayerTimes.maghrib,
                    ),
                    const SizedBox(width: 8),
                    ItemCardAdhanNameTime(
                      prayerName: AppString.isha,
                      prayerColor: Colors.purple,
                      prayerTime: prayerTimeState.getPrayerTimes.isha,
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
              ],
            );
          },
        ),
      ),
    );
  }
}
