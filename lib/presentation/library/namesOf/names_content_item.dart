import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:majmua/data/database/local/model/names_clarification_of_model.dart';
import 'package:majmua/presentation/library/namesOf/ayahs_container.dart';
import 'package:majmua/presentation/library/namesOf/names_container.dart';

class NamesContentItem extends StatelessWidget {
  const NamesContentItem({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  final NamesClarificationOfModel item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(right: 16, bottom: 16, left: 16),
        child: Column(
          children: [
            NamesContainer(
              clarificationIndex: index,
            ),
            AyahsContainer(
              clarificationIndex: index,
            ),
            Html(
              data: item.contentClarification,
              style: {
                '#': Style(
                  padding: const EdgeInsets.only(top: 8),
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
          ],
        ),
      ),
    );
  }
}
