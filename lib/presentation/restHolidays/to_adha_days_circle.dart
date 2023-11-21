import 'package:flutter/material.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/state/rest_time_state.dart';
import 'package:provider/provider.dart';

class ToAdhaDaysCircle extends StatelessWidget {
  const ToAdhaDaysCircle({
    super.key,
    required this.dayNumber,
  });

  final int dayNumber;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    final RestTimeState timeState = Provider.of<RestTimeState>(context);
    return Flexible(
      child: CircleAvatar(
        radius: screenWidth * 0.04,
        backgroundColor: timeState.currentHijriTime.hDay == dayNumber
            ? appColors.quaternaryColor
            : appColors.primaryColor,
        child: Center(
          child: Text(
            dayNumber.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.04,
              fontFamily: 'Nexa',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
