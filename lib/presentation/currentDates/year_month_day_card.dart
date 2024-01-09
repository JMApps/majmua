import 'package:flutter/material.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:square_progress_indicator/square_progress_indicator.dart';

import '../../core/styles/app_styles.dart';

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
    final double screenWidth = MediaQuery.of(context).size.width;
    return Card(
      margin: EdgeInsets.zero,
      color: appColors.glass,
      shape: AppStyles.mainShapeMicro,
      child: SquareProgressIndicator(
        height: screenWidth * 0.16,
        value: monthPercent,
        borderRadius: 7.5,
        startPosition: StartPosition.topCenter,
        strokeCap: StrokeCap.round,
        clockwise: true,
        color: dateColor,
        emptyStrokeColor: dateColor.withOpacity(0.25),
        strokeWidth: screenWidth * 0.005,
        emptyStrokeWidth: screenWidth * 0.005,
        strokeAlign: SquareStrokeAlign.center,
        child: Row(
          children: [
            SizedBox(width: screenWidth * 0.02),
            CircleAvatar(
              radius: screenWidth * 0.045,
              backgroundColor: dateColor,
              child: Text(
                '$day',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.04,
                  fontFamily: 'Bitter',
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.02),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                    child: Text(
                      month,
                      style: TextStyle(
                        fontSize: screenWidth * 0.039,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      year,
                      style: TextStyle(
                        fontSize: screenWidth * 0.039,
                        fontFamily: 'Bitter',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
