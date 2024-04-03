import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/domain/entities/city_entity.dart';
import 'package:majmua/presentation/state/adhan_time_state.dart';
import 'package:provider/provider.dart';

class SearchCityItem extends StatelessWidget {
  const SearchCityItem({
    super.key,
    required this.cityModel,
    required this.index,
  });

  final CityEntity cityModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final Color itemOddColor = appColors.primaryColor.withOpacity(0.05);
    final Color itemEvenColor = appColors.primaryColor.withOpacity(0.15);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Consumer<AdhanTimeState>(
        builder: (BuildContext context, AdhanTimeState adhanTimeState, _) {
          return ListTile(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: appColors.surface,
                builder: (context) => Container(
                  padding: AppStyles.mardingHorizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FilledButton.tonal(
                        onPressed: () {
                          adhanTimeState.setCountry = cityModel.country;
                          adhanTimeState.setCity = cityModel.city;
                          adhanTimeState.setLatitude = double.parse(cityModel.latitude);
                          adhanTimeState.setLongitude = double.parse(cityModel.longitude);
                          adhanTimeState.initPrayerTime();
                          Navigator.pop(context);
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          appLocale!.select,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      FilledButton.tonal(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          appLocale.cancel,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              );
            },
            tileColor: index.isOdd ? itemOddColor : itemEvenColor,
            visualDensity: const VisualDensity(vertical: -4),
            title: Text(
              cityModel.city,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              cityModel.country,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: appColors.quaternaryColor,
              child: Text(
                cityModel.iso3,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
