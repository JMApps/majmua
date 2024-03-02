import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:provider/provider.dart';

import '../../core/strings/app_strings.dart';
import '../../core/styles/app_styles.dart';
import '../state/app_counter_state.dart';

class CounterValuesDropbutton extends StatelessWidget {
  const CounterValuesDropbutton({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Consumer<AppCounterState>(
      builder: (BuildContext context, AppCounterState appCounterState, _) {
        return Card(
          margin: AppStyles.mardingWithoutBottom,
          shape: AppStyles.mainShapeMini,
          color: appColors.glass,
          child: ButtonTheme(
            alignedDropdown: true,
            child: Padding(
              padding: AppStyles.mainMarding,
              child: DropdownButton<String>(
                value: AppStrings.getCounterValues(locale: appLocale!.localeName)[appCounterState.getCountValuesIndex],
                borderRadius: AppStyles.mainBorderRadiusMini,
                elevation: 0,
                isExpanded: true,
                alignment: AlignmentDirectional.center,
                dropdownColor: appColors.surface,
                style: TextStyle(
                  fontSize: 16,
                  color: appColors.inverseSurface,
                  fontFamily: 'Nexa',
                ),
                underline: const SizedBox(),
                onChanged: (String? value) {
                  appCounterState.setCountValuesIndex = AppStrings.getCounterValues(locale: appLocale.localeName).indexOf(value!);
                },
                items: AppStrings.getCounterValues(locale: appLocale.localeName).map<DropdownMenuItem<String>>(
                  (dynamic value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Center(
                        child: Text(
                          value,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
