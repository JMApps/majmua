import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:majmua/application/state/prayer_time_state.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:provider/provider.dart';

class ItemCardAdhanNameTime extends StatelessWidget {
  const ItemCardAdhanNameTime({
    Key? key,
    required this.prayerName,
    required this.prayerTime,
    required this.currentPrayerTimeValue,
    required this.toPrayerTime,
    required this.fromPrayerTime,
  }) : super(key: key);

  final String prayerName;
  final DateTime prayerTime;
  final int currentPrayerTimeValue;
  final DateTime toPrayerTime;
  final DateTime fromPrayerTime;

  @override
  Widget build(BuildContext context) {
    final int currentTimeValue = context.watch<PrayerTimeState>().getMinutesOfDay;
    final bool isPrayerTime = currentTimeValue >= currentPrayerTimeValue - 59 && currentTimeValue <= currentPrayerTimeValue + 30;
    final bool isRemainingTime = currentTimeValue >= currentPrayerTimeValue - 59 && currentTimeValue < currentPrayerTimeValue;
    final bool isPastTime = currentTimeValue >= currentPrayerTimeValue + 1 && currentTimeValue <= currentPrayerTimeValue + 30;
    final appColors = Theme.of(context).colorScheme;
    return Expanded(
      child: Card(
        color: appColors.glassOnGlassCardColor,
        shape: RoundedRectangleBorder(
          borderRadius: AppWidgetStyle.mainBorderRadius,
          side: BorderSide(
            width: 3,
            color: isPrayerTime && isRemainingTime
                ? appColors.thirdAppColor
                : isPrayerTime && isPastTime
                    ? appColors.firstAppColor
                    : appColors.secondAppColor.withOpacity(isPrayerTime ? 1 : 0),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 75,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    prayerName,
                    style: TextStyle(
                      fontWeight: isPrayerTime ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  subtitle: Text(
                    DateFormat.Hm().format(prayerTime),
                    style: TextStyle(
                      fontWeight: isPrayerTime ? FontWeight.bold : FontWeight.normal,
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: isPrayerTime && isRemainingTime,
                child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      print('До молитвы');
                    },
                    radius: 25,
                    borderRadius: AppWidgetStyle.mainBorderRadius,
                    child: Image.asset(
                      'assets/icons/dua-hands.png',
                      width: 22.5,
                      height: 22.5,
                      color: appColors.thirdAppColor,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: !isRemainingTime && !isPastTime && isPrayerTime,
                child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      print('Во время азана');
                    },
                    radius: 25,
                    borderRadius: AppWidgetStyle.mainBorderRadius,
                    child: Image.asset(
                      'assets/icons/dua-hands.png',
                      width: 22.5,
                      height: 22.5,
                      color: appColors.secondAppColor,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: isPrayerTime && isPastTime,
                child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      print('После молитвы');
                    },
                    radius: 25,
                    borderRadius: AppWidgetStyle.mainBorderRadius,
                    child: Image.asset(
                      'assets/icons/dua-hands.png',
                      width: 22.5,
                      height: 22.5,
                      color: appColors.firstAppColor,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(seconds: 1),
                  style: TextStyle(
                    fontSize: isPrayerTime && isPastTime ? 14 : 0,
                  ),
                  child: Text(
                    DateFormat.m().format(fromPrayerTime),
                    style: TextStyle(
                      color: appColors.firstAppColor,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(seconds: 1),
                  style: TextStyle(
                    fontSize: isPrayerTime && isRemainingTime ? 14 : 0,
                  ),
                  child: Text(
                    '–${DateFormat.m().format(toPrayerTime)}',
                    style: TextStyle(
                      color: appColors.thirdAppColor,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                    ),
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
