import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';
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
    final appColors = Theme.of(context).colorScheme;
    return Column(
      children: [
        TextButton.icon(
          onPressed: () {
            Navigator.pushNamed(context, 'region_settings_page');
          },
          style: TextButton.styleFrom(
              padding: AppStyles.symmetricHorizontalPaddingMini,
              minimumSize: const Size(0, 16),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              alignment: Alignment.centerLeft),
          label: Text(
            'Турция, Стамбул',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: appColors.mainTextColor,
            ),
            textAlign: TextAlign.center,
          ),
          icon: const Icon(
            Icons.info_outline,
            size: 20,
          ),
        ),
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
              prayerName: 'Восход',
              prayerTime: _currentPrayerTimes.getSunriseTime,
              previousPrayerTimeValue: _currentPrayerTimes.getFajrTimeValue,
              currentPrayerTimeValue: _currentPrayerTimes.getSunriseTimeValue,
              remainingPrayerTime: _currentPrayerTimes.getRemainingSunriseTime,
              pastPrayerTime: _currentPrayerTimes.getPastSunriseTime,
            ),
            CircularPrayer(
              prayerName: 'Зухр',
              prayerTime: _currentPrayerTimes.getDhuhrTime,
              previousPrayerTimeValue: _currentPrayerTimes.getSunriseTimeValue,
              currentPrayerTimeValue: _currentPrayerTimes.getDhuhrTimeValue,
              remainingPrayerTime: _currentPrayerTimes.getRemainingDhuhrTime,
              pastPrayerTime: _currentPrayerTimes.getPastDhuhrTime,
            ),
            CircularPrayer(
              prayerName: 'Аср',
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
              prayerName: 'Иша',
              prayerTime: _currentPrayerTimes.getIshaTime,
              previousPrayerTimeValue: _currentPrayerTimes.getMaghribTimeValue,
              currentPrayerTimeValue: _currentPrayerTimes.getIshaTimeValue,
              remainingPrayerTime: _currentPrayerTimes.getRemainingIshaTime,
              pastPrayerTime: _currentPrayerTimes.getPastIshaTime,
            ),
          ],
        ),
        const Divider(indent: 16, endIndent: 16),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Последняя треть ночи: ',
                style: TextStyle(
                  color: appColors.mainTextColor,
                  fontFamily: 'Nexa',
                ),
              ),
              TextSpan(
                text: DateFormat.Hm()
                    .format(_currentPrayerTimes.getThirdNightPart),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: appColors.lastThirdHourColor,
                  fontFamily: 'Nexa',
                ),
              ),
            ],
          ),
        ),
        const Divider(indent: 16, endIndent: 16),
      ],
    );
  }
}
