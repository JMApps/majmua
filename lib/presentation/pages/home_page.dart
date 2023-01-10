import 'package:flutter/material.dart';
import 'package:majmua/application/state/rest_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppWidgetStyle.mainSliverAppbar(AppString.appName),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 1,
                    margin: AppWidgetStyle.mainMargin,
                    shape: AppWidgetStyle.mainRectangleBorder,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: CircularPercentIndicator(
                                radius: 32.5,
                                percent: context.watch<RestTimeState>().getRestDayProgress / 100,
                              ),
                            ),
                            Expanded(
                              child: CircularPercentIndicator(
                                radius: 32.5,
                                percent: context.watch<RestTimeState>().getRestWeekProgress / 100,
                              ),
                            ),
                            Expanded(
                              child: CircularPercentIndicator(
                                radius: 32.5,
                                percent: context.watch<RestTimeState>().getRestMonthProgress / 100,
                              ),
                            ),
                            Expanded(
                              child: CircularPercentIndicator(
                                radius: 32.5,
                                percent: context.watch<RestTimeState>().getRestYearMinutes / 100,
                              ),
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
        ],
      ),
    );
  }
}
