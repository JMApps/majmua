import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';


class HadithsHtmlData extends StatelessWidget {
  const HadithsHtmlData({
    super.key,
    required this.htmlData,
    required this.footnoteColor,
    required this.font,
    required this.fontSize,
    required this.textAlign,
    required this.fontColor,
    required this.textDirection,
  });

  final String htmlData;
  final Color footnoteColor;
  final String font;
  final double fontSize;
  final TextAlign textAlign;
  final Color fontColor;

  final TextDirection textDirection;

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
          color: fontColor,
          direction: textDirection,
        ),
        'small': Style(
          fontSize: FontSize(12.0),
        ),
        'a': Style(
          margin: Margins.zero,
          padding: HtmlPaddings.zero,
          fontSize: FontSize(fontSize - 3.0),
          letterSpacing: 1.5,
          color: footnoteColor,
          fontWeight: FontWeight.bold,
        ),
      },
    );
  }
}
