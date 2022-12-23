import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/presentation/prayerTime/circular_prayer.dart';
import 'package:majmua/presentation/prayerTime/current_prayer_times.dart';
import 'package:majmua/presentation/restTime/rest_times.dart';

class PrayerTimeContainer extends StatefulWidget {
  const PrayerTimeContainer({Key? key}) : super(key: key);

  @override
  State<PrayerTimeContainer> createState() => _PrayerTimeContainerState();
}

class _PrayerTimeContainerState extends State<PrayerTimeContainer> {
  final CurrentPrayerTimes _currentPrayerTimes = CurrentPrayerTimes();
  final RestTimes _restTimes = RestTimes();

  @override
  Widget build(BuildContext context) {
    return Column(
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
              pastPrayerTime: _currentPrayerTimes.getPastFajrTime,
            ),
            CircularPrayer(
              prayerName: 'Зухр',
              prayerTime: _currentPrayerTimes.getDhuhrTime,
              previousPrayerTimeValue: _currentPrayerTimes.getFajrTimeValue,
              currentPrayerTimeValue: _currentPrayerTimes.getDhuhrTimeValue,
              remainingPrayerTime: _currentPrayerTimes.getRemainingDhuhrTime,
              pastPrayerTime: _currentPrayerTimes.getPastDhuhrTime,
            ),
            CircularPrayer(
              prayerName: '\'Аср',
              prayerTime: _currentPrayerTimes.getAsrTime,
              previousPrayerTimeValue: _currentPrayerTimes.getDhuhrTimeValue,
              currentPrayerTimeValue: _currentPrayerTimes.getAsrTimeValue,
              remainingPrayerTime: _currentPrayerTimes.getRemainingAsrTime,
              pastPrayerTime: _currentPrayerTimes.getPastAsrTime,
            ),
            CircularPrayer(
              prayerName: 'Магриб',
              prayerTime: _currentPrayerTimes.getMaghribTime,
              previousPrayerTimeValue: _currentPrayerTimes.getAsrTimeValue,
              currentPrayerTimeValue: _currentPrayerTimes.getMaghribTimeValue,
              remainingPrayerTime: _currentPrayerTimes.getRemainingMaghribTime,
              pastPrayerTime: _currentPrayerTimes.getPastMaghribTime,
            ),
            CircularPrayer(
              prayerName: '\'Иша',
              prayerTime: _currentPrayerTimes.getIshaTime,
              previousPrayerTimeValue: _currentPrayerTimes.getMaghribTimeValue,
              currentPrayerTimeValue: _currentPrayerTimes.getIshaTimeValue,
              remainingPrayerTime: _currentPrayerTimes.getRemainingIshaTime,
              pastPrayerTime: _currentPrayerTimes.getPastIshaTime,
            ),
          ],
        ),
        const Divider(indent: 16, endIndent: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(width: 8),
            Container(
              padding: AppStyles.mainPaddingMini,
              decoration: const BoxDecoration(
                borderRadius: AppStyles.mainBorderRadius,
                color: Colors.white,
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Восход солнца: ',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: 'SF',
                      ),
                    ),
                    TextSpan(
                      text: DateFormat.Hm().format(_currentPrayerTimes.getSunriseTime),
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.teal,
                        fontFamily: 'SF',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: AppStyles.mainPaddingMini,
              decoration: const BoxDecoration(
                borderRadius: AppStyles.mainBorderRadius,
                color: Colors.white,
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Последняя треть ночи: ',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: 'SF',
                      ),
                    ),
                    TextSpan(
                      text: DateFormat.Hm().format(_currentPrayerTimes.getThirdNightPart),
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.indigo,
                        fontFamily: 'SF',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
        _restTimes.dateTime.weekday == 5
            ? const Divider(indent: 16, endIndent: 16)
            : const SizedBox(),
        _restTimes.dateTime.weekday == 5
            ? RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Последний час пятницы в ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'SF',
                      ),
                    ),
                    TextSpan(
                      text: '${DateFormat.Hm().format(_currentPrayerTimes.getLastHourFriday)} 🤲',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.teal,
                        fontFamily: 'SF',
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
