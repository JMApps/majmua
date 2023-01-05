import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/presentation/currentDate/current_date_container.dart';
import 'package:majmua/presentation/friday/friday_container.dart';
import 'package:majmua/presentation/library/library_container.dart';
import 'package:majmua/presentation/prayerTime/prayer_time_container.dart';
import 'package:majmua/presentation/quran/juz_amma_container.dart';
import 'package:majmua/presentation/restHolidays/rest_holidays.dart';
import 'package:majmua/presentation/restTime/rest_time_container.dart';
import 'package:majmua/presentation/sixColumns/six_column_container.dart';
import 'package:majmua/presentation/supplicationsQuran/sfq_container.dart';
import 'package:majmua/presentation/whiteDays/white_day_container.dart';
import 'package:majmua/presentation/widgets/share_app_links_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.mainAppTitle),
        actions: const [
          ShareAppLinksButton(),
        ],
      ),
      body: Container(
        decoration: AppStyles.mainBackground,
        child: SingleChildScrollView(
          padding: AppStyles.symmetricVerticalPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              RestTimeContainer(),
              SizedBox(height: 6),
              Divider(indent: 16, endIndent: 16),
              PrayerTimeContainer(),
              SizedBox(height: 4),
              CurrentDateContainer(),
              SizedBox(height: 4),
              Divider(indent: 16, endIndent: 16),
              FridayContainer(),
              RestHolidaysContainer(),
              Divider(indent: 16, endIndent: 16),
              WhiteDayContainer(),
              SizedBox(height: 4),
              SixColumnsContainer(),
              SizedBox(height: 4),
              Divider(indent: 16, endIndent: 16),
              JuzAmmaContainer(),
              Divider(indent: 16, endIndent: 16),
              SFQContainer(),
              Divider(indent: 16, endIndent: 16),
              LibraryContainer(),
              Divider(indent: 16, endIndent: 16),
            ],
          ),
        ),
      ),
    );
  }
}
