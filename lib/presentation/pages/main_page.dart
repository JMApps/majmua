import 'package:flutter/material.dart';
import 'package:majmua/application/state/prayer_parameters_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/presentation/books/books_container.dart';
import 'package:majmua/presentation/currentDate/current_date_container.dart';
import 'package:majmua/presentation/friday/friday_container.dart';
import 'package:majmua/presentation/prayerTime/prayer_time_container.dart';
import 'package:majmua/presentation/restHolidays/rest_holidays.dart';
import 'package:majmua/presentation/restTime/rest_time_container.dart';
import 'package:majmua/presentation/sixColumns/six_column_container.dart';
import 'package:majmua/presentation/whiteDays/white_day_container.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.mainAppTitle),
      ),
      body: SingleChildScrollView(
        padding: AppStyles.symmetricVerticalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const RestTimeContainer(),
            const SizedBox(height: 6),
            const Divider(indent: 16, endIndent: 16),
            Consumer<PrayerParametersState>(
              builder: (context, prayerParametersState, _) {
                prayerParametersState.initParameters();
                return PrayerTimeContainer(
                  currentLatitude: prayerParametersState.currentLatitude,
                  currentLongitude: prayerParametersState.currentLongitude,
                  calculationIndex: prayerParametersState.calculationIndex,
                );
              },
            ),
            const SizedBox(height: 4),
            const CurrentDateContainer(),
            const SizedBox(height: 4),
            const Divider(indent: 16, endIndent: 16),
            const FridayContainer(),
            const RestHolidaysContainer(),
            const Divider(indent: 16, endIndent: 16),
            const WhiteDayContainer(),
            const SizedBox(height: 4),
            const SixColumnsContainer(),
            const SizedBox(height: 4),
            const Divider(indent: 16, endIndent: 16),
            const BooksContainer(),
            const Divider(indent: 16, endIndent: 16),
          ],
        ),
      ),
    );
  }
}
