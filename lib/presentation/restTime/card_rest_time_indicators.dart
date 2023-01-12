import 'package:flutter/material.dart';
import 'package:majmua/application/state/rest_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Consumer<RestTimeState>(
            builder: (BuildContext context, restTimeState, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircularPercentIndicator(
                    radius: 37.5,
                    lineWidth: 3.5,
                    progressColor: const Color(0xFF5C6BC0),
                    percent: restTimeState.getRestDayProgress / 100,
                    center: CenterTextRestTimeIndicator(
                      title: AppString.day,
                      color: const Color(0xFF5C6BC0),
                      percent: restTimeState.getRestDayProgress,
                    ),
                  ),
                  CircularPercentIndicator(
                    radius: 37.5,
                    lineWidth: 3.5,
                    progressColor: const Color(0xFFEF5350),
                    percent: restTimeState.getRestWeekProgress / 100,
                    center: CenterTextRestTimeIndicator(
                      title: AppString.week,
                      color: const Color(0xFFEF5350),
                      percent: restTimeState.getRestWeekProgress,
                    ),
                  ),
                  CircularPercentIndicator(
                    radius: 37.5,
                    lineWidth: 3.5,
                    progressColor: const Color(0xFFFFA726),
                    percent: restTimeState.getRestMonthProgress / 100,
                    center: CenterTextRestTimeIndicator(
                      title: AppString.month,
                      color: const Color(0xFFFFA726),
                      percent: restTimeState.getRestMonthProgress,
                    ),
                  ),
                  CircularPercentIndicator(
                    radius: 37.5,
                    lineWidth: 3,
                    progressColor: const Color(0xFF26A69A),
                    percent: restTimeState.getRestYearMinutes / 100,
                    center: CenterTextRestTimeIndicator(
                      title: AppString.year,
                      color: const Color(0xFF26A69A),
                      percent: restTimeState.getRestYearMinutes,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
