import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/presentation/day/current_day.dart';
import 'package:majmua/presentation/friday/list_friday.dart';
import 'package:majmua/presentation/hadeeths/list_hadeeths.dart';
import 'package:majmua/presentation/names/list_names.dart';
import 'package:majmua/presentation/questions/list_questions.dart';
import 'package:majmua/presentation/ramadan/list_lessons_ramadan.dart';
import 'package:majmua/presentation/supplications/day_night_supplications.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        leading: const Icon(
          Icons.ac_unit_outlined,
          size: 35,
        ),
        centerTitle: true,
        elevation: 0,
        title: const Text('Полка M'),
      ),
      body: ListView(
        children: const [
          CurrentDay(),
          ListFriday(),
          DayNightSupplications(),
          ListNames(),
          ListQuestions(),
          ListHadeeths(),
          ListLessonsRamadan(),
        ],
      ),
    );
  }
}
