import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/presentation/date/current_date_time.dart';
import 'package:majmua/presentation/day/days_to.dart';
import 'package:majmua/presentation/friday/list_friday.dart';
import 'package:majmua/presentation/hadeeths/list_hadeeths.dart';
import 'package:majmua/presentation/names/list_names.dart';
import 'package:majmua/presentation/questions/list_questions.dart';
import 'package:majmua/presentation/ramadan/list_lessons_ramadan.dart';
import 'package:majmua/presentation/rests/rest_dates.dart';
import 'package:majmua/presentation/supplications/day_night_supplications.dart';
import 'package:majmua/presentation/surah/surah.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.elliptical(35, 20),
            bottomLeft: Radius.elliptical(35, 20),
          )
        ),
        title: const Text('Полка мусульманина'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const RestDates(),
            const CurrentDateTime(),
            const DaysTo(),
            Visibility(
              visible: MainAppStyle.dateTime.weekday >= 4 && MainAppStyle.dateTime.weekday <= 5 ? true : false,
              child: const ListFriday(),
            ),
            const DayNightSupplications(),
            const Surah(),
            const ListNames(),
            MainAppStyle.dateTimeHijri.hMonth == 9
                ? const ListLessonsRamadan()
                : const ListQuestions(),
            const ListHadeeths(),
            MainAppStyle.dateTimeHijri.hMonth != 9
                ? const ListLessonsRamadan()
                : const ListQuestions(),
          ],
        ),
      ),
    );
  }
}
