import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:majmua/application/state/country_coordinates_state.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';
import 'package:provider/provider.dart';

class CircularPrayer extends StatelessWidget {
  const CircularPrayer({
    Key? key,
    required this.prayerName,
    required this.prayerTime,
    required this.previousPrayerTimeValue,
    required this.currentPrayerTimeValue,
    required this.toPrayerTime,
    required this.fromPrayerTime,
  }) : super(key: key);

  final String prayerName;
  final DateTime prayerTime;
  final int previousPrayerTimeValue;
  final int currentPrayerTimeValue;
  final DateTime toPrayerTime;
  final DateTime fromPrayerTime;

  @override
  Widget build(BuildContext context) {
    int currentTime = context.watch<CountryCoordinatesState>().getMinuteOfDay;
    bool isPrayerTime = currentTime >= currentPrayerTimeValue - 59 &&
        currentTime <= currentPrayerTimeValue + 30;
    bool isRemainingTime = currentTime >= currentPrayerTimeValue - 59 &&
        currentTime < currentPrayerTimeValue;
    bool isPastTime = currentTime >= currentPrayerTimeValue + 1 &&
        currentTime <= currentPrayerTimeValue + 30;
    final appColors = Theme.of(context).colorScheme;
    return Column(
      children: [
        Text(
          prayerName,
          style: TextStyle(
            fontSize: 12,
            color: isPrayerTime
                ? appColors.thirdAppColor
                : appColors.mainTextColor,
            fontWeight: isPrayerTime ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        const SizedBox(height: 4),
        Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: AppStyles.topCardBorderRadius,
          color:
              isPrayerTime ? appColors.thirdAppColor : appColors.secondAppColor,
          child: Padding(
            padding: AppStyles.mainPaddingMini,
            child: Text(
              DateFormat.Hm().format(prayerTime).substring(0, 2),
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Lato',
                color: Colors.white,
              ),
            ),
          ),
        ),
        Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: AppStyles.bottomCardBorderRadius,
          color: appColors.firstAppColor,
          child: Padding(
            padding: AppStyles.mainPaddingMini,
            child: Text(
              DateFormat.Hm().format(prayerTime).substring(3),
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Lato',
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        AnimatedSize(
          duration: const Duration(milliseconds: 750),
          child: Visibility(
            visible: isPrayerTime && isRemainingTime,
            child: Text(
              '-${DateFormat.m().format(toPrayerTime)}',
              style: TextStyle(
                fontSize: 13,
                color: appColors.mainTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 750),
          child: Visibility(
            visible: isPrayerTime && isPastTime,
            child: Text(
              DateFormat.m().format(fromPrayerTime),
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
