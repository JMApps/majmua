import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../core/styles/app_styles.dart';

class RemindHolidayDaysItem extends StatelessWidget {
  const RemindHolidayDaysItem({
    super.key,
    required this.remindTitle,
    required this.remindDays,
    required this.eventDate,
    required this.percentage,
    required this.itemColor,
  });

  final String remindTitle;
  final int remindDays;
  final String eventDate;
  final double percentage;
  final Color itemColor;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppStyles.mardingHorizontalMini,
      child: Padding(
        padding: AppStyles.mainMardingMini,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  remindTitle,
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                const SizedBox(width: 8),
                Text(
                  '($eventDate)',
                  style: const TextStyle(fontSize: 11.0),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(width: 8),
                Text(
                  remindDays.toString(),
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            LinearPercentIndicator(
              padding: EdgeInsets.zero,
              percent: percentage,
              progressColor: itemColor,
              backgroundColor: appColors.surface,
              barRadius: const Radius.circular(8),
            ),
          ],
        ),
      ),
    );
  }
}
