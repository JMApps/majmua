import 'package:flutter/material.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/state/rest_time_state.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class WeekCircleDay extends StatelessWidget {
  const WeekCircleDay({
    super.key,
    required,
    required this.dayName,
    required this.dayIndex,
  });

  final String dayName;
  final int dayIndex;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final double screenWidth = MediaQuery.of(context).size.width;
    final RestTimeState timeState = Provider.of<RestTimeState>(context);
    final bool isCurrentDay = dayIndex == timeState.currentDateTime.weekday;
    final bool isFriday = dayIndex == 5;
    return Container(
      width: isCurrentDay ? screenWidth * 0.112 : screenWidth * 0.095,
      height: isCurrentDay ? screenWidth * 0.112 : screenWidth * 0.095,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCurrentDay
            ? isFriday
                ? appColors.quaternaryColor
                : appColors.secondaryColor
            : appColors.primaryColor,
      ),
      child: isCurrentDay
          ? Padding(
              padding: const EdgeInsets.all(1.5),
              child: SleekCircularSlider(
                initialValue: timeState.getElapsedDayPercentage(),
                appearance: CircularSliderAppearance(
                  infoProperties: InfoProperties(
                    modifier: null,
                    topLabelText: dayName,
                    topLabelStyle: TextStyle(
                      fontSize: screenWidth * 0.035,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    mainLabelStyle: const TextStyle(
                      fontSize: 0,
                    ),
                  ),
                  customWidths: CustomSliderWidths(
                    progressBarWidth: screenWidth * 0.006,
                    trackWidth: screenWidth * 0.004,
                    handlerSize: screenWidth * 0.003,
                  ),
                  customColors: CustomSliderColors(
                    hideShadow: true,
                    dotColor: appColors.surface,
                    progressBarColor: appColors.primary,
                    trackColor: appColors.inversePrimary.withOpacity(0.5),
                  ),
                  size: screenWidth * 0.22,
                  spinnerMode: false,
                  startAngle: 270,
                  angleRange: 360,
                  animationEnabled: true,
                ),
              ),
            )
          : Center(
              child: Text(
                dayName,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  color: Colors.white,
                  fontFamily: 'Nexa',
                ),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
