import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../core/strings/app_string_constraints.dart';
import 'fortress_footnote_data.dart';

class FortressHtmlData extends StatelessWidget {
  const FortressHtmlData({
    super.key,
    required this.htmlData,
    required this.footnoteColor,
    required this.font,
    required this.fontSize,
    required this.textAlign,
    required this.fontColor,
  });

  final String htmlData;
  final Color footnoteColor;
  final String font;
  final double fontSize;
  final TextAlign textAlign;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Html(
      data: htmlData,
      style: {
        '#': Style(
          margin: Margins.zero,
          padding: HtmlPaddings.zero,
          fontFamily: font,
          fontSize: FontSize(fontSize),
          textAlign: textAlign,
          color: fontColor
        ),
        'small': Style(
          fontSize: FontSize(12.0)
        ),
        'a': Style(
          margin: Margins.zero,
          padding: HtmlPaddings.zero,
          fontSize: FontSize(fontSize - 3),
          letterSpacing: 1.5,
          color: footnoteColor,
          fontWeight: FontWeight.bold,
          fontFamily: AppStringConstraints.fontGilroy,
        ),
      },
      onLinkTap: (String? footnoteNumber, _, __) {
        showModalBottomSheet(
          context: (context),
          isScrollControlled: true,
          builder: (_) => FortressFootnoteData(
            footnoteNumber: int.parse(footnoteNumber!),
            footnoteColor: footnoteColor,
          ),
        );
      },
    );
  }
}
