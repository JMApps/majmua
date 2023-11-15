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
    final mediaQuery = MediaQuery.of(context).size.width;
    final circleWidgetSize = mediaQuery * 0.1;
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final RestTimeState timeState = Provider.of<RestTimeState>(context);
    final bool isCurrentDay = dayIndex == timeState.currentDateTime.weekday;
    final bool isFriday = dayIndex == 5;
    return Container(
      width: circleWidgetSize,
      height: circleWidgetSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCurrentDay ? isFriday ? appColors.quaternaryColor : appColors.secondaryColor : appColors.primaryColor,
      ),
      child: isCurrentDay
          ? CircularPercentIndicator(
              radius: circleWidgetSize * 0.45,
              lineWidth: 1.5,
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: appColors.primaryColor,
              backgroundColor: Colors.white70,
              percent: timeState.getElapsedDayPercentage() / 100,
              center: Text(
                dayName,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            )
          : Center(
              child: Text(
                dayName,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
