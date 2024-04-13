import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/state/adhan_time_state.dart';
import 'package:majmua/presentation/widgets/select_other_city_button.dart';
import 'package:provider/provider.dart';

class QiblaDirection extends StatelessWidget {
  const QiblaDirection({
    super.key,
    required this.qiblaDirection,
  });

  final double qiblaDirection;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Padding(
      padding: AppStyles.mardingHorizontal,
      child: Consumer<AdhanTimeState>(
        builder: (BuildContext context, AdhanTimeState adhanTimeState, _) {
          return Column(
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
                      text: '${adhanTimeState.country}, ',
                      style: TextStyle(
                        color: appColors.onSurface,
                        fontSize: 18,
                        fontFamily: 'Raleway',
                      ),
                    ),
                    TextSpan(
                      text: adhanTimeState.city,
                      style: TextStyle(
                        color: appColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'Raleway',
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
                        fontFamily: 'Raleway',
                      ),
                    ),
                    TextSpan(
                      text: adhanTimeState.latitude.toString(),
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
                        fontFamily: 'Raleway',
                      ),
                    ),
                    TextSpan(
                      text: adhanTimeState.longitude.toString(),
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
          );
        },
      ),
    );
  }
}
