import 'package:flutter/material.dart';
import 'package:majmua/application/state/country_coordinates_state.dart';
import 'package:majmua/application/theme/app_themes.dart';
import 'package:provider/provider.dart';

class CalculationMethodContainer extends StatefulWidget {
  const CalculationMethodContainer({Key? key}) : super(key: key);

  @override
  State<CalculationMethodContainer> createState() =>
      _CalculationMethodContainerState();
}

const List<String> _calculationMethod = [
  'Umm al-Qura',
  'North America – ISNA',
  'Dubai',
  'Egyptian',
  'Karachi',
  'Kuwait',
  'Moon sighting committee',
  'Muslim world league',
  'Qatar',
  'Turkey',
];

class _CalculationMethodContainerState
    extends State<CalculationMethodContainer> {
  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Column(
      children: [
        Text(
          'Метод расчета времени молитв:',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey.shade700,
          ),
        ),
        DropdownButton<String>(
          value: _calculationMethod[context.watch<CountryCoordinatesState>().getCalculationMethodIndex],
          style: TextStyle(
            fontSize: 16,
            color: appColors.firstThirdColor,
          ),
          icon: const Icon(Icons.arrow_drop_down_rounded),
          elevation: 16,
          underline: Container(
            height: 2,
          ),
          onChanged: (String? value) {
            context.read<CountryCoordinatesState>().changeCalculationMethod =
                _calculationMethod.indexOf(value!);
          },
          items: _calculationMethod.map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
