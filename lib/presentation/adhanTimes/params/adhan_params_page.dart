import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/routes/route_names.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/presentation/adhanTimes/params/ars_time_madhab.dart';
import 'package:majmua/presentation/adhanTimes/params/calculation_methods.dart';
import 'package:majmua/presentation/adhanTimes/params/city_coordinates.dart';
import 'package:majmua/presentation/adhanTimes/params/param_button.dart';
import 'package:majmua/presentation/adhanTimes/params/time_offset_params.dart';
import 'package:majmua/presentation/widgets/description_params_text.dart';
import 'package:majmua/presentation/widgets/user_back_button.dart';

class AdhanParamsPage extends StatelessWidget {
  const AdhanParamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocale = AppLocalizations.of(context);
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
