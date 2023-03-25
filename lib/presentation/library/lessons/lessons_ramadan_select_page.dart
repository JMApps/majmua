import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/data/database/queries/lessons_query.dart';
import 'package:majmua/presentation/library/lessons/lesson_item.dart';
import 'package:majmua/presentation/widgets/button_main_text_settings.dart';

class LessonsRamadanSelectPage extends StatefulWidget {
  const LessonsRamadanSelectPage({Key? key, required this.selectPage}) : super(key: key);

  final int selectPage;

  @override
  State<LessonsRamadanSelectPage> createState() => _LessonsRamadanSelectPageState();
}

class _LessonsRamadanSelectPageState extends State<LessonsRamadanSelectPage> {
  final LessonsQuery _lessonsQuery = LessonsQuery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.bookLessonsRamadan),
        actions: const [
          ButtonMainTextSettings(),
        ],
      ),
      body: FutureBuilder(
        future: _lessonsQuery.getOneLesson(widget.selectPage),
        builder: (BuildContext context, snapshot) {
          return snapshot.hasData
              ? PageView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return LessonItem(
                    item: snapshot.data![index],
                  );
                },
              )
              : const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
        },
      ),
    );
  }
}
