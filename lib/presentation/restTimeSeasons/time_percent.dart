import 'package:flutter/material.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TimePercent extends StatelessWidget {
  const TimePercent({
    super.key,
    required this.time,
    required this.timeColor,
    required this.percent,
  });

  final String time;
  final Color timeColor;
  final double percent;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final circleAvatarWidth = mediaQuery.size.width * 0.21;
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final String remainingTime = '${(percent * 100).toStringAsFixed(2)}%';
    final String pastTime = '${(percent * 100 - 100).toStringAsFixed(2)}%';
    return SizedBox(
      width: circleAvatarWidth,
      height: circleAvatarWidth,
      child: CircleAvatar(
        backgroundColor: appColors.glass,
        child: CircularPercentIndicator(
          radius: circleAvatarWidth / 2.3,
          lineWidth: 3,
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: timeColor,
          percent: percent,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                time,
                style: TextStyle(
                  fontSize: 11,
                  color: appColors.inverseSurface,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '-$remainingTime',
                style: const TextStyle(
                  fontSize: 11,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                pastTime.substring(1),
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: timeColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
