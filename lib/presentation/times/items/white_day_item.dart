import 'package:flutter/material.dart';
import 'package:majmua/core/styles/app_styles.dart';

class WhiteDayItem extends StatelessWidget {
  const WhiteDayItem({
    super.key,
    required this.dayNumber,
    required this.dayColor,
  });

  final int dayNumber;
  final Color dayColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: dayColor,
      radius: 10.0,
      child: Padding(
        padding: AppStyles.mardingTopMicroMini,
        child: Text(
          '$dayNumber',
          style: const TextStyle(fontSize: 11.0),
        ),
      ),
    );
  }
}
