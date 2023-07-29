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
      margin: AppWidgetStyle.horizontalMarginMini,
      child: Padding(
        padding: AppWidgetStyle.mainPaddingMini,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              AppString.appMainSlogan,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Consumer<RestTimeState>(builder: (BuildContext context, restTimeState, _) {
              return Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceEvenly,
                spacing: 8,
                runSpacing: 8,
                children: [
                  CardRestTimeCircularItem(
                    seasonName: AppString.day,
                    progressColor: AppWidgetColor.indigo,
                    restPercent: restTimeState.getRestDayProgress,
                  ),
                  CardRestTimeCircularItem(
                    seasonName: AppString.week,
                    progressColor: AppWidgetColor.red,
                    restPercent: restTimeState.getRestWeekProgress,
                  ),
                  CardRestTimeCircularItem(
                    seasonName: AppString.month,
                    progressColor: AppWidgetColor.orange,
                    restPercent: restTimeState.getRestMonthProgress,
                  ),
                  CardRestTimeCircularItem(
                    seasonName: AppString.year,
                    progressColor: AppWidgetColor.teal,
                    restPercent: restTimeState.getRestYearProgress,
                  ),
                ],
              );
            }),
            const SizedBox(height: 8),
            const SegmentControlTimeSeason(),
          ],
        ),
      ),
    );
  }
}
