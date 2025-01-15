import 'package:flutter/material.dart';

class SeasonName extends StatelessWidget {
  const SeasonName({
    super.key,
    required this.seasonName,
  });

  final String seasonName;

  @override
  Widget build(BuildContext context) {
    return Text(
      seasonName,
    );
  }
}
