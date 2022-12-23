import 'package:flutter/material.dart';
import 'package:majmua/presentation/restTime/percent_information_text.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularPercent extends StatelessWidget {
  const CircularPercent({
    Key? key,
    required this.currentPeriod,
    required this.progressPercentColor,
    required this.percent,
  }) : super(key: key);

  final String currentPeriod;
  final Color progressPercentColor;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      animation: true,
      animationDuration: 1500,
      radius: 35,
      curve: Curves.easeInOutCubic,
      backgroundColor: progressPercentColor.withOpacity(0.25),
      progressColor: progressPercentColor,
      percent: percent / 100,
      center: PercentInformationText(
        currentTime: currentPeriod,
        progressColor: progressPercentColor,
        percent: percent,
      ),
    );
  }
}
