import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/state/adhan_time_state.dart';
import 'package:provider/provider.dart';

class CityCoordinates extends StatelessWidget {
  const CityCoordinates({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Consumer<AdhanTimeState>(
      builder: (BuildContext context, AdhanTimeState adhanTimeState, _) {
        return Card(
          margin: EdgeInsets.zero,
          shape: AppStyles.mainShapeMini,
          color: appColors.glass,
          child: Padding(
            padding: AppStyles.mainMardingMini,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  appLocale!.selectedCity,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${adhanTimeState.country}, ',
                        style: TextStyle(
                          color: appColors.onSurface,
                          fontSize: 18,
                          fontFamily: 'Nexa',
                        ),
                      ),
                      TextSpan(
                        text: adhanTimeState.city,
                        style: TextStyle(
                          fontSize: 18,
                          color: appColors.quaternaryColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nexa',
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  appLocale.coordinates,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: appLocale.latitude,
                        style: TextStyle(
                          fontSize: 18,
                          color: appColors.onSurface,
                          fontFamily: 'Nexa',
                        ),
                      ),
                      TextSpan(
                        text: adhanTimeState.latitude.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          color: appColors.quaternaryColor,
                          fontFamily: 'Nexa',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: appLocale.longitude,
                        style: TextStyle(
                          fontSize: 18,
                          color: appColors.onSurface,
                          fontFamily: 'Nexa',
                        ),
                      ),
                      TextSpan(
                        text: adhanTimeState.longitude.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          color: appColors.quaternaryColor,
                          fontFamily: 'Nexa',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
