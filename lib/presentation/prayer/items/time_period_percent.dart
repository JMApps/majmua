import 'package:flutter/material.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';

class TimePeriodPercent extends StatelessWidget {
  const TimePeriodPercent({
    super.key,
    required this.isState,
    required this.remainingTime,
    required this.title,
    required this.targetTime,
    required this.cardColor,
    required this.textColor,
  });

  final bool isState;
  final String remainingTime;
  final String title;
  final String targetTime;
  final Color cardColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: Padding(
        padding: AppStyles.mardingHorizontalMini,
        child: Row(
          children: [
            Expanded(
              child: Text(
                '-$remainingTime',
                style: const TextStyle(
                  fontFamily: AppStringConstraints.fontGilroyMedium,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                title,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                targetTime,
                style: const TextStyle(
                  fontFamily: AppStringConstraints.fontGilroyMedium,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
