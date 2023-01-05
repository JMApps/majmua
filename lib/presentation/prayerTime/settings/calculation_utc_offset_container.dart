import 'package:flutter/material.dart';
import 'package:majmua/application/state/country_coordinates_state.dart';
import 'package:majmua/application/theme/app_themes.dart';
import 'package:provider/provider.dart';

const List<String> _calculationUtcOffset = [
  '- 1',
  'По умолчанию',
  '+ 1',
];

class CalculationUtcOffsetContainer extends StatelessWidget {
  const CalculationUtcOffsetContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Column(
      children: [
        Text(
          'Часовой пояс:',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey.shade700,
          ),
        ),
        DropdownButton<String>(
          value: _calculationUtcOffset[context.watch<CountryCoordinatesState>().getCalculationUtcOffsetIndex],
          style: TextStyle(
            fontSize: 16,
            color: appColors.secondAppColor,
          ),
          icon: const Icon(Icons.arrow_drop_down_rounded),
          elevation: 16,
          underline: Container(
            height: 2,
          ),
          onChanged: (String? value) {
            context.read<CountryCoordinatesState>().changeCalculationUtcOffset = _calculationUtcOffset.indexOf(value!);
          },
          items: _calculationUtcOffset.map<DropdownMenuItem<String>>(
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
