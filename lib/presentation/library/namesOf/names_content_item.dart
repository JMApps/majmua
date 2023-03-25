import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:majmua/application/state/text_settings_state.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/data/database/models/names_clarification_of_model.dart';
import 'package:majmua/presentation/library/namesOf/ayahs_container.dart';
import 'package:majmua/presentation/library/namesOf/names_container.dart';
import 'package:provider/provider.dart';

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
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return CupertinoScrollbar(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(right: 16, bottom: 16, left: 16),
        child: Column(
          children: [
            NamesContainer(
              clarificationIndex: index,
            ),
            const SizedBox(height: 8),
            AyahsContainer(
              clarificationIndex: index,
            ),
            Consumer<TextSettingsState>(
              builder: (BuildContext context, bookSettingsState, _) {
                return SelectableHtml(
                  data: item.contentClarification,
                  style: {
                    '#': Style(
                      fontSize: FontSize(bookSettingsState.getFontSize),
                      color: appColors.mainTextColor,
                    ),
                    'small': Style(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      color: Colors.grey,
                      fontSize: const FontSize(12),
                    ),
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
