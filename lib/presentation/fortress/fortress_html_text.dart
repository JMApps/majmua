import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:majmua/core/themes/app_themes.dart';

import 'fortress_footnote.dart';

class FortressHtmlText extends StatelessWidget {
  const FortressHtmlText({
    super.key,
    required this.textData,
    required this.textSize,
    required this.textColor,
    required this.fontFamily,
    required this.footnoteColor,
    required this.textDataAlign,
  });

  final String textData;
  final double textSize;
  final Color textColor;
  final String fontFamily;
  final Color footnoteColor;
  final TextAlign textDataAlign;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Html(
      data: textData,
      style: {
        '#': Style(
          padding: HtmlPaddings.zero,
          margin: Margins.zero,
          fontSize: FontSize(textSize),
          fontFamily: fontFamily,
          color: textColor,
          textAlign: textDataAlign,
        ),
        'b': Style(
          padding: HtmlPaddings.zero,
          margin: Margins.zero,
          fontSize: FontSize(textSize),
          fontWeight: FontWeight.bold,
          fontFamily: fontFamily,
          color: textColor,
        ),
        'small': Style(
          padding: HtmlPaddings.zero,
          margin: Margins.zero,
          fontSize: FontSize(textSize - 5),
          fontFamily: fontFamily,
          color: Colors.grey,
        ),
        'a': Style(
          fontSize: FontSize(textSize - 5),
          fontFamily: fontFamily,
          fontWeight: FontWeight.bold,
          color: footnoteColor,
        ),
        'i': Style(
          fontSize: FontSize(textSize),
          fontWeight: FontWeight.w100,
          fontFamily: fontFamily,
          color: textColor,
        ),
      },
      onLinkTap: (String? url, _, __) {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: appColors.fullGlass,
          builder: (context) => FortressFootnote(
            footnoteId: url!,
            footnoteColor: footnoteColor,
          ),
        );
      },
    );
  }
}
