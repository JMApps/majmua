import 'package:flutter/material.dart';

import '../../../core/styles/app_styles.dart';
import '../items/fasting_messages.dart';
import '../items/week_day_item.dart';

class WeekDaysContainer extends StatelessWidget {
  const WeekDaysContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: AppStyles.mardingHorizontalMini,
      child: Padding(
        padding: AppStyles.mainMardingMini,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                WeekDayItem(dayNumber: 1),
                SizedBox(width: 8),
                WeekDayItem(dayNumber: 2),
                SizedBox(width: 8),
                WeekDayItem(dayNumber: 3),
                SizedBox(width: 8),
                WeekDayItem(dayNumber: 4),
                SizedBox(width: 8),
                WeekDayItem(dayNumber: 5),
                SizedBox(width: 8),
                WeekDayItem(dayNumber: 6),
                SizedBox(width: 8),
                WeekDayItem(dayNumber: 7),
              ],
            ),
            FastingMessages(),
          ],
        ),
      ),
    );
  }
}
