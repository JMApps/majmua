import 'package:flutter/material.dart';
import 'package:majmua/presentation/prayerTime/circular_prayer.dart';
import 'package:majmua/presentation/prayerTime/current_prayer_times.dart';

class PrayerTimeContainer extends StatefulWidget {
  const PrayerTimeContainer({Key? key}) : super(key: key);

  @override
  State<PrayerTimeContainer> createState() => _PrayerTimeContainerState();
}

class _PrayerTimeContainerState extends State<PrayerTimeContainer> {
  final CurrentPrayerTimes _currentPrayerTimes = CurrentPrayerTimes();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircularPrayer(
          prayerName: 'Фаджр',
          prayerTime: _currentPrayerTimes.getFajrTime,
          currentPrayerTimeValue: _currentPrayerTimes.getSecondNightValue,
          nextPrayerTimeValue: _currentPrayerTimes.getFajrTimeValue,
          leftPrayerTime: _currentPrayerTimes.getFajrTime,
        ),
        CircularPrayer(
          prayerName: 'Рассвет',
          prayerTime: _currentPrayerTimes.getSunriseTime,
          currentPrayerTimeValue: _currentPrayerTimes.getSunriseTimeValue,
          nextPrayerTimeValue: _currentPrayerTimes.getDhuhrTimeValue,
          leftPrayerTime: _currentPrayerTimes.getSunriseTime,
        ),
        CircularPrayer(
          prayerName: 'Зухр',
          prayerTime: _currentPrayerTimes.getDhuhrTime,
          currentPrayerTimeValue: _currentPrayerTimes.getDhuhrTimeValue,
          nextPrayerTimeValue: _currentPrayerTimes.getAsrTimeValue,
          leftPrayerTime: _currentPrayerTimes.getDhuhrTime,
        ),
        CircularPrayer(
          prayerName: 'Аср',
          prayerTime: _currentPrayerTimes.getAsrTime,
          currentPrayerTimeValue: _currentPrayerTimes.getAsrTimeValue,
          nextPrayerTimeValue: _currentPrayerTimes.getMaghribTimeValue,
          leftPrayerTime: _currentPrayerTimes.getAsrTime,
        ),
        CircularPrayer(
          prayerName: 'Магриб',
          prayerTime: _currentPrayerTimes.getMaghribTime,
          currentPrayerTimeValue: _currentPrayerTimes.getMaghribTimeValue,
          nextPrayerTimeValue: _currentPrayerTimes.getIshaTimeValue,
          leftPrayerTime: _currentPrayerTimes.getMaghribTime,
        ),
        CircularPrayer(
          prayerName: 'Иша',
          prayerTime: _currentPrayerTimes.getIshaTime,
          currentPrayerTimeValue: _currentPrayerTimes.getIshaTimeValue,
          nextPrayerTimeValue: _currentPrayerTimes.getSecondNightValue,
          leftPrayerTime: _currentPrayerTimes.getIshaTime,
        ),
      ],
    );
  }
}
