import 'package:flutter/material.dart';
import 'package:majmua/application/state/rest_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_color.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/presentation/restTime/center_text_rest_time_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class CardRestTimeIndicators extends StatelessWidget {
  const CardRestTimeIndicators({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: AppWidgetStyle.mainMargin,
      shape: AppWidgetStyle.mainRectangleBorder,
      child: SingleChildScrollView(
        padding: AppWidgetStyle.mainPadding,
        child: Consumer<RestTimeState>(
          builder: (BuildContext context, restTimeState, _) {
            return Column(
              children: [
                const Text(
                  AppString.appMainSlogan,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircularPercentIndicator(
                      radius: 37.5,
                      lineWidth: 3.5,
                      progressColor: AppWidgetColor.indigo,
                      percent: restTimeState.getRestDayProgress / 100,
                      center: CenterTextRestTimeIndicator(
                        title: AppString.day,
                        color: AppWidgetColor.indigo,
                        percent: restTimeState.getRestDayProgress,
                      ),
                    ),
                    CircularPercentIndicator(
                      radius: 37.5,
                      lineWidth: 3.5,
                      progressColor: AppWidgetColor.red,
                      percent: restTimeState.getRestWeekProgress / 100,
                      center: CenterTextRestTimeIndicator(
                        title: AppString.week,
                        color: AppWidgetColor.red,
                        percent: restTimeState.getRestWeekProgress,
                      ),
                    ),
                    CircularPercentIndicator(
                      radius: 37.5,
                      lineWidth: 3.5,
                      progressColor: AppWidgetColor.orange,
                      percent: restTimeState.getRestMonthProgress / 100,
                      center: CenterTextRestTimeIndicator(
                        title: AppString.month,
                        color: AppWidgetColor.orange,
                        percent: restTimeState.getRestMonthProgress,
                      ),
                    ),
                    CircularPercentIndicator(
                      radius: 37.5,
                      lineWidth: 3,
                      progressColor: AppWidgetColor.teal,
                      percent: restTimeState.getRestYearMinutes / 100,
                      center: CenterTextRestTimeIndicator(
                        title: AppString.year,
                        color: AppWidgetColor.teal,
                        percent: restTimeState.getRestYearMinutes,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
