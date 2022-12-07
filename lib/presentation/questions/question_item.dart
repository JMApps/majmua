import 'package:flutter/material.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/data/database/model/model_question_item.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({Key? key, required this.item}) : super(key: key);

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
        child: Center(
          child: ListTile(
            title: Text(
              item.numberQuestion,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.purple,
              ),
              textAlign: TextAlign.center,
            ),
            subtitle: Text(
              item.question,
              style: const TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
              maxLines: 6,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ),
    );
  }
}
