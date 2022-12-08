import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:majmua/application/state/main_app_state.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:provider/provider.dart';

class LessonsRamadanPage extends StatelessWidget {
  const LessonsRamadanPage({
    Key? key,
    required this.numberChapter,
    required this.chapterId,
  }) : super(key: key);

  final String numberChapter;
  final int chapterId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(numberChapter),
      ),
      body: FutureBuilder(
        future: context
            .read<MainAppState>()
            .getDatabaseQuery
            .getOneLessonRamadan(chapterId),
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
                            child: Text(
                              snapshot.data![0].titleChapter,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Html(
                          data: snapshot.data![0].contentChapter,
                          style: {
                            '#': Style(
                              fontSize: const FontSize(18),
                              textAlign: TextAlign.justify,
                            ),
                            'small': Style(
                              fontSize: const FontSize(12),
                              color: Colors.grey,
                            ),
                            'a': Style(
                              fontSize: const FontSize(12),
                              color: Colors.brown,
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
