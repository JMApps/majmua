import 'package:flutter/material.dart';
import 'package:majmua/presentation/rests/center_percent_text.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentCircular extends StatelessWidget {
  const PercentCircular({
    Key? key,
    required this.time,
    required this.progressColor,
    required this.percent,
    required this.firstPercent,
    required this.secondPercent,
  }) : super(key: key);

  final String time;
  final Color progressColor;
  final double percent;
  final String firstPercent;
  final String secondPercent;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      animation: true,
      animationDuration: 750,
      radius: 40,
      progressColor: progressColor,
      backgroundColor: progressColor.withOpacity(0.25),
      percent: percent / 100,
      center: CenterPercentText(
        time: time,
        firstPercent: firstPercent,
        secondPercent: secondPercent,
        color: progressColor,
      ),
    );
  }
}
