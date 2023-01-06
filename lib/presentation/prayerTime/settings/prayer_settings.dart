import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/state/country_coordinates_state.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';
import 'package:majmua/presentation/prayerTime/settings/calculation_madhab_container.dart';
import 'package:majmua/presentation/prayerTime/settings/calculation_method_container.dart';
import 'package:majmua/presentation/prayerTime/settings/calculation_utc_offset_container.dart';
import 'package:provider/provider.dart';

class RegionSettings extends StatelessWidget {
  const RegionSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Параметры'),
      ),
      body: Consumer<CountryCoordinatesState>(
        builder: (BuildContext context, countryCoordinationState, _) {
          return CupertinoScrollbar(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 8),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Выбраный город:\n',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 18,
                            fontFamily: 'Nexa',
                          ),
                        ),
                        TextSpan(
                          text: countryCoordinationState.getCountry.isNotEmpty
                              ? '${countryCoordinationState.getCountry}, '
                              : '',
                          style: TextStyle(
                            color: appColors.mainTextColor,
                            fontSize: 18,
                            fontFamily: 'Nexa',
                          ),
                        ),
                        TextSpan(
                          text: countryCoordinationState.getCity,
                          style: TextStyle(
                            color: appColors.firstAppColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'Nexa',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Координаты:\n',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 18,
                            fontFamily: 'Nexa',
                          ),
                        ),
                        TextSpan(
                          text: 'Широта: ',
                          style: TextStyle(
                            color: appColors.mainTextColor,
                            fontSize: 18,
                            fontFamily: 'Nexa',
                          ),
                        ),
                        TextSpan(
                          text:
                              '${countryCoordinationState.getLatitude.toStringAsFixed(5)}\n',
                          style: TextStyle(
                            color: appColors.firstAppColor,
                            fontSize: 18,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'Долгота: ',
                          style: TextStyle(
                            color: appColors.mainTextColor,
                            fontSize: 18,
                            fontFamily: 'Nexa',
                          ),
                        ),
                        TextSpan(
                          text: countryCoordinationState.getLongitude
                              .toStringAsFixed(5),
                          style: TextStyle(
                            color: appColors.firstAppColor,
                            fontSize: 18,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  const CalculationMethodContainer(),
                  const SizedBox(height: 4),
                  const CalculationUtcOffsetContainer(),
                  const SizedBox(height: 4),
                  const CalculationMadhabContainer(),
                  const SizedBox(height: 4),
                  Padding(
                    padding: AppStyles.symmetricHorizontalPadding,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'select_coordinates_city_page');
                      },
                      shape: AppStyles.mainCardBorderRadius,
                      color: appColors.firstAppColor,
                      child: const Text(
                        'Выбрать город',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: AppStyles.symmetricHorizontalPadding,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'add_coordinates_city_page');
                      },
                      shape: AppStyles.mainCardBorderRadius,
                      color: appColors.firstAppColor,
                      child: const Text(
                        'Добавить город',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: AppStyles.symmetricHorizontalPadding,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'adhan_information_page');
                      },
                      shape: AppStyles.mainCardBorderRadius,
                      color: appColors.firstAppColor,
                      child: const Text(
                        'Информация',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
