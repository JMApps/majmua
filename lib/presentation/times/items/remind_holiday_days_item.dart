import 'package:flutter/material.dart';

import '../../../core/styles/app_styles.dart';

class RemindHolidayDaysItem extends StatelessWidget {
  const RemindHolidayDaysItem({
    super.key,
    required this.remindTitle,
    required this.remindDays,
    required this.eventDate,
    required this.itemColor,
  });

  final String remindTitle;
  final int remindDays;
  final String eventDate;
  final Color itemColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: AppStyles.mardingHorizontalMini,
      child: Padding(
        padding: AppStyles.mardingHorizontal,
        child: Row(
          children: [
            Expanded(
              flex: 9,
              child: Text(
                remindTitle,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 3,
              child: Tooltip(
                message: eventDate,
                child: Card(
                  color: itemColor,
                  shape: AppStyles.mainShapeMini,
                  child: Padding(
                    padding: AppStyles.mardingVerticalMicro,
                    child: Text(
                      remindDays.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
