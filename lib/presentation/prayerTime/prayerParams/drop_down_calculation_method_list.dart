import 'package:flutter/material.dart';
import 'package:majmua/application/state/prayer_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:provider/provider.dart';

class DropDownCalculationMethodList extends StatelessWidget {
  const DropDownCalculationMethodList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).colorScheme;
    return Consumer<PrayerTimeState>(
      builder: (BuildContext context, prayerTimeState, _) {
        return Card(
          color: appColor.mainReverse,
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton<String>(
              value: AppString.calculationMethodNames[prayerTimeState.getCalculationIndex],
              borderRadius: AppWidgetStyle.mainBorderRadius,
              elevation: 0,
              isExpanded: true,
              alignment: AlignmentDirectional.center,
              style: TextStyle(
                color: appColor.mainTextColor,
                fontSize: 15,
                fontFamily: 'Nexa',
              ),
              underline: const SizedBox(),
              onChanged: (String? value) {
                context.read<PrayerTimeState>().setCalculationMethod = AppString.calculationMethodNames.indexOf(value!);
              },
              items: AppString.calculationMethodNames.map<DropdownMenuItem<String>>(
                (String value) {
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
