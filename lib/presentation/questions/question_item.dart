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
      shape: MainAppStyle.mainCardBorderRadius,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            'questions_content_page',
            arguments: ArgumentsQuestion(
              questionId: item.id,
            ),
          );
        },
        borderRadius: MainAppStyle.mainBorderRadius,
        child: Center(
          child: ListTile(
            contentPadding: MainAppStyle.mainPadding,
            title: Text(
              item.numberQuestion,
              style: TextStyle(
                fontSize: 18,
                color: Colors.teal.shade800,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            subtitle: Html(
              data: item.question,
              style: {
                '#': Style(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  fontSize: const FontSize(18),
                  textAlign: TextAlign.center,
                ),
                'sup': Style(
                  fontSize: const FontSize(14),
                  color: Colors.teal.shade800,
                ),
              },
              onLinkTap: (String? url, RenderContext rendContext,
                  Map<String, String> attributes, element) {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (_) => Container(
                    margin: MainAppStyle.mainMargin,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: MainAppStyle.mainBorderRadius,
                    ),
                    child: SingleChildScrollView(
                      padding: MainAppStyle.mainPadding,
                      child: SelectableHtml(
                        data: url,
                        style: {
                          '#': Style(
                            fontSize: const FontSize(18),
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
    );
  }
}
