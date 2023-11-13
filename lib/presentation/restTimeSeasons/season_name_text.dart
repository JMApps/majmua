import 'package:flutter/material.dart';

class SeasonNameText extends StatelessWidget {
  const SeasonNameText({
    super.key,
    required this.seasonName,
  });

  final String seasonName;

  @override
  Widget build(BuildContext context) {
    return Text(
      seasonName,
      style: const TextStyle(
        fontSize: 12.5,
        fontFamily: 'Nexa',
      ),
    );
  }
}
