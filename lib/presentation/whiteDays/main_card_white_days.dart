import 'package:flutter/material.dart';
import 'package:majmua/application/state/rest_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/whiteDays/item_white_day.dart';
import 'package:provider/provider.dart';

class MainCardWhiteDays extends StatelessWidget {
  const MainCardWhiteDays({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Consumer<RestTimeState>(
      builder: (BuildContext context, restTimeState, _) {
        return AnimatedSize(
          duration: const Duration(milliseconds: 750),
          child: Visibility(
            visible: restTimeState.getChdt.hDay >= 12 && restTimeState.getChdt.hDay <= 23,
            child: Card(
              margin: AppWidgetStyle.horizontalMarginMini,
              child: Padding(
                padding: AppWidgetStyle.mainPaddingMini,
                child: Wrap(
                  alignment: WrapAlignment.spaceAround,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.horizontal,
                  spacing: 8,
                  children: [
                    Text(
                      restTimeState.getChdt.hDay == 12
                          ? AppString.toWhiteDays
                          : AppString.whiteDays,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    ItemWhiteDay(
                      currentDay: 13,
                      dayColor: restTimeState.getChdt.hDay == 13
                          ? appColors.thirdAppColor
                          : appColors.firstAppColor,
                    ),
                    ItemWhiteDay(
                      currentDay: 14,
                      dayColor: restTimeState.getChdt.hDay == 14
                          ? appColors.thirdAppColor
                          : appColors.firstAppColor,
                    ),
                    ItemWhiteDay(
                      currentDay: 15,
                      dayColor: restTimeState.getChdt.hDay == 15
                          ? appColors.thirdAppColor
                          : appColors.firstAppColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
