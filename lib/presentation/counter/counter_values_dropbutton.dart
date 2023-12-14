import 'package:flutter/material.dart';
import 'package:majmua/core/strings/app_strings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/state/app_counter_state.dart';
import 'package:provider/provider.dart';

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
              padding: AppStyles.mainMardingMini,
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
                  fontFamily: 'Naskh Arabic',
                ),
                underline: const SizedBox(),
                onChanged: (String? value) {
                  appCounterState.setCountValuesIndex = AppStrings.getCounterValues(locale: appLocale.localeName).indexOf(value!);
                },
                items: AppStrings.getCounterValues(locale: appLocale.localeName).map<DropdownMenuItem<String>>((String value) {
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
