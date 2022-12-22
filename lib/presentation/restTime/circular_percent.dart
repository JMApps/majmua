import 'package:flutter/material.dart';
import 'package:majmua/presentation/restTime/percent_information_text.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularPercent extends StatelessWidget {
  const CircularPercent({
    Key? key,
    required this.currentTime,
    required this.progressPercentColor,
    required this.percent,
  }) : super(key: key);

  final String currentTime;
  final Color progressPercentColor;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      animation: true,
      animationDuration: 1500,
      radius: 42.5,
      curve: Curves.easeInOutCubic,
      backgroundColor: progressPercentColor.withOpacity(0.25),
      progressColor: progressPercentColor,
      percent: percent / 100,
      center: PercentInformationText(
        currentTime: currentTime,
        progressColor: progressPercentColor,
        pastPercent: percent,
        leftPercent: percent,
      ),
    );
  }
}
