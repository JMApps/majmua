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
          width: 75,
          height: 75,
          color: appColors.inversePrimary,
        ),
        Image.asset(
          'assets/pictures/salawat_border_two.png',
          width: 75,
          height: 75,
          color: appColors.secondary,
        ),
      ],
    );
  }
}
