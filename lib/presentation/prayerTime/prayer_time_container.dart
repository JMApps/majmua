import 'package:adhan/adhan.dart';
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
        return SingleChildScrollView(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'region_settings_page');
                },
                style: TextButton.styleFrom(
                  padding: AppStyles.symmetricHorizontalPaddingMini,
                  minimumSize: const Size(0, 16),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.centerLeft,
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            '${countryCoordinatesState.getCountry}${countryCoordinatesState.getCountry.isNotEmpty ? ', ' : ''}${countryCoordinatesState.getCity}',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: appColors.mainTextColor,
                            fontFamily: 'Nexa'),
                      ),
                      TextSpan(
                        text: '\n(изменить)',
                        style: TextStyle(
                            fontSize: 10,
                            color: appColors.thirdAppColor,
                            fontFamily: 'Nexa'),
                      ),
                    ],
                  ),
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
                    toPrayerTime: countryCoordinatesState.toPrayerTime(Prayer.fajr),
                    fromPrayerTime: countryCoordinatesState.fromPrayerTime(Prayer.fajr),
                  ),
                  CircularPrayer(
                    prayerName: 'Восход',
                    prayerTime: countryCoordinatesState.getPrayerTime.sunrise,
                    previousPrayerTimeValue: countryCoordinatesState.getFajrValueInMinutes,
                    currentPrayerTimeValue: countryCoordinatesState.getSunriseValueInMinutes,
                    toPrayerTime: countryCoordinatesState.toPrayerTime(Prayer.sunrise),
                    fromPrayerTime: countryCoordinatesState.fromPrayerTime(Prayer.sunrise),
                  ),
                  CircularPrayer(
                    prayerName: 'Зухр',
                    prayerTime: countryCoordinatesState.getPrayerTime.dhuhr,
                    previousPrayerTimeValue: countryCoordinatesState.getSunriseValueInMinutes,
                    currentPrayerTimeValue: countryCoordinatesState.getDhuhrValueInMinutes,
                    toPrayerTime: countryCoordinatesState.toPrayerTime(Prayer.dhuhr),
                    fromPrayerTime: countryCoordinatesState.fromPrayerTime(Prayer.dhuhr),
                  ),
                  CircularPrayer(
                    prayerName: 'Аср',
                    prayerTime: countryCoordinatesState.getPrayerTime.asr,
                    previousPrayerTimeValue: countryCoordinatesState.getDhuhrValueInMinutes,
                    currentPrayerTimeValue: countryCoordinatesState.getAsrValueInMinutes,
                    toPrayerTime: countryCoordinatesState.toPrayerTime(Prayer.asr),
                    fromPrayerTime: countryCoordinatesState.fromPrayerTime(Prayer.asr),
                  ),
                  CircularPrayer(
                    prayerName: 'Магриб',
                    prayerTime: countryCoordinatesState.getPrayerTime.maghrib,
                    previousPrayerTimeValue: countryCoordinatesState.getAsrValueInMinutes,
                    currentPrayerTimeValue: countryCoordinatesState.getMaghribValueInMinutes,
                    toPrayerTime: countryCoordinatesState.toPrayerTime(Prayer.maghrib),
                    fromPrayerTime: countryCoordinatesState.fromPrayerTime(Prayer.maghrib),
                  ),
                  CircularPrayer(
                    prayerName: 'Иша',
                    prayerTime: countryCoordinatesState.getPrayerTime.isha,
                    previousPrayerTimeValue: countryCoordinatesState.getMaghribValueInMinutes,
                    currentPrayerTimeValue: countryCoordinatesState.getIshaValueInMinutes,
                    toPrayerTime: countryCoordinatesState.toPrayerTime(Prayer.isha),
                    fromPrayerTime: countryCoordinatesState.fromPrayerTime(Prayer.isha),
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
                        color: appColors.secondAppColor,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(indent: 16, endIndent: 16),
            ],
          ),
        );
      },
    );
  }
}
