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
    final double screenWidth = MediaQuery.of(context).size.width;
    final RestTimeState timeState = Provider.of<RestTimeState>(context);
    final bool isCurrentDay = dayIndex == timeState.currentDateTime.weekday;
    final bool isFriday = dayIndex == 5;
    return Container(
      width: isCurrentDay ? screenWidth * 0.112 : screenWidth * 0.095,
      height: isCurrentDay ? screenWidth * 0.112 : screenWidth * 0.095,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCurrentDay
            ? isFriday
                ? appColors.quaternaryColor
                : appColors.secondaryColor
            : appColors.primaryColor,
      ),
      child: isCurrentDay
          ? CircularPercentIndicator(
              radius: isCurrentDay ? screenWidth * 0.05 : screenWidth * 0.04,
              lineWidth: screenWidth * 0.005,
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.indigo,
              backgroundColor: Colors.white,
              percent: timeState.getElapsedDayPercentage() / 100,
              center: Text(
                dayName,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nexa',
                ),
                textAlign: TextAlign.center,
              ),
          )
          : Center(
              child: Text(
                dayName,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  color: Colors.white,
                  fontFamily: 'Nexa',
                ),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
