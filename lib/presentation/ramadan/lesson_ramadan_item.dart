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
      child: Card(
          margin: MainAppStyle.mainMarginMini,
          shape: const RoundedRectangleBorder(
            borderRadius: MainAppStyle.mainBorderRadius,
            side: BorderSide(
              width: 1,
              color: Color(0xFFA1887F),
            ),
          ),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                'lessons_ramadan_page',
                arguments: ArgumentsLessonRamadan(
                  numberChapter: item.numberChapter,
                  chapterId: item.id,
                ),
              );
            },
            borderRadius: MainAppStyle.mainBorderRadius,
            child: Center(
              child: ListTile(
                title: Text(
                  item.numberChapter,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.brown,
                  ),
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  item.titleChapter,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )),
    );
  }
}
