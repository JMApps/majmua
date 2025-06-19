import 'package:flutter/material.dart';

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
              flex: 2,
              child: Visibility(
                visible: !isState,
                child: Text(
                  '-$remainingTime',
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                targetTime,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
