import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:majmua/application/state/text_settings_state.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/data/database/models/raqaiq_model.dart';
import 'package:provider/provider.dart';

class RaqaiqItem extends StatelessWidget {
  const RaqaiqItem({Key? key, required this.item}) : super(key: key);

  final RaqaiqModel item;

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
                const SizedBox(height: 8),
                SelectableText(
                  item.chapterTitle,
                  style: TextStyle(
                    fontSize: bookSettingsState.getFontSize,
                    color: appColors.thirdAppColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Divider(indent: 16, endIndent: 16),
                const SizedBox(height: 8),
                SelectableHtml(
                  data: item.chapterContent,
                  style: {
                    '#': Style(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      fontSize: FontSize(bookSettingsState.getFontSize),
                      direction: TextDirection.ltr,
                    ),
                    'small': Style(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      color: Colors.grey,
                      fontSize: FontSize(bookSettingsState.getFontSize - 6),
                      direction: TextDirection.ltr,
                    ),
                    'a': Style(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      fontSize: const FontSize(18),
                      color: appColors.firstAppColor,
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
