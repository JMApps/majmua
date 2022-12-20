import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/data/database/model/arguments/arguments_lesson_ramadan.dart';
import 'package:majmua/data/database/model/model_lesson_ramadan_item.dart';

class LessonRamadanItem extends StatelessWidget {
  const LessonRamadanItem({Key? key, required this.item}) : super(key: key);

  final ModelLessonRamadanItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: MainAppStyle.mainBorderRadius,
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              'lessons_ramadan_content_page',
              arguments: ArgumentsLessonRamadan(
                chapterId: item.id,
              ),
            );
          },
          borderRadius: MainAppStyle.mainBorderRadius,
          child: Center(
            child: ListTile(
              contentPadding: MainAppStyle.mainPadding,
              title: Text(
                item.numberChapter,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                item.titleChapter,
                style: const TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ));
  }
}
