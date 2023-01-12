import 'package:flutter/material.dart';
import 'package:majmua/application/state/rest_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_color.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/presentation/restTime/card_rest_time_circular_item.dart';
import 'package:majmua/presentation/restTime/segment_control_time_season.dart';
import 'package:provider/provider.dart';

class MainCardRestTimeIndicators extends StatelessWidget {
  const MainCardRestTimeIndicators({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: AppWidgetStyle.horizontalMarginMini,
      shape: AppWidgetStyle.mainRectangleBorder,
      child: Consumer<RestTimeState>(
        builder: (BuildContext context, restTimeState, _) {
          return Padding(
            padding: AppWidgetStyle.mainPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  AppString.appMainSlogan,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  children: [
                    CardRestTimeCircularItem(
                      seasonName: AppString.day,
                      progressColor: AppWidgetColor.indigo,
                      restYearPercent: restTimeState.getRestDayProgress,
                    ),
                    CardRestTimeCircularItem(
                      seasonName: AppString.week,
                      progressColor: AppWidgetColor.red,
                      restYearPercent: restTimeState.getRestWeekProgress,
                    ),
                    CardRestTimeCircularItem(
                      seasonName: AppString.month,
                      progressColor: AppWidgetColor.orange,
                      restYearPercent: restTimeState.getRestMonthProgress,
                    ),
                    CardRestTimeCircularItem(
                      seasonName: AppString.year,
                      progressColor: AppWidgetColor.teal,
                      restYearPercent: restTimeState.getRestYearProgress,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const SegmentControlTimeSeason(),
              ],
            ),
          );
        },
      ),
    );
  }
}
