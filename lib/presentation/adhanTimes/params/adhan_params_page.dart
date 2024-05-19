import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/routes/route_names.dart';
import '../../../core/styles/app_styles.dart';
import '../../widgets/description_params_text.dart';
import '../../widgets/user_back_button.dart';
import 'ars_time_madhab.dart';
import 'calculation_methods.dart';
import 'city_coordinates.dart';
import 'param_button.dart';
import 'selectCity/high_latitude_methods.dart';
import 'time_offset_params.dart';

class AdhanParamsPage extends StatelessWidget {
  const AdhanParamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    final appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocale!.adhanParams),
        leading: const UserBackButton(),
      ),
      body: CupertinoScrollbar(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: AppStyles.mainMardingMini,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  borderRadius: AppStyles.mainBorderRadiusMini,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const CityCoordinates(),
                    const SizedBox(height: 4),
                    DescriptionParamsText(text: appLocale.calculationMethod),
                    const SizedBox(height: 8),
                    const CalculationMethods(),
                    const SizedBox(height: 8),
                    ListTile(
                      visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                      title: Center(child: Text(appLocale.highLatitudeMethod)),
                      titleTextStyle: TextStyle(
                        fontSize: 16,
                        color: appColors.onSurface,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RouteNames.highLatitudePage);
                        },
                        icon: const Icon(Icons.info_outline),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const HighLatitudeMethods(),
                    const SizedBox(height: 8),
                    DescriptionParamsText(text: appLocale.asrMadhabMethod),
                    const SizedBox(height: 8),
                    const AsrTimeMadhab(),
                    const SizedBox(height: 8),
                    DescriptionParamsText(text: appLocale.timeOffset),
                    const SizedBox(height: 8),
                    const TimeOffsetParams(),
                    const SizedBox(height: 8),
                    ParamButton(
                      description: appLocale.selectCity,
                      routeName: RouteNames.selectCityPage,
                    ),
                    ParamButton(
                      description: appLocale.addMyCity,
                      routeName: RouteNames.addCityPage,
                    ),
                    ParamButton(
                      description: appLocale.prayerTimeAdjustment,
                      routeName: RouteNames.prayerTimeAdjustmentPage,
                    ),
                    ParamButton(
                      description: appLocale.information,
                      routeName: RouteNames.informationPage,
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
