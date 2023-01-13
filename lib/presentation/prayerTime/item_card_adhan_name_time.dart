import 'package:flutter/material.dart';
import 'package:majmua/application/styles/app_widget_style.dart';

class ItemCardAdhanNameTime extends StatelessWidget {
  const ItemCardAdhanNameTime({
    Key? key,
    required this.prayerName,
    required this.prayerColor,
  }) : super(key: key);

  final String prayerName;
  final Color prayerColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        margin: const EdgeInsets.all(4),
        shape: AppWidgetStyle.mainRectangleBorderMini,
        color: prayerColor,
        child: Card(
          elevation: 1,
          margin: const EdgeInsets.only(left: 4),
          shape: AppWidgetStyle.mainRectangleBorderMini,
          child: Padding(
            padding: AppWidgetStyle.mainPaddingMini,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.notifications_off_outlined,
                    color: Colors.teal.shade200,
                    size: 17.5,
                  ),
                ),
                ListTile(
                  visualDensity: const VisualDensity(
                    horizontal: 0,
                    vertical: -4,
                  ),
                  contentPadding: EdgeInsets.zero,
                  title: Text(prayerName),
                  subtitle: const Text(
                    '05:34',
                    style: TextStyle(
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
