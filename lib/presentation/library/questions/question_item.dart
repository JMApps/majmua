import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:majmua/application/state/text_settings_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/data/database/models/question_model.dart';
import 'package:majmua/presentation/widgets/for_footnote_html_text.dart';
import 'package:provider/provider.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({Key? key, required this.item}) : super(key: key);

  final QuestionModel item;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return CupertinoScrollbar(
      child: SingleChildScrollView(
        padding: AppWidgetStyle.mainPadding,
        child: Consumer<TextSettingsState>(
          builder: (BuildContext context, bookSettingsState, _) {
            return SelectableRegion(
              focusNode: FocusNode(),
              selectionControls: materialTextSelectionControls,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Divider(indent: 16, endIndent: 16),
                  Text(
                    '${AppString.question} ${item.id}',
                    style: TextStyle(
                      fontSize: bookSettingsState.getFontSize,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Divider(indent: 16, endIndent: 16),
                  const SizedBox(height: 8),
                  Html(
                    data: item.question,
                    style: {
                      '#': Style(
                        padding: HtmlPaddings.zero,
                        margin: Margins.zero,
                        fontSize: FontSize(bookSettingsState.getFontSize),
                        color: appColors.thirdAppColor,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.bold,
                      ),
                      'small': Style(
                        fontSize: FontSize(bookSettingsState.getFontSize - 6),
                      ),
                      'a': Style(
                        fontSize: FontSize(bookSettingsState.getFontSize),
                        color: appColors.thirdAppColor,
                      ),
                    },
                    onLinkTap: (String? url, _, __) {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) =>
                            ForFootnoteHtmlText(
                              footnoteContent: url!,
                            ),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  const Divider(indent: 16, endIndent: 16),
                  Text(
                    AppString.answer,
                    style: TextStyle(
                      fontSize: bookSettingsState.getFontSize,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Divider(indent: 16, endIndent: 16),
                  Html(
                    data: item.answerContent,
                    style: {
                      '#': Style(
                        padding: HtmlPaddings.zero,
                        margin: Margins.zero,
                        fontSize: FontSize(bookSettingsState.getFontSize),
                      ),
                      'small': Style(
                        fontSize: FontSize(bookSettingsState.getFontSize - 6),
                      ),
                      'a': Style(
                        fontSize: FontSize(18),
                        color: appColors.thirdAppColor,
                      ),
                    },
                    onLinkTap: (String? url, _, __) {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) =>
                            ForFootnoteHtmlText(
                              footnoteContent: url!,
                            ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
