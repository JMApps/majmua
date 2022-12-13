import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/data/database/service/database_query.dart';

class HadeethPage extends StatefulWidget {
  const HadeethPage({
    Key? key,
    required this.hadeethTitle,
    required this.hadeethId,
  }) : super(key: key);

  final String hadeethTitle;
  final int hadeethId;

  @override
  State<HadeethPage> createState() => _HadeethPageState();
}

class _HadeethPageState extends State<HadeethPage> {
  final DatabaseQuery _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(widget.hadeethTitle),
      ),
      body: FutureBuilder(
        future: _databaseQuery.getOneHadeeth(widget.hadeethId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? CupertinoScrollbar(
                  child: SingleChildScrollView(
                    padding: MainAppStyle.mainPadding,
                    child: Column(
                      children: [
                        const Divider(indent: 16, endIndent: 16),
                        Text(
                          snapshot.data![0].titleHadeeth,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Divider(indent: 16, endIndent: 16),
                        Html(
                          data: snapshot.data![0].hadeethArabic,
                          style: {
                            '#': Style(
                                padding: EdgeInsets.zero,
                                margin: EdgeInsets.zero,
                                fontSize: const FontSize(18),
                                direction: TextDirection.rtl,
                                fontFamily: 'Lateef',
                                lineHeight: LineHeight.number(1.7)),
                            'small': Style(
                              fontSize: const FontSize(12),
                              color: Colors.grey,
                            ),
                            'sup': Style(
                              fontSize: const FontSize(12),
                              color: Colors.orange,
                            ),
                          },
                        ),
                        const Divider(indent: 16, endIndent: 16),
                        Html(
                          data: snapshot.data![0].hadeethTranslation,
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
                              color: Colors.orange,
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
