import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:majmua/application/style/main_app_style.dart';
import 'package:majmua/data/database/model/arguments/arguments_hadeeth.dart';
import 'package:majmua/data/database/service/database_query.dart';

class HadeethContentPage extends StatefulWidget {
  const HadeethContentPage({
    Key? key,
    required this.hadeethId,
  }) : super(key: key);

  final int hadeethId;

  @override
  State<HadeethContentPage> createState() => _HadeethContentPageState();
}

class _HadeethContentPageState extends State<HadeethContentPage> {
  final DatabaseQuery _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('40 хадисов'),
        actions: [
          widget.hadeethId <= 41
              ? IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                context,
                'hadeeths_content_page',
                arguments: ArgumentsHadeeth(
                  hadeethId: widget.hadeethId + 1,
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
                          '${snapshot.data![0].numberHadeeth}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(indent: 16, endIndent: 16),
                        Text(
                          snapshot.data![0].titleHadeeth,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700,
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
                              fontSize: const FontSize(14),
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
                              fontSize: const FontSize(14),
                              color: Colors.orange,
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
