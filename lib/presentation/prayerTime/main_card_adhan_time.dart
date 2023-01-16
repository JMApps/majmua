import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/prayerTime/item_card_adhan_name_time.dart';

class MainCardAdhanTime extends StatelessWidget {
  const MainCardAdhanTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppWidgetStyle.horizontalMarginMini,
      child: Padding(
        padding: AppWidgetStyle.mainPaddingMini,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: appColors.glassOnGlassCardColor,
                    child: ListTile(
                      onTap: () {},
                      contentPadding: AppWidgetStyle.horizontalPadding,
                      shape: AppWidgetStyle.mainRectangleBorder,
                      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                      title: const Text(
                        'Turkey, Izmir',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
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
              children: const [
                ItemCardAdhanNameTime(
                  prayerName: AppString.fajr,
                  prayerColor: Colors.indigo,
                ),
                SizedBox(width: 8),
                ItemCardAdhanNameTime(
                  prayerName: AppString.sunrise,
                  prayerColor: Colors.red,
                ),
                SizedBox(width: 8),
                ItemCardAdhanNameTime(
                  prayerName: AppString.dhuhr,
                  prayerColor: Colors.orange,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                ItemCardAdhanNameTime(
                  prayerName: AppString.asr,
                  prayerColor: Colors.teal,
                ),
                SizedBox(width: 8),
                ItemCardAdhanNameTime(
                  prayerName: AppString.maghrib,
                  prayerColor: Colors.brown,
                ),
                SizedBox(width: 8),
                ItemCardAdhanNameTime(
                  prayerName: AppString.isha,
                  prayerColor: Colors.purple,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Card(
              color: appColors.glassOnGlassCardColor,
              child: const Padding(
                padding: AppWidgetStyle.mainPaddingMini,
                child: Text(
                  '${AppString.lastThirdNight} 02:34',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
