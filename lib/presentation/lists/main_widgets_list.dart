import 'package:flutter/material.dart';

import '../adhanTimes/main_adhan_time_card.dart';
import '../currentDates/main_current_dates_card.dart';
import '../majmuaButtons/majmua_buttons_card.dart';
import '../restTimeSeasons/main_percent_seasons_card.dart';

class MainWidgetsList extends StatelessWidget {
  const MainWidgetsList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MainPercentSeasonsCard(),
        MainAdhanTimeCard(),
        MainCurrentDatesCard(),
        MajmuaButtonsCard(),
      ],
    );
  }
}
