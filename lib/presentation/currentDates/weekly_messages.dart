import 'package:flutter/material.dart';
import 'package:majmua/core/styles/app_styles.dart';

class WeeklyMessages extends StatelessWidget {
  const WeeklyMessages({
    super.key,
    required this.dailyMessage,
  });

  final String dailyMessage;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        padding: AppStyles.mardingWithoutTop,
        child: Text(
          dailyMessage,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'Nexa',
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
