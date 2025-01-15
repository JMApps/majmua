import 'package:flutter/material.dart';

import '../../../core/styles/app_styles.dart';
import '../widgets/week_day.dart';

class WeekDaysContainer extends StatelessWidget {
  const WeekDaysContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: AppStyles.mardingHorizontalMini,
      child: Padding(
        padding: AppStyles.mainMardingMini,
        child: Row(
          children: [
            WeekDay(dayNumber: 1),
            SizedBox(width: 8),
            WeekDay(dayNumber: 2),
            SizedBox(width: 8),
            WeekDay(dayNumber: 3),
            SizedBox(width: 8),
            WeekDay(dayNumber: 4),
            SizedBox(width: 8),
            WeekDay(dayNumber: 5),
            SizedBox(width: 8),
            WeekDay(dayNumber: 6),
            SizedBox(width: 8),
            WeekDay(dayNumber: 7),
          ],
        ),
      ),
    );
  }
}
