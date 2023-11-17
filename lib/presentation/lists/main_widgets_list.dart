import 'package:flutter/material.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/presentation/adhanTimes/main_adhan_time_card.dart';
import 'package:majmua/presentation/currentDates/main_current_dates_card.dart';
import 'package:majmua/presentation/restHolidays/rest_holidays_card.dart';
import 'package:majmua/presentation/restTimeSeasons/main_percent_seasons_card.dart';

class MainWidgetsList extends StatelessWidget {
  const MainWidgetsList({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: AppStyles.mainMardingMicro,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MainPercentSeasonsCard(),
          MainAdhanTimeCard(),
          MainCurrentDatesCard(),
          RestHolidaysCard(),
        ],
      ),
    );
  }
}
