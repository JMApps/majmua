import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/data/database/local/model/names_clarification_of_model.dart';
import 'package:majmua/presentation/library/namesOf/ayahss_container.dart';
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
        padding: AppStyles.mainPadding,
        child: Column(
          children: [
            NamesContainer(
              clarificationIndex: index,
            ),
            const SizedBox(height: 16),
            AyahsContainer(
              clarificationIndex: index,
            ),
            Html(
              data: item.contentClarification,
              style: {
                '#': Style(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  fontSize: const FontSize(18),
                ),
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
