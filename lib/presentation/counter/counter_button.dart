import 'dart:math';

import 'package:flutter/material.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/state/app_counter_state.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.height;
    final bool isPortrait = mediaQuery.orientation == Orientation.portrait;
    final double dynamicSize = isPortrait ? screenWidth * 0.35 : screenWidth * 0.5;
    return Consumer<AppCounterState>(
      builder: (BuildContext context, AppCounterState appCounterState, _) {
        return IconButton(
          onPressed: () {
            appCounterState.mainCountClick = appCounterState.getCountValuesIndex;
          },
          iconSize: dynamicSize,
          splashRadius: isPortrait ? screenWidth * 0.2 : screenWidth * 0.3,
          splashColor: appColors.primary,
          icon: Container(
            height: dynamicSize,
            width: dynamicSize,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: appColors.glass,
              boxShadow: [
                BoxShadow(
                  color: appColors.primary,
                  blurRadius: 15,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: Padding(
              padding: AppStyles.mainMardingMicro,
              child: CircularStepProgressIndicator(
                totalSteps: 100,
                currentStep: appCounterState.getCountValuesIndex == 0 ? 100 : appCounterState.getCurrentCountValue,
                stepSize: 5,
                selectedStepSize: 6,
                padding: pi / 30,
                circularDirection: CircularDirection.counterclockwise,
                selectedColor: appColors.secondaryColor,
                unselectedColor: appColors.secondaryColor.withOpacity(0.25),
                child: Center(
                  child: Text(
                    appCounterState.getIsShow
                        ? appCounterState.getCurrentCountValue.toString()
                        : '',
                    style: TextStyle(
                      fontSize: isPortrait ? screenWidth * 0.115 : screenWidth * 0.2,
                      color: appColors.primary,
                      fontFamily: 'Bitter',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
