import 'package:flutter/material.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/currentDates/week_circle_day.dart';

class WeekDaysRow extends StatelessWidget {
  const WeekDaysRow({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      margin: EdgeInsets.zero,
      color: appColors.glass,
      child: const Padding(
        padding: AppStyles.mainMardingMini,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            WeekCircleDay(
              dayName: 'Пн',
              dayIndex: 1,
            ),
            WeekCircleDay(
              dayName: 'Вт',
              dayIndex: 2,
            ),
            WeekCircleDay(
              dayName: 'Ср',
              dayIndex: 3,
            ),
            WeekCircleDay(
              dayName: 'Чт',
              dayIndex: 4,
            ),
            WeekCircleDay(
              dayName: 'Пт',
              dayIndex: 5,
            ),
            WeekCircleDay(
              dayName: 'Сб',
              dayIndex: 6,
            ),
            WeekCircleDay(
              dayName: 'Вс',
              dayIndex: 7,
            ),
          ],
        ),
      ),
    );
  }
}
