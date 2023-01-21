import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';

class ItemCardAdhanNameTime extends StatelessWidget {
  const ItemCardAdhanNameTime({
    Key? key,
    required this.prayerName,
    required this.prayerColor,
    required this.prayerTime,
  }) : super(key: key);

  final String prayerName;
  final Color prayerColor;
  final DateTime prayerTime;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Expanded(
      child: Card(
        color: appColors.glassOnGlassCardColor,
        shape: AppWidgetStyle.mainRectangleBorder,
        child: Padding(
          padding: AppWidgetStyle.mainPaddingMini,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.notifications_off_outlined,
                  color: appColors.thirdAppColor,
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
                subtitle: Text(
                  DateFormat.Hm().format(prayerTime),
                  style: const TextStyle(
                    fontFamily: 'Lato',
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
