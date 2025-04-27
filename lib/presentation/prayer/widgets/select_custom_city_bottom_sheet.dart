import 'package:flutter/material.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/city_state.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/city_entity.dart';
import '../../state/prayer_state.dart';
import 'change_city_bottom_sheet.dart';

class SelectCustomCityBottomSheet extends StatelessWidget {
  const SelectCustomCityBottomSheet({
    super.key,
    required this.cityModel,
    required this.cityState,
  });

  final CityEntity cityModel;
  final CityState cityState;

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Padding(
      padding: AppStyles.mardingWithoutTop,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Consumer<PrayerState>(
            builder: (context, prayerState, _) {
              return FilledButton.tonal(
                onPressed: () {
                  prayerState.changeCountry = cityModel.country;
                  prayerState.changeCity = cityModel.city;
                  prayerState.changeLatitude = double.parse(cityModel.latitude);
                  prayerState.changeLongitude = double.parse(cityModel.longitude);
                  prayerState.initPrayerTime();
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text(
                  appLocale.select,
                  style: AppStyles.mainTextStyle,
                ),
              );
            },
          ),
          FilledButton.tonal(
            onPressed: () {
              Navigator.pop(context);
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (newContext) => AnimatedPadding(
                  padding: MediaQuery.of(newContext).viewInsets,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.decelerate,
                  child: ChangeCityBottomSheet(
                    cityModel: cityModel,
                    cityState: cityState,
                  ),
                ),
              );
            },
            child: Text(
              appLocale.change,
              style: AppStyles.mainTextStyle,
            ),
          ),
          FilledButton.tonal(
            onPressed: () {
              cityState.deleteCity(idCity: cityModel.id);
              Navigator.pop(context);
            },
            child: Text(
              appLocale.delete,
              style: AppStyles.mainTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
