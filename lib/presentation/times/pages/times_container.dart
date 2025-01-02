import 'package:flutter/material.dart';

import '../../../core/styles/app_styles.dart';
import '../widgets/week_day.dart';

class TimesContainer extends StatelessWidget {
  const TimesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 0,
      margin: AppStyles.mardingHorizontalMini,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: AppStyles.mainMardingMini,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WeekDay(dayNumber: 1),
                WeekDay(dayNumber: 2),
                WeekDay(dayNumber: 3),
                WeekDay(dayNumber: 4),
                WeekDay(dayNumber: 5),
                WeekDay(dayNumber: 6),
                WeekDay(dayNumber: 7),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
