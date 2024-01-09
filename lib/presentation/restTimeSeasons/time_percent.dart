import 'package:flutter/material.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../core/styles/app_styles.dart';

class TimePercent extends StatelessWidget {
  const TimePercent({
    super.key,
    required this.time,
    required this.timeColor,
    required this.percent,
  });

  final String time;
  final Color timeColor;
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
      width: screenWidth * 0.22,
      height: screenWidth * 0.22,
      padding: AppStyles.mainMardingMicro,
      decoration: BoxDecoration(color: appColors.glass, shape: BoxShape.circle),
      child: SleekCircularSlider(
        initialValue: percent,
        appearance: CircularSliderAppearance(
          infoProperties: InfoProperties(
            topLabelText: time,
            topLabelStyle: TextStyle(
              fontSize: screenWidth * 0.032,
              color: appColors.onSurface,
            ),
            modifier: percentageModifier,
            mainLabelStyle: TextStyle(
              fontSize: screenWidth * 0.03,
              color: timeColor,
              fontFamily: 'Bitter',
            ),
            bottomLabelText: pastTime,
            bottomLabelStyle: TextStyle(
              fontSize: screenWidth * 0.025,
              color: Colors.grey,
              fontFamily: 'Bitter',
            ),
          ),
          customWidths: CustomSliderWidths(
            progressBarWidth: screenWidth * 0.009,
            trackWidth: screenWidth * 0.009,
            handlerSize: screenWidth * 0.003,
          ),
          customColors: CustomSliderColors(
            hideShadow: true,
            progressBarColor: timeColor,
            trackColor: timeColor.withOpacity(0.15),
          ),
          size: screenWidth * 0.22,
          spinnerMode: false,
          animationEnabled: true,
        ),
      ),
    );
  }
}
