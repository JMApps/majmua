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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Турция, Стамбул'),
        const Divider(indent: 16, endIndent: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircularPrayer(
              prayerName: 'Фаджр',
              prayerTime: _currentPrayerTimes.getFajrTime,
              previousPrayerTimeValue: _currentPrayerTimes.getSecondNightValue,
              currentPrayerTimeValue: _currentPrayerTimes.getFajrTimeValue,
              remainingPrayerTime: _currentPrayerTimes.getRemainingFajrTime,
              pastPrayerTime: _currentPrayerTimes.getPastSecondNightTime,
            ),
            CircularPrayer(
              prayerName: 'Зухр',
              prayerTime: _currentPrayerTimes.getDhuhrTime,
              previousPrayerTimeValue: _currentPrayerTimes.getSunriseTimeValue,
              currentPrayerTimeValue: _currentPrayerTimes.getDhuhrTimeValue,
              remainingPrayerTime: _currentPrayerTimes.getRemainingDhuhrTime,
              pastPrayerTime: _currentPrayerTimes.getPastSunriseTime,
            ),
            CircularPrayer(
              prayerName: 'Аср',
              prayerTime: _currentPrayerTimes.getAsrTime,
              previousPrayerTimeValue: _currentPrayerTimes.getDhuhrTimeValue,
              currentPrayerTimeValue: _currentPrayerTimes.getAsrTimeValue,
              remainingPrayerTime: _currentPrayerTimes.getRemainingAsrTime,
              pastPrayerTime: _currentPrayerTimes.getPastDhuhrTime,
            ),
            CircularPrayer(
              prayerName: 'Магриб',
              prayerTime: _currentPrayerTimes.getMaghribTime,
              previousPrayerTimeValue: _currentPrayerTimes.getAsrTimeValue,
              currentPrayerTimeValue: _currentPrayerTimes.getMaghribTimeValue,
              remainingPrayerTime: _currentPrayerTimes.getRemainingMaghribTime,
              pastPrayerTime: _currentPrayerTimes.getPastAsrTime,
            ),
            CircularPrayer(
              prayerName: 'Иша',
              prayerTime: _currentPrayerTimes.getIshaTime,
              previousPrayerTimeValue: _currentPrayerTimes.getMaghribTimeValue,
              currentPrayerTimeValue: _currentPrayerTimes.getIshaTimeValue,
              remainingPrayerTime: _currentPrayerTimes.getRemainingIshaTime,
              pastPrayerTime: _currentPrayerTimes.getPastMaghribTime,
            ),
          ],
        ),
      ],
    );
  }
}
