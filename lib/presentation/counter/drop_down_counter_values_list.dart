import 'package:flutter/material.dart';
import 'package:majmua/application/state/counter_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:provider/provider.dart';

class DropDownCounterValuesList extends StatelessWidget {
  const DropDownCounterValuesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).colorScheme;
    return Card(
      color: appColor.glassOnGlassCardColor,
      elevation: 1,
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton<String>(
          value: AppString.counterValuesList[context.watch<CounterState>().getCountValueListIndex],
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
            context.read<CounterState>().changeCountValueIndex(AppString.counterValuesList.indexOf(value!));
          },
          items: AppString.counterValuesList.map<DropdownMenuItem<String>>(
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
  }
}
