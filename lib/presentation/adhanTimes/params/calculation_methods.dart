import 'package:flutter/material.dart';
import 'package:majmua/core/strings/app_strings.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/state/adhan_time_state.dart';
import 'package:provider/provider.dart';

class CalculationMethods extends StatelessWidget {
  const CalculationMethods({super.key});

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).colorScheme;
    return Consumer<AdhanTimeState>(
      builder: (BuildContext context, AdhanTimeState adhanTimeState, _) {
        return Card(
          margin: EdgeInsets.zero,
          shape: AppStyles.mainShapeMini,
          color: appColor.glass,
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton<String>(
              value: AppStrings.prayerCalculationNames[adhanTimeState.calculationMethodIndex],
              borderRadius: AppStyles.mainBorderRadiusMini,
              elevation: 0,
              isExpanded: true,
              alignment: AlignmentDirectional.center,
              dropdownColor: appColor.surface,
              style: TextStyle(
                fontSize: 16,
                color: appColor.inverseSurface,
                fontFamily: 'Nexa',
              ),
              underline: const SizedBox(),
              onChanged: (String? value) {
                adhanTimeState.setCalculationIndex = AppStrings.prayerCalculationNames.indexOf(value!);
                adhanTimeState.initPrayerTime();
              },
              items: AppStrings.prayerCalculationNames.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                      value: value,
                      child: Center(
                        child: Text(
                          value,
                          textAlign: TextAlign.center,
                        ),
                      )
                  );
                },
              ).toList(),
            ),
          ),
        );
      },
    );
  }
}
