import 'package:flutter/material.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/state/rest_time_state.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class WeekCircleDay extends StatelessWidget {
  const WeekCircleDay({
    super.key,
    required,
    required this.dayName,
    required this.dayIndex,
  });

  final String dayName;
  final int dayIndex;

  @override
  Widget build(BuildContext context) {

    final ColorScheme appColors = Theme.of(context).colorScheme;
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    final RestTimeState timeState = Provider.of<RestTimeState>(context);
    final bool isCurrentDay = dayIndex == timeState.currentDateTime.weekday;
    final bool isFriday = dayIndex == 5;
    return Container(
      width: isCurrentDay ? screenWidth * 0.11 : screenWidth * 0.09,
      height: isCurrentDay ? screenWidth * 0.11 : screenWidth * 0.09,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCurrentDay
            ? isFriday
                ? appColors.quaternaryColor
                : appColors.secterColor
            : appColors.primaryColor,
      ),
      child: isCurrentDay
          ? CircularPercentIndicator(
              radius: isCurrentDay ? screenWidth * 0.05 : screenWidth * 0.04,
              lineWidth: screenWidth * 0.006,
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: appColors.inverseSurface,
              backgroundColor: appColors.glass,
              percent: timeState.getElapsedDayPercentage() / 100,
              center: Text(
                dayName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.040,
                  fontFamily: 'Nexa',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            )
          : Center(
              child: Text(
                dayName,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Nexa',
                  fontSize: screenWidth * 0.035,
                ),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
