import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/adhanTimes/models/prayer_params_model.dart';
import 'package:majmua/presentation/widgets/select_other_city_button.dart';

class QiblaDirection extends StatelessWidget {
  const QiblaDirection({
    super.key,
    required this.prayerParamsModel,
    required this.qiblaDirection,
  });

  final PrayerParamsModel prayerParamsModel;
  final double qiblaDirection;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Padding(
      padding: AppStyles.mardingHorizontal,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            title: Text(
              '${appLocale!.qiblaOn} ${qiblaDirection.toStringAsFixed(1)}°',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            tileColor: appColors.primaryContainer,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${prayerParamsModel.country}, ',
                  style: TextStyle(
                    color: appColors.onSurface,
                    fontSize: 18,
                    fontFamily: 'Nexa',
                  ),
                ),
                TextSpan(
                  text: prayerParamsModel.city,
                  style: TextStyle(
                    color: appColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Nexa',
                  ),
                ),
              ],
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: appLocale.latitude,
                  style: TextStyle(
                    color: appColors.onSurface,
                    fontSize: 18,
                    fontFamily: 'Nexa',
                  ),
                ),
                TextSpan(
                  text: '${prayerParamsModel.latitude}',
                  style: TextStyle(
                    color: appColors.quaternaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Bitter',
                  ),
                ),
              ],
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: appLocale.longitude,
                  style: TextStyle(
                    color: appColors.onSurface,
                    fontSize: 18,
                    fontFamily: 'Nexa',
                  ),
                ),
                TextSpan(
                  text: '${prayerParamsModel.longitude}',
                  style: TextStyle(
                    color: appColors.quaternaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Bitter',
                  ),
                ),
              ],
            ),
          ),
          const SelectOtherCityButton(),
          Text(
            appLocale.qiblaInformation,
            style: const TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
