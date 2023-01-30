import 'package:flutter/material.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/restTime/item_text_rest_time_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CardRestTimeCircularItem extends StatelessWidget {
  const CardRestTimeCircularItem({
    Key? key,
    required this.seasonName,
    required this.progressColor,
    required this.restPercent,
  }) : super(key: key);

  final String seasonName;
  final Color progressColor;
  final double restPercent;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return CircleAvatar(
      backgroundColor: appColors.glassOnGlassCardColor,
      radius: 40,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: CircularPercentIndicator(
          radius: 35,
          lineWidth: 3,
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: progressColor,
          percent: restPercent <= 100.0 ? restPercent / 100 : 1.0,
          center: ItemTextRestTimeIndicator(
            title: seasonName,
            color: progressColor,
            percent: restPercent,
          ),
        ),
      ),
    );
  }
}
