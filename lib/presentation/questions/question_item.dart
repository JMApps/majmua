import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/data/database/model/model_question_item.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({
    Key? key,
    required this.index,
    required this.item,
  }) : super(key: key);

  final int index;
  final ModelQuestionItem item;

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
            color: Color(0xFFBA68C8),
          ),
        ),
        child: Container(
          padding: MainAppStyle.mainPadding,
          alignment: Alignment.center,
          child: Text('Question $index'),
        ),
      ),
    );
  }
}
