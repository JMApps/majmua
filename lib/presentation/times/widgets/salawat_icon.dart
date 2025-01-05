import 'package:flutter/material.dart';

class SalawatIcon extends StatelessWidget {
  const SalawatIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/pictures/salawat.png',
          width: 105,
          height: 105,
          color: appColors.inversePrimary,
        ),
        Image.asset(
          'assets/pictures/salawat_border_one.png',
          width: 105,
          height: 105,
          color: appColors.tertiaryContainer,
        ),
        Image.asset(
          'assets/pictures/salawat_border_two.png',
          width: 105,
          height: 105,
          color: appColors.secondary,
        ),
      ],
    );
  }
}
