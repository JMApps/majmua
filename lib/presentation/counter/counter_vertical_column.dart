import 'dart:io';

import 'package:flutter/material.dart';
import 'package:majmua/application/state/counter_state.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:provider/provider.dart';

class CounterVerticalColumn extends StatelessWidget {
  const CounterVerticalColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Consumer<CounterState>(
      builder: (context, counter, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Visibility(
              visible: counter.getIsCountValueShow,
              maintainSize: true,
              maintainState: true,
              maintainAnimation: true,
              child: Card(
                elevation: 1,
                color: appColors.glassOnGlassCardColor,
                margin: AppWidgetStyle.horizontalMargin,
                child: Padding(
                  padding: AppWidgetStyle.mainPaddingMini,
                  child: Text(
                    counter.getCountValue.toString(),
                    style: TextStyle(
                      fontSize: 75,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato',
                      color: appColors.firstAppColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Padding(
                padding: AppWidgetStyle.mainPadding,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: appColors.counterButtonColor,
                    boxShadow: [
                      BoxShadow(
                        color: appColors.thirdAppColor,
                        blurRadius: 16,
                        spreadRadius: 2.5,
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () {
                      counter.increment();
                    },
                    splashRadius: 200,
                    splashColor: appColors.thirdAppColor,
                    icon: Icon(
                      Icons.touch_app_outlined,
                      size: 250,
                      color: Colors.white.withOpacity(0.85),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 1,
              margin: AppWidgetStyle.horizontalMargin,
              child: Padding(
                padding: AppWidgetStyle.mainPaddingMini,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundColor: appColors.glassOnGlassCardColor,
                      child: IconButton(
                        onPressed: () {
                          counter.vibrateMode();
                        },
                        splashRadius: 25,
                        icon: Icon(
                          Icons.vibration,
                          color: counter.getIsVibrate
                              ? appColors.firstAppColor
                              : Colors.grey,
                        ),
                      ),
                    ),
                    Platform.isIOS
                        ? CircleAvatar(
                            backgroundColor: appColors.glassOnGlassCardColor,
                            child: IconButton(
                              onPressed: () {
                                counter.clickMode();
                              },
                              splashRadius: 25,
                              icon: Icon(
                                Icons.volume_up_outlined,
                                color: counter.getIsClick
                                    ? appColors.firstAppColor
                                    : Colors.grey,
                              ),
                            ),
                          )
                        : const SizedBox(),
                    CircleAvatar(
                      backgroundColor: appColors.glassOnGlassCardColor,
                      child: IconButton(
                        onPressed: () {
                          counter.isCountShow();
                        },
                        splashRadius: 25,
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: counter.getIsCountValueShow
                              ? appColors.firstAppColor
                              : Colors.grey,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: appColors.glassOnGlassCardColor,
                      child: IconButton(
                        onPressed: () {
                          counter.reset();
                        },
                        splashRadius: 25,
                        icon: Icon(
                          Icons.replay,
                          color: appColors.firstAppColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // const SizedBox(height: 16),
            // const Padding(
            //   padding: AppWidgetStyle.horizontalPadding,
            //   child: DropDownCounterValuesList(),
            // ),
            const SizedBox(height: 16),
            Visibility(
              visible: counter.getIsCountValueShow,
              maintainSize: true,
              maintainState: true,
              maintainAnimation: true,
              child: Text(
                'Общее количество: ${counter.getCountAllValue.toString()}',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),
          ],
        );
      },
    );
  }
}
