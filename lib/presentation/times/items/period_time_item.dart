import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class PeriodTimeItem extends StatelessWidget {
  const PeriodTimeItem({
    super.key,
    required this.timeIndex,
    required this.time,
    required this.percent,
  });

  final int timeIndex;
  final String time;
  final double percent;

  String percentageModifier(double value) {
    final roundedValue = (value).toStringAsFixed(2).toString();
    return '$roundedValue%';
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final double screenWidth = MediaQuery.of(context).size.width;
    final String pastTime = '${(percent - 100).toStringAsFixed(2)}%';
    return Container(
      decoration: BoxDecoration(
        color: timeIndex.isOdd ? appColors.onPrimary.withAlpha(150) : appColors.onTertiary.withAlpha(150),
        shape: BoxShape.circle,
      ),
      child: SleekCircularSlider(
        initialValue: percent,
        appearance: CircularSliderAppearance(
          infoProperties: InfoProperties(
            topLabelText: time,
            topLabelStyle: TextStyle(
              color: timeIndex.isOdd ? appColors.primary : appColors.tertiary,
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
            ),
            modifier: percentageModifier,
            mainLabelStyle: TextStyle(
              color: appColors.primary,
              fontSize: 10.0,
            ),
            bottomLabelText: pastTime,
            bottomLabelStyle: TextStyle(
              color: appColors.tertiary,
              fontSize: 10.0,
            ),
          ),
          customWidths: CustomSliderWidths(
            progressBarWidth: 3.5,
            trackWidth: 2.5,
            handlerSize: 1.5,
          ),
          customColors: CustomSliderColors(
            hideShadow: true,
            progressBarColor: timeIndex.isOdd ? appColors.primary : appColors.tertiary,
            trackColor: timeIndex.isOdd ? appColors.primary.withAlpha(50) : appColors.secondary.withAlpha(50),
          ),
          size: screenWidth * 0.2,
          spinnerMode: false,
          animationEnabled: false,
        ),
      ),
    );
  }
}
