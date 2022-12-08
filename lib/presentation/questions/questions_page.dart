import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:majmua/application/state/main_app_state.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:provider/provider.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({
    Key? key,
    required this.numberQuestion,
    required this.questionId,
  }) : super(key: key);

  final String numberQuestion;
  final int questionId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(numberQuestion),
      ),
      body: FutureBuilder(
        future: context
            .read<MainAppState>()
            .getDatabaseQuery
            .getOneQuestion(questionId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? CupertinoScrollbar(
                  child: SingleChildScrollView(
                    padding: MainAppStyle.mainPadding,
                    child: Column(
                      children: [
                        Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: MainAppStyle.mainBorderRadius,
                          ),
                          child: Padding(
                            padding: MainAppStyle.mainPadding,
                            child: SelectableHtml(
                              data: snapshot.data![0].question,
                              style: {
                                '#': Style(
                                  padding: EdgeInsets.zero,
                                  margin: EdgeInsets.zero,
                                  fontSize: const FontSize(18),
                                  textAlign: TextAlign.center,
                                ),
                                'sup': Style(
                                  fontSize: const FontSize(12),
                                  color: Colors.purple,
                                ),
                              },
                              onLinkTap: (String? url,
                                  RenderContext rendContext,
                                  Map<String, String> attributes,
                                  element) {
                                showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (_) => SingleChildScrollView(
                                    child: Container(
                                      padding: MainAppStyle.mainPadding,
                                      margin: MainAppStyle.mainMargin,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            MainAppStyle.mainBorderRadius,
                                      ),
                                      child: Html(
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
                        const SizedBox(height: 16),
                        SelectableHtml(
                          data: snapshot.data![0].answerContent,
                          style: {
                            '#': Style(
                              fontSize: const FontSize(18),
                              textAlign: TextAlign.justify,
                            ),
                            'small': Style(
                              fontSize: const FontSize(12),
                              color: Colors.grey,
                            ),
                            'sup': Style(
                              fontSize: const FontSize(12),
                              color: Colors.green,
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
