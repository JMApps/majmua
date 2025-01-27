import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/city_entity.dart';
import '../../state/prayer_state.dart';

class SelectCityBottomSheet extends StatelessWidget {
  const SelectCityBottomSheet({
    super.key,
    required this.cityModel,
  });

  final CityEntity cityModel;

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
                  prayerState.changCountry = cityModel.country;
                  prayerState.changeCity = cityModel.city;
                  prayerState.setLatitude = double.parse(cityModel.latitude);
                  prayerState.setLongitude = double.parse(cityModel.longitude);
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
            },
            child: Text(
              appLocale.cancel,
              style: AppStyles.mainTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
