import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:majmua/application/state/text_settings_state.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/data/database/models/hadeeth_model.dart';
import 'package:provider/provider.dart';

class HadeethItem extends StatelessWidget {
  const HadeethItem({Key? key, required this.item}) : super(key: key);

  final HadeethModel item;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return CupertinoScrollbar(
      child: SingleChildScrollView(
        padding: AppWidgetStyle.mainPadding,
        child: Consumer<TextSettingsState>(
          builder: (BuildContext context, bookSettingsState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Divider(indent: 16, endIndent: 16),
                SelectableText(
                  item.numberHadeeth,
                  style: TextStyle(
                    fontSize: bookSettingsState.getFontSize,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Divider(indent: 16, endIndent: 16),
                const SizedBox(height: 8),
                SelectableText(
                  item.titleHadeeth,
                  style: TextStyle(
                    fontSize: bookSettingsState.getFontSize,
                    color: appColors.thirdAppColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Divider(indent: 16, endIndent: 16),
                const SizedBox(height: 8),
                Html(
                  data: item.hadeethArabic,
                  style: {
                    '#': Style(
                      padding: HtmlPaddings.zero,
                      margin: Margins.zero,
                      fontSize: FontSize(bookSettingsState.getFontSize + 2),
                      direction: TextDirection.rtl,
                      lineHeight: const LineHeight(2),
                      fontFamily: 'Scheherazade',
                    ),
                    'small': Style(
                      fontSize: FontSize(bookSettingsState.getFontSize - 6),
                      direction: TextDirection.rtl,
                      lineHeight: const LineHeight(2),
                      fontFamily: 'Scheherazade',
                    ),
                  },
                ),
                const Divider(indent: 16, endIndent: 16),
                const SizedBox(height: 8),
                Html(
                  data: item.hadeethTranslation,
                  style: {
                    '#': Style(
                      padding: HtmlPaddings.zero,
                      margin: Margins.zero,
                      fontSize: FontSize(bookSettingsState.getFontSize),
                      direction: TextDirection.ltr,
                    ),
                    'small': Style(
                      fontSize: FontSize(bookSettingsState.getFontSize - 6),
                      direction: TextDirection.ltr,
                    ),
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
