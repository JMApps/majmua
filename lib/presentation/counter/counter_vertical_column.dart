import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/state/counter_state.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/counter/drop_down_counter_values_list.dart';
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
            const SizedBox(height: 48),
            Visibility(
              visible: counter.getIsCountValueShow,
              maintainSize: true,
              maintainState: true,
              maintainAnimation: true,
              child: Text(
                counter.getCountValue.toString(),
                style: const TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(250),
                splashColor: appColors.thirdAppColor,
                child: Container(
                  alignment: Alignment.center,
                  margin: AppWidgetStyle.mainMargin,
                  decoration: BoxDecoration(
                      color: appColors.secondAppColor, shape: BoxShape.circle),
                  child: const Icon(
                    CupertinoIcons.circle_grid_hex,
                    color: Colors.white,
                    size: 200,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    counter.vibrateMode();
                  },
                  splashRadius: 1,
                  icon: Icon(
                    Icons.vibration,
                    size: 40,
                    color: counter.getIsVibrate
                        ? appColors.firstAppColor
                        : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    counter.reset();
                  },
                  splashRadius: 1,
                  icon: Icon(
                    Icons.replay,
                    size: 40,
                    color: appColors.firstAppColor,
                  ),
                ),
                Platform.isIOS
                    ? IconButton(
                        onPressed: () {
                          counter.clickMode();
                        },
                        splashRadius: 1,
                        icon: Icon(
                          Icons.volume_up_outlined,
                          size: 40,
                          color: counter.getIsClick
                              ? appColors.firstAppColor
                              : Colors.grey,
                        ),
                      )
                    : const SizedBox(),
                IconButton(
                  onPressed: () {
                    counter.isCountShow();
                  },
                  splashRadius: 1,
                  icon: Icon(
                    Icons.remove_red_eye,
                    size: 40,
                    color: counter.getIsCountValueShow
                        ? appColors.firstAppColor
                        : Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: AppWidgetStyle.horizontalPadding,
              child: DropDownCounterValuesList(),
            ),
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
