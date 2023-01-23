import 'package:flutter/material.dart';
import 'package:majmua/application/state/rest_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/weekDay/item_day_from_week.dart';
import 'package:provider/provider.dart';

class CardWeekDay extends StatefulWidget {
  const CardWeekDay({Key? key}) : super(key: key);

  @override
  State<CardWeekDay> createState() => CardWeekDayState();
}

class CardWeekDayState extends State<CardWeekDay> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Consumer<RestTimeState>(
      builder: (BuildContext context, restTimeState, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              margin: AppWidgetStyle.horizontalPaddingMini,
              child: Padding(
                padding: AppWidgetStyle.mainPaddingMini,
                child: Center(
                  child: Wrap(
                    spacing: 16,
                    runAlignment: WrapAlignment.spaceEvenly,
                    children: [
                      ItemDayFromWeek(
                        dayName: AppString.shortNamesWeekDay[0],
                        dayNumber: 0,
                        weekDay: restTimeState.getCdt.weekday,
                      ),
                      ItemDayFromWeek(
                        dayName: AppString.shortNamesWeekDay[1],
                        dayNumber: 1,
                        weekDay: restTimeState.getCdt.weekday,
                      ),
                      ItemDayFromWeek(
                        dayName: AppString.shortNamesWeekDay[2],
                        dayNumber: 2,
                        weekDay: restTimeState.getCdt.weekday,
                      ),
                      ItemDayFromWeek(
                        dayName: AppString.shortNamesWeekDay[3],
                        dayNumber: 3,
                        weekDay: restTimeState.getCdt.weekday,
                      ),
                      ItemDayFromWeek(
                        dayName: AppString.shortNamesWeekDay[4],
                        dayNumber: 4,
                        weekDay: restTimeState.getCdt.weekday,
                      ),
                      ItemDayFromWeek(
                        dayName: AppString.shortNamesWeekDay[5],
                        dayNumber: 5,
                        weekDay: restTimeState.getCdt.weekday,
                      ),
                      ItemDayFromWeek(
                        dayName: AppString.shortNamesWeekDay[6],
                        dayNumber: 6,
                        weekDay: restTimeState.getCdt.weekday,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              margin: AppWidgetStyle.horizontalPaddingMini,
              child: ListTile(
                onTap: () {},
                shape: AppWidgetStyle.mainRectangleBorder,
                visualDensity: const VisualDensity(vertical: -4),
                contentPadding: AppWidgetStyle.horizontalPaddingMini,
                title: Text(
                  AppString.dailyMessages[restTimeState.getCdt.weekday - 1],
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 20,
                  color: appColors.mainTextColor,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
