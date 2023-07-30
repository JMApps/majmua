import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';

class ForFootnoteHtmlText extends StatelessWidget {
  const ForFootnoteHtmlText({super.key, required this.footnoteContent});

  final String footnoteContent;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppWidgetStyle.mainMargin,
      color: appColors.defaultCardColor,
      child: SingleChildScrollView(
        padding: AppWidgetStyle.mainPadding,
        child: Html(
          data: footnoteContent,
          style: {
            '#': Style(
              padding: HtmlPaddings.zero,
              margin: Margins.zero,
              fontSize: FontSize(18),
            ),
            'small': Style(
              color: Colors.grey,
              fontSize: FontSize(12),
            ),
          },
        ),
      ),
    );
  }
}
