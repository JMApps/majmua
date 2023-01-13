import 'package:flutter/material.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/presentation/prayerTime/item_card_adhan_name_time.dart';

class MainCardAdhanTime extends StatelessWidget {
  const MainCardAdhanTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: AppWidgetStyle.horizontalMarginMini,
      shape: AppWidgetStyle.mainRectangleBorder,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Card(
                    elevation: 1,
                    shape: AppWidgetStyle.mainRectangleBorder,
                    child: ListTile(
                      onTap: () {},
                      contentPadding: AppWidgetStyle.horizontalPadding,
                      shape: AppWidgetStyle.mainRectangleBorder,
                      visualDensity:
                          const VisualDensity(horizontal: 0, vertical: -4),
                      title: const Text(
                        'Turkey, Izmir',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 17.5,
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 1,
                  shape: AppWidgetStyle.mainRectangleBorder,
                  child: IconButton(
                    onPressed: () {},
                    visualDensity:
                        const VisualDensity(horizontal: 0, vertical: -4),
                    splashRadius: 15,
                    icon: const Icon(Icons.settings),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                ItemCardAdhanNameTime(
                  prayerName: 'Фаджр',
                  prayerColor: Colors.indigo,
                ),
                ItemCardAdhanNameTime(
                  prayerName: 'Восход',
                  prayerColor: Colors.red,
                ),
                ItemCardAdhanNameTime(
                  prayerName: 'Зухр',
                  prayerColor: Colors.orange,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                ItemCardAdhanNameTime(
                  prayerName: 'Аср',
                  prayerColor: Colors.teal,
                ),
                ItemCardAdhanNameTime(
                  prayerName: 'Магриб',
                  prayerColor: Colors.brown,
                ),
                ItemCardAdhanNameTime(
                  prayerName: 'Иша',
                  prayerColor: Colors.purple,
                ),
              ],
            ),
            const Card(
              elevation: 1,
              shape: AppWidgetStyle.mainRectangleBorder,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Последняя треть ночи: 02:34',
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
