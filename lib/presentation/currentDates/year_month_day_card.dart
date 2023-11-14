import 'package:flutter/material.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:square_progress_indicator/square_progress_indicator.dart';

class YearMonthDayCard extends StatelessWidget {
  const YearMonthDayCard({
    super.key,
    required this.monthPercent,
    required this.day,
    required this.month,
    required this.year,
    required this.dateColor,
  });

  final double monthPercent;
  final int day;
  final String month;
  final String year;
  final Color dateColor;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final mediaQuery = MediaQuery.of(context).size.width;
    final circleWidgetSize = mediaQuery * 0.15;
    return Card(
      margin: EdgeInsets.zero,
      color: appColors.glass,
      child: SquareProgressIndicator(
        height: circleWidgetSize,
        value: monthPercent,
        borderRadius: 20,
        startPosition: StartPosition.bottomCenter,
        strokeCap: StrokeCap.round,
        clockwise: true,
        color: dateColor,
        emptyStrokeColor: dateColor.withOpacity(0.25),
        strokeWidth: 1.5,
        emptyStrokeWidth: 0.75,
        strokeAlign: SquareStrokeAlign.center,
        child: ListTile(
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
          leading: CircleAvatar(
            backgroundColor: dateColor,
            child: Text(
              '$day',
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Nexa',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text(
            month,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Nexa',
            ),
          ),
          subtitle: Text(
            year,
            style: const TextStyle(
              fontFamily: 'Nexa',
            ),
          ),
        ),
      ),
    );
  }
}
