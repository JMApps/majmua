import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../state/library/strength_state.dart';
import 'strength_footnote_data.dart';

class StrengthHtmlData extends StatelessWidget {
  const StrengthHtmlData({
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
          fontSize: FontSize(fontSize - 3.0),
          letterSpacing: 1.5,
          color: footnoteColor,
          fontWeight: FontWeight.bold,
          fontFamily: AppStringConstraints.fontGilroyMedium,
        ),
      },
      onLinkTap: (String? footnoteNumber, _, __) {
        showModalBottomSheet(
          context: (context),
          isScrollControlled: true,
          builder: (_) => ChangeNotifierProvider.value(
            value: Provider.of<StrengthState>(context, listen: false),
            child: StrengthFootnoteData(
              footnoteNumber: int.parse(footnoteNumber!),
              footnoteColor: footnoteColor,
            ),
          ),
        );
      },
    );
  }
}
