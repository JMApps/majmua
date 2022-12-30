import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';
import 'package:majmua/data/database/local/model/question_model.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({Key? key, required this.item}) : super(key: key);

  final QuestionModel item;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return CupertinoScrollbar(
      child: SingleChildScrollView(
        padding: AppStyles.mainPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Divider(indent: 16, endIndent: 16),
            Text(
              'Вопрос ${item.id}',
              style: const TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const Divider(indent: 16, endIndent: 16),
            const SizedBox(height: 8),
            Html(
              data: item.question,
              style: {
                '#': Style(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  fontSize: const FontSize(18),
                  color: appColors.firstAppColor,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                ),
                'small': Style(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  fontSize: const FontSize(12),
                ),
                'a': Style(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  fontSize: const FontSize(18),
                  color: appColors.thirdAppColor,
                ),
              },
              onLinkTap: (String? url, RenderContext rendContext,
                  Map<String, String> attributes, element) {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) => CupertinoActionSheet(
                    message: Html(
                      data: url,
                      style: {
                        '#': Style(
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.zero,
                          fontSize: const FontSize(18),
                        ),
                        'small': Style(
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.zero,
                          color: Colors.grey,
                          fontSize: const FontSize(12),
                        ),
                      },
                    ),
                    actions: [
                      CupertinoButton(
                        child: Text(
                          'Закрыть',
                          style: TextStyle(
                            color: appColors.thirdAppColor,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            const Divider(indent: 16, endIndent: 16),
            const Text(
              'Ответ',
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const Divider(indent: 16, endIndent: 16),
            Html(
              data: item.answerContent,
              style: {
                '#': Style(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  fontSize: const FontSize(18),
                ),
                'small': Style(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  fontSize: const FontSize(12),
                ),
                'a': Style(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  fontSize: const FontSize(18),
                  color: appColors.thirdAppColor,
                ),
              },
              onLinkTap: (String? url, RenderContext rendContext,
                  Map<String, String> attributes, element) {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) => CupertinoActionSheet(
                    message: Html(
                      data: url,
                      style: {
                        '#': Style(
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.zero,
                          fontSize: const FontSize(18),
                        ),
                        'small': Style(
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.zero,
                          color: Colors.grey,
                          fontSize: const FontSize(12),
                        ),
                      },
                    ),
                    actions: [
                      CupertinoButton(
                        child: Text(
                          'Закрыть',
                          style: TextStyle(
                            color: appColors.thirdAppColor,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
