import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';
import 'package:majmua/data/database/local/model/hadeeth_model.dart';

class HadeethItem extends StatelessWidget {
  const HadeethItem({Key? key, required this.item}) : super(key: key);

  final HadeethModel item;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return CupertinoScrollbar(
      child: SingleChildScrollView(
        padding: AppStyles.mainPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Divider(indent: 16, endIndent: 16),
            Text(
              item.numberHadeeth,
              style: const TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const Divider(indent: 16, endIndent: 16),
            const SizedBox(height: 8),
            Text(
              item.titleHadeeth,
              style: TextStyle(
                fontSize: 18,
                color: appColors.firstAppColor,
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
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  fontSize: const FontSize(20),
                  direction: TextDirection.rtl,
                  lineHeight: const LineHeight(2),
                  fontFamily: 'Scheherazade',
                ),
                'small': Style(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  fontSize: const FontSize(12),
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
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  fontSize: const FontSize(18),
                  direction: TextDirection.ltr,
                ),
                'small': Style(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  fontSize: const FontSize(12),
                  direction: TextDirection.ltr,
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
