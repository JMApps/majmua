import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/data/database/model/model_lesson_ramadan_item.dart';

class LessonRamadanItem extends StatelessWidget {
  const LessonRamadanItem({
    Key? key,
    required this.index,
    required this.item,
  }) : super(key: key);

  final int index;
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
        child: Container(
          padding: MainAppStyle.mainPadding,
          alignment: Alignment.center,
          child: Text('Lesson $index'),
        ),
      ),
    );
  }
}
