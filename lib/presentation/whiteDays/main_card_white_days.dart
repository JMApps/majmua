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
            visible: !restTimeState.getIsRamadan && restTimeState.getChdt.hDay >= 12 &&
                restTimeState.getChdt.hDay <= 15,
            child: Card(
              margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Padding(
                padding: AppWidgetStyle.mainPaddingMini,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        restTimeState.getChdt.hDay == 12
                            ? AppString.toWhiteDays
                            : AppString.whiteDays,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 2,
                      child: Card(
                        color: appColors.glassOnGlassCardColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Wrap(
                            alignment: WrapAlignment.spaceAround,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            direction: Axis.horizontal,
                            runSpacing: 8,
                            spacing: 8,
                            children: [
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
