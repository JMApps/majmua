import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:majmua/application/state/country_coordinates_state.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';
import 'package:majmua/presentation/prayerTime/circular_prayer.dart';
import 'package:provider/provider.dart';

class PrayerTimeContainer extends StatelessWidget {
  const PrayerTimeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Consumer<CountryCoordinatesState>(
      builder: (BuildContext context, countryCoordinatesState, _) {
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
                '${countryCoordinatesState.getCountry}, ${countryCoordinatesState.getCity}',
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
                  prayerTime: countryCoordinatesState.getPrayerTime.fajr,
                  previousPrayerTimeValue: countryCoordinatesState.getSecondNightValueInMinutes,
                  currentPrayerTimeValue: countryCoordinatesState.getFajrValueInMinutes,
                ),
                CircularPrayer(
                  prayerName: 'Восход',
                  prayerTime: countryCoordinatesState.getPrayerTime.sunrise,
                  previousPrayerTimeValue: countryCoordinatesState.getFajrValueInMinutes,
                  currentPrayerTimeValue: countryCoordinatesState.getSunriseValueInMinutes,
                ),
                CircularPrayer(
                  prayerName: 'Зухр',
                  prayerTime: countryCoordinatesState.getPrayerTime.dhuhr,
                  previousPrayerTimeValue: countryCoordinatesState.getSunriseValueInMinutes,
                  currentPrayerTimeValue: countryCoordinatesState.getDhuhrValueInMinutes,
                ),
                CircularPrayer(
                  prayerName: 'Аср',
                  prayerTime: countryCoordinatesState.getPrayerTime.asr,
                  previousPrayerTimeValue: countryCoordinatesState.getDhuhrValueInMinutes,
                  currentPrayerTimeValue: countryCoordinatesState.getAsrValueInMinutes,
                ),
                CircularPrayer(
                  prayerName: 'Магриб',
                  prayerTime: countryCoordinatesState.getPrayerTime.maghrib,
                  previousPrayerTimeValue: countryCoordinatesState.getAsrValueInMinutes,
                  currentPrayerTimeValue: countryCoordinatesState.getMaghribValueInMinutes,
                ),
                CircularPrayer(
                  prayerName: 'Иша',
                  prayerTime: countryCoordinatesState.getPrayerTime.isha,
                  previousPrayerTimeValue: countryCoordinatesState.getMaghribValueInMinutes,
                  currentPrayerTimeValue: countryCoordinatesState.getIshaValueInMinutes,
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
                    text: DateFormat.Hm().format(countryCoordinatesState.getThirdNightPart),
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
      },
    );
  }
}
