import 'package:flutter/material.dart';
import 'package:majmua/application/state/country_coordinates_state.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';
import 'package:majmua/presentation/prayerTime/calculation_method_container.dart';
import 'package:majmua/presentation/prayerTime/select_city.dart';
import 'package:provider/provider.dart';

class RegionSettings extends StatelessWidget {
  const RegionSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выбор города'),
      ),
      body: Consumer<CountryCoordinatesState>(
        builder: (BuildContext context, countryCoordinationState, _) {
          return Column(
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
                      text: '${countryCoordinationState.getCountry}, ',
                      style: TextStyle(
                        color: appColors.mainTextColor,
                        fontSize: 18,
                        fontFamily: 'Nexa',
                      ),
                    ),
                    TextSpan(
                      text: countryCoordinationState.getCity,
                      style: TextStyle(
                        color: appColors.mainTextColor,
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
                      text: 'Долгота: ${countryCoordinationState.getLatitude.toStringAsFixed(5)}\n',
                      style: TextStyle(
                        color: appColors.mainTextColor,
                        fontSize: 18,
                        fontFamily: 'Nexa',
                      ),
                    ),
                    TextSpan(
                      text: 'Широта: ${countryCoordinationState.getLongitude.toStringAsFixed(5)}',
                      style: TextStyle(
                        color: appColors.mainTextColor,
                        fontSize: 18,
                        fontFamily: 'Nexa',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const CalculationMethodContainer(),
              const SizedBox(height: 8),
              Padding(
                padding: AppStyles.symmetricHorizontalPadding,
                child: MaterialButton(
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (_) => SelectCity(),
                    );
                  },
                  shape: AppStyles.mainCardBorderRadius,
                  color: appColors.firstAppColor,
                  child: const Text(
                    'Выбрать другой город',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
