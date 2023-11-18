import 'package:flutter/material.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

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
    final mediaQuery = MediaQuery.of(context);
    final circleAvatarWidth = mediaQuery.size.width * 0.21;
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final String pastTime = '${(percent - 100).toStringAsFixed(2)}%';
    return SizedBox(
      width: circleAvatarWidth,
      height: circleAvatarWidth,
      child: CircleAvatar(
        backgroundColor: appColors.glass,
        child: Padding(
          padding: AppStyles.mainMardingMicro,
          child: SleekCircularSlider(
            initialValue: percent,
            appearance: CircularSliderAppearance(
              infoProperties: InfoProperties(
                topLabelText: time,
                topLabelStyle: TextStyle(
                  fontSize: 11,
                  color: appColors.onSurface,
                  fontWeight: FontWeight.bold,
                ),
                modifier: percentageModifier,
                mainLabelStyle: TextStyle(
                  fontSize: 12,
                  color: timeColor,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
                bottomLabelText: pastTime,
                bottomLabelStyle: const TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                  fontFamily: 'Roboto',
                ),
              ),
              customWidths: CustomSliderWidths(
                progressBarWidth: 3,
                trackWidth: 3,
                handlerSize: 1,
              ),
              customColors: CustomSliderColors(
                hideShadow: true,
                progressBarColor: timeColor,
                trackColor: timeColor.withOpacity(0.15),
              ),
              size: circleAvatarWidth,
              spinnerMode: false,
              animationEnabled: false,
            ),
          ),
        ),
      ),
    );
  }
}
