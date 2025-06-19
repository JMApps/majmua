import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/app_route_names.dart';
import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/prayer_state.dart';
import '../widgets/prayer_params_description_text.dart';

class PrayerParamsPage extends StatelessWidget {
  const PrayerParamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocale.prayerParams),
      ),
      body: SingleChildScrollView(
        padding: AppStyles.mainMardingMini,
        child: Consumer<PrayerState>(
          builder: (context, prayerState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  child: Padding(
                    padding: AppStyles.mainMardingMini,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        PrayerParamsDescriptionText(text: appLocale.selectedCity),
                        Text(
                          '${prayerState.country},',
                          style: AppStyles.mainTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          prayerState.city,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: appColors.primary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        PrayerParamsDescriptionText(text: appLocale.coordinates),
                        Text(
                          prayerState.latitude.toString(),
                          style: TextStyle(
                            fontSize: 18.0,
                            color: appColors.tertiary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          prayerState.longitude.toString(),
                          style: TextStyle(
                            fontSize: 18.0,
                            color: appColors.tertiary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        FilledButton.tonal(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRouteNames.pageSelectCity,
                            );
                          },
                          child: Text(
                            appLocale.selectCity,
                            style: AppStyles.mainTextStyleMini,
                          ),
                        ),
                        FilledButton.tonal(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRouteNames.pageAddCity,
                            );
                          },
                          child: Text(
                            appLocale.addCity,
                            style: AppStyles.mainTextStyleMini,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 10),
                    PrayerParamsDescriptionText(text: appLocale.calculationPrayerMethod),
                    const SizedBox(height: 8),
                    Card(
                      child: DropdownButton<int>(
                        isExpanded: true,
                        padding: AppStyles.mardingHorizontalMini,
                        borderRadius: AppStyles.mainBorderMini,
                        elevation: 1,
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        alignment: Alignment.center,
                        value: prayerState.calculationMethodIndex,
                        items: List.generate(
                          AppStringConstraints.prayerCalculationNames.length,
                          (index) {
                            return DropdownMenuItem<int>(
                              value: index,
                              child: Center(
                                child: Text(
                                  AppStringConstraints.prayerCalculationNames[index],
                                  style: prayerState.calculationMethodIndex == index ? TextStyle(
                                    fontSize: 16.0,
                                    color: appColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ) : AppStyles.mainTextStyleMini,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          },
                        ),
                        onChanged: (newIndex) => prayerState.setCalculationIndex = newIndex!,
                        underline: const SizedBox(),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 10),
                    PrayerParamsDescriptionText(text: appLocale.highLatitude),
                    const SizedBox(height: 8),
                    Card(
                      child: DropdownButton<int>(
                        isExpanded: true,
                        padding: AppStyles.mardingHorizontalMini,
                        borderRadius: AppStyles.mainBorderMini,
                        elevation: 1,
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        alignment: Alignment.center,
                        value: prayerState.highLatitudeMethodIndex,
                        items: List.generate(
                          AppStringConstraints.highLatitudeNames.length,
                          (index) {
                            return DropdownMenuItem<int>(
                              value: index,
                              child: Center(
                                child: Text(
                                  AppStringConstraints.highLatitudeNames[index],
                                  style: prayerState.highLatitudeMethodIndex == index ? TextStyle(
                                    fontSize: 16.0,
                                    color: appColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ) : AppStyles.mainTextStyleMini,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          },
                        ),
                        onChanged: (newIndex) => prayerState.setHighLatitudeIndex = newIndex!,
                        underline: const SizedBox(),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 10),
                    PrayerParamsDescriptionText(text: appLocale.madhabMethod),
                    const SizedBox(height: 8),
                    Card(
                      child: DropdownButton<int>(
                        isExpanded: true,
                        padding: AppStyles.mardingHorizontalMini,
                        borderRadius: AppStyles.mainBorderMini,
                        elevation: 1,
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        alignment: Alignment.center,
                        value: prayerState.madhabIndex,
                        items: List.generate(
                          AppStringConstraints.asrMethodNames.length,
                          (index) {
                            return DropdownMenuItem<int>(
                              value: index,
                              child: Center(
                                child: Text(
                                  AppStringConstraints.asrMethodNames[index],
                                  style: prayerState.madhabIndex == index ? TextStyle(
                                    fontSize: 16.0,
                                    color: appColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ) : AppStyles.mainTextStyleMini,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          },
                        ),
                        onChanged: (newIndex) => prayerState.setMadhabIndex = newIndex!,
                        underline: const SizedBox(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ListTile(
                  shape: AppStyles.mainShapeMini,
                  title: Text(appLocale.timeOffset, style: AppStyles.mainTextStyleMiniBold),
                  trailing: Switch(
                    value: prayerState.dst,
                    onChanged: (onChanged) {
                      HapticFeedback.lightImpact();
                      prayerState.setDst = onChanged;
                    },
                  ),
                ),
                const SizedBox(height: 4),
                FilledButton.tonal(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRouteNames.pageAdjustments,
                    );
                  },
                  child: Text(
                    appLocale.adjustmentTimes,
                    style: AppStyles.mainTextStyleMini,
                  ),
                ),
                FilledButton.tonalIcon(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRouteNames.pageInformation,
                    );
                  },
                  label: Text(
                    appLocale.information,
                    style: AppStyles.mainTextStyleMini,
                  ),
                  icon: const Icon(Icons.info_outline),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
