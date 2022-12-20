import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/data/database/model/arguments/arguments_question.dart';
import 'package:majmua/data/database/service/database_query.dart';

class QuestionsContentPage extends StatefulWidget {
  const QuestionsContentPage({
    Key? key,
    required this.questionId,
  }) : super(key: key);

  final int questionId;

  @override
  State<QuestionsContentPage> createState() => _QuestionsContentPageState();
}

class _QuestionsContentPageState extends State<QuestionsContentPage> {
  final DatabaseQuery _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('200 вопросов'),
        actions: [
          widget.questionId <= 200
              ? IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      'questions_content_page',
                      arguments: ArgumentsQuestion(
                        questionId: widget.questionId + 1,
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                  ),
                )
              : const SizedBox(),
        ],
      ),
      body: FutureBuilder(
        future: _databaseQuery.getOneQuestion(widget.questionId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? CupertinoScrollbar(
                  child: SingleChildScrollView(
                    padding: MainAppStyle.mainPadding,
                    child: Column(
                      children: [
                        const Divider(indent: 16, endIndent: 16),
                        Text(
                          '${snapshot.data![0].numberQuestion}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(indent: 16, endIndent: 16),
                        Html(
                          data: snapshot.data![0].question,
                          style: {
                            '#': Style(
                              padding: EdgeInsets.zero,
                              margin: EdgeInsets.zero,
                              fontSize: const FontSize(18),
                              textAlign: TextAlign.center,
                              color: Colors.teal,
                            ),
                            'sup': Style(
                              fontSize: const FontSize(16),
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
                                  child: Html(
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
                        const Divider(indent: 16, endIndent: 16),
                        Html(
                          data: snapshot.data![0].answerContent,
                          style: {
                            '#': Style(
                                fontSize: const FontSize(18),
                                textAlign: TextAlign.justify,
                                color: Colors.black87),
                            'small': Style(
                              fontSize: const FontSize(12),
                              color: Colors.grey,
                            ),
                            'sup': Style(
                              fontSize: const FontSize(14),
                              color: Colors.purple,
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
                      ],
                    ),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
        },
      ),
    );
  }
}
