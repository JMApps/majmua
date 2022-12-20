import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/data/database/model/arguments/arguments_lesson_ramadan.dart';
import 'package:majmua/data/database/service/database_query.dart';

class LessonsRamadanContentPage extends StatefulWidget {
  const LessonsRamadanContentPage({
    Key? key,
    required this.chapterId,
  }) : super(key: key);

  final int chapterId;

  @override
  State<LessonsRamadanContentPage> createState() =>
      _LessonsRamadanContentPageState();
}

class _LessonsRamadanContentPageState extends State<LessonsRamadanContentPage> {
  final DatabaseQuery _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Уроки Рамадана'),
        actions: [
          widget.chapterId <= 30
              ? IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      'lessons_ramadan_content_page',
                      arguments: ArgumentsLessonRamadan(
                        chapterId: widget.chapterId + 1,
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
        future: _databaseQuery.getOneLessonRamadan(widget.chapterId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? CupertinoScrollbar(
                  child: SingleChildScrollView(
                    padding: MainAppStyle.mainPadding,
                    child: Column(
                      children: [
                        const Divider(indent: 16, endIndent: 16),
                        Text(
                          '${snapshot.data![0].numberChapter}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(indent: 16, endIndent: 16),
                        Text(
                          snapshot.data![0].titleChapter,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Divider(indent: 16, endIndent: 16),
                        Html(
                          data: snapshot.data![0].contentChapter,
                          style: {
                            '#': Style(
                              padding: EdgeInsets.zero,
                              margin: EdgeInsets.zero,
                              fontSize: const FontSize(18),
                              textAlign: TextAlign.justify,
                            ),
                            'small': Style(
                              fontSize: const FontSize(12),
                              color: Colors.grey,
                            ),
                            'a': Style(
                              fontSize: const FontSize(14),
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
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
