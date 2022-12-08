import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/data/database/model/arguments/arguments_question.dart';
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
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              'questions_page',
              arguments: ArgumentsQuestion(
                numberQuestion: item.numberQuestion,
                questionId: item.id,
              ),
            );
          },
          borderRadius: MainAppStyle.mainBorderRadius,
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
              subtitle: Html(
                data: item.question,
                style: {
                  '#': Style(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    fontSize: const FontSize(16),
                    textAlign: TextAlign.center,
                    maxLines: 6,
                    textOverflow: TextOverflow.fade,
                  ),
                  'sup': Style(
                    fontSize: const FontSize(12),
                    color: Colors.purple,
                  ),
                },
                onLinkTap: (String? url, RenderContext rendContext,
                    Map<String, String> attributes, element) {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (_) => SingleChildScrollView(
                      child: Container(
                        padding: MainAppStyle.mainPadding,
                        margin: MainAppStyle.mainMargin,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: MainAppStyle.mainBorderRadius,
                        ),
                        child: SelectableHtml(
                          data: url,
                          style: {
                            '#': Style(
                              fontSize: const FontSize(16),
                            ),
                            'small': Style(
                              fontSize: const FontSize(12),
                              color: Colors.grey,
                            ),
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
