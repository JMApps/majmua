import 'package:flutter/material.dart';
import 'package:majmua/presentation/restTime/item_text_rest_time_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CardRestTimeCircularItem extends StatelessWidget {
  const CardRestTimeCircularItem({
    Key? key,
    required this.seasonName,
    required this.progressColor,
    required this.restYearPercent,
  }) : super(key: key);

  final String seasonName;
  final Color progressColor;
  final double restYearPercent;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const CircleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: CircularPercentIndicator(
          radius: 35,
          lineWidth: 3,
          progressColor: progressColor,
          percent: restYearPercent / 100,
          center: ItemTextRestTimeIndicator(
            title: seasonName,
            color: progressColor,
            percent: restYearPercent,
          ),
        ),
      ),
    );
  }
}
