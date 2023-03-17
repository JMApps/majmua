import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/presentation/currentDateTime/card_week_day.dart';
import 'package:majmua/presentation/friday/list_sunnah_friday.dart';
import 'package:majmua/presentation/library/last_columns.dart';
import 'package:majmua/presentation/prayerTime/main_card_adhan_time.dart';
import 'package:majmua/presentation/restHolidays/main_card_rest_holidays.dart';
import 'package:majmua/presentation/restTime/main_card_rest_time_indicators.dart';
import 'package:majmua/presentation/whiteDays/main_card_white_days.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          fit: BoxFit.cover,
          opacity: Theme.of(context).brightness == Brightness.light ? 1 : 0.25,
          image: const AssetImage('assets/images/main_background_glassmorph.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              centerTitle: true,
              pinned: false,
              floating: false,
              title: const Text(
                AppString.appName,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'app_settings_page');
                  },
                  visualDensity: const VisualDensity(vertical: -4),
                  splashRadius: 17.5,
                  icon: const Icon(
                    CupertinoIcons.settings,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    SizedBox(height: 8),
                    MainCardRestTimeIndicators(),
                    SizedBox(height: 8),
                    MainCardAdhanTime(),
                    SizedBox(height: 8),
                    CardWeekDay(),
                    SizedBox(height: 8),
                    ListSunnahFriday(),
                    SizedBox(height: 8),
                    MainCardRestHolidays(),
                    SizedBox(height: 8),
                    MainCardWhiteDays(),
                    LastColumns(),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
