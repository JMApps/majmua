import 'package:flutter/material.dart';
import 'package:majmua/application/state/country_coordinates_state.dart';
import 'package:majmua/application/theme/app_themes.dart';
import 'package:provider/provider.dart';

class CalculationMadhabContainer extends StatefulWidget {
  const CalculationMadhabContainer({Key? key}) : super(key: key);

  @override
  State<CalculationMadhabContainer> createState() =>
      _CalculationMadhabContainerState();
}

const List<String> _calculationMadhab = [
  'Shafi',
  'Hanafi',
];

class _CalculationMadhabContainerState
    extends State<CalculationMadhabContainer> {
  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Column(
      children: [
        Text(
          'Молитва аср:',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey.shade700,
          ),
        ),
        DropdownButton<String>(
          value: _calculationMadhab[context.watch<CountryCoordinatesState>().getCalculationMadhabIndex],
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
            context.read<CountryCoordinatesState>().changeCalculationMadhab = _calculationMadhab.indexOf(value!);
          },
          items: _calculationMadhab.map<DropdownMenuItem<String>>(
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
