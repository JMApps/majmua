import 'package:flutter/material.dart';
import 'package:majmua/application/theme/app_themes.dart';

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

class _CalculationMethodContainerState extends State<CalculationMethodContainer> {
  final String _dropdownValue = _calculationMethod.first;
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
          value: _dropdownValue,
          style: TextStyle(
            fontSize: 16,
            color: appColors.firstAppColor,
          ),
          icon: const Icon(Icons.arrow_drop_down_rounded),
          elevation: 16,
          underline: Container(
            height: 2,
          ),
          onChanged: (String? value) {},
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
