import 'package:flutter/material.dart';

class SeasonNameText extends StatelessWidget {
  const SeasonNameText({
    super.key,
    required this.seasonName,
  });

  final String seasonName;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    return Text(
      seasonName,
      style: TextStyle(
        fontSize: screenWidth * 0.035,
        fontFamily: 'Raleway',
      ),
    );
  }
}
