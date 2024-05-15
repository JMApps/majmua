import 'package:flutter/material.dart';
import 'package:majmua/core/strings/app_strings.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/state/adhan_time_state.dart';
import 'package:provider/provider.dart';

class HighLatitudeMethods extends StatelessWidget {
  const HighLatitudeMethods({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Consumer<AdhanTimeState>(
      builder: (BuildContext context, AdhanTimeState adhanTimeState, _) {
        return Card(
          margin: EdgeInsets.zero,
          shape: AppStyles.mainShapeMini,
          color: appColors.glass,
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton<String>(
              elevation: 0,
              isExpanded: true,
              value: AppStrings.highLatitudeNames[adhanTimeState.highLatitudeMethodIndex],
              borderRadius: AppStyles.mainBorderRadiusMini,
              alignment: AlignmentDirectional.center,
              dropdownColor: appColors.surface,
              style: TextStyle(
                fontSize: 16,
                color: appColors.inverseSurface,
                fontFamily: 'Raleway',
              ),
              underline: const SizedBox(),
              onChanged: (String? value) {
                adhanTimeState.setHighLatitudeIndex = AppStrings.highLatitudeNames.indexOf(value!);
                adhanTimeState.initPrayerTime();
              },
              items: AppStrings.highLatitudeNames.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                      value: value,
                      child: Center(
                        child: Text(
                          value,
                          style: TextStyle(
                            color: value == AppStrings.highLatitudeNames[adhanTimeState.highLatitudeMethodIndex]
                                ? appColors.quaternaryColor
                                : appColors.inverseSurface,
                          ),
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
