import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:majmua/application/state/text_settings_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/data/database/models/lesson_model.dart';
import 'package:provider/provider.dart';

class LessonItem extends StatelessWidget {
  const LessonItem({Key? key, required this.item}) : super(key: key);

  final LessonModel item;

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
                Text(
                  item.numberChapter,
                  style: TextStyle(
                    fontSize: bookSettingsState.getFontSize,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Divider(indent: 16, endIndent: 16),
                const SizedBox(height: 8),
                Text(
                  item.titleChapter,
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
                  data: item.contentChapter,
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
                      fontSize: FontSize(bookSettingsState.getFontSize - 6),
                      color: Colors.grey,
                      direction: TextDirection.ltr,
                    ),
                    'a': Style(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      fontSize: const FontSize(18),
                      color: appColors.firstAppColor,
                    ),
                  },
                  onLinkTap: (String? url, RenderContext rendContext,
                      Map<String, String> attributes, element) {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) => CupertinoActionSheet(
                        message: Html(
                          data: url,
                          style: {
                            '#': Style(
                              padding: EdgeInsets.zero,
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
                        actions: [
                          CupertinoButton(
                            child: Text(
                              AppString.close,
                              style: TextStyle(
                                color: appColors.thirdAppColor,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
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
