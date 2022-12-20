import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/data/database/model/arguments/arguments_raqaiq.dart';
import 'package:majmua/data/database/service/database_query.dart';

class RaqaiqContentPage extends StatefulWidget {
  const RaqaiqContentPage({
    Key? key,
    required this.chapterId,
  }) : super(key: key);

  final int chapterId;

  @override
  State<RaqaiqContentPage> createState() => _RaqaiqContentPageState();
}

class _RaqaiqContentPageState extends State<RaqaiqContentPage> {
  final DatabaseQuery _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Ракъаикъ Къуран'),
        actions: [
          widget.chapterId <= 14
              ? IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      'raqaiq_content_page',
                      arguments: ArgumentsRaqaiq(
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
        future: _databaseQuery.getOneRaqaiq(widget.chapterId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? CupertinoScrollbar(
                  child: SingleChildScrollView(
                    padding: MainAppStyle.mainPadding,
                    child: Column(
                      children: [
                        const Divider(indent: 16, endIndent: 16),
                        Text(
                          'Глава ${widget.chapterId}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(indent: 16, endIndent: 16),
                        Text(
                          snapshot.data![0].chapterTitle,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.orange.shade700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Divider(indent: 16, endIndent: 16),
                        Html(
                          data: '${snapshot.data![0].chapterContent}',
                          style: {
                            '#': Style(
                              fontSize: const FontSize(18),
                              textAlign: TextAlign.justify,
                            )
                          }
                        )
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
