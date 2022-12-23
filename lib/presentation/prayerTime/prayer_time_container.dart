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
        Row(
          children: [
            const SizedBox(width: 8),
            const Expanded(
              flex: 3,
              child: Card(
                elevation: 1,
                shape: AppStyles.mainCardBorderRadius,
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: AppStyles.mainPaddingMini,
                  child: Text(
                    'Турция, Стамбул',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'SF',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: Card(
                elevation: 0,
                shape: AppStyles.mainCardBorderRadius,
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
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
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
        const SizedBox(height: 4),
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
          mainAxisAlignment: MainAxisAlignment.center,
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
                      text: 'Последняя треть ночи: ',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: 'SF',
                      ),
                    ),
                    TextSpan(
                      text: DateFormat.Hm()
                          .format(_currentPrayerTimes.getThirdNightPart),
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
            _restTimes.dateTime.weekday == 5
                ? const SizedBox(width: 8)
                : const SizedBox(),
            _restTimes.dateTime.weekday == 5
                ? Container(
                    padding: AppStyles.mainPaddingMini,
                    decoration: const BoxDecoration(
                      borderRadius: AppStyles.mainBorderRadius,
                      color: Colors.white,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Последний час пятницы: ',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontFamily: 'SF',
                            ),
                          ),
                          TextSpan(
                            text: DateFormat.Hm()
                                .format(_currentPrayerTimes.getLastHourFriday),
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.teal,
                              fontFamily: 'SF',
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox(),
            const SizedBox(width: 8),
          ],
        ),
      ],
    );
  }
}
