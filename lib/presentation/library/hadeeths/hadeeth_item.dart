import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/hadeeth_entity.dart';
import '../../state/book_settings_state.dart';
import 'hadeeth_html_text.dart';

class HadeethItem extends StatelessWidget {
  const HadeethItem({
    super.key,
    required this.model,
  });

  final HadeethEntity model;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return CupertinoScrollbar(
      child: SingleChildScrollView(
        padding: AppStyles.mainMardingMini,
        child: Consumer<BookSettingsState>(
          builder: (BuildContext context, BookSettingsState bookSettingsState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  model.hadeethNumber.toUpperCase(),
                  style: TextStyle(
                    color: appColors.secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Container(
                  padding: AppStyles.mainMardingMini,
                  decoration: BoxDecoration(
                    color: appColors.inversePrimary,
                    borderRadius: AppStyles.mainBorderRadiusMini,
                  ),
                  child: Text(
                    model.hadeethTitle,
                    style: TextStyle(
                      fontSize: bookSettingsState.getTextSize.toDouble(),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
                HadeethHtmlText(
                  textData: model.hadeethArabic,
                  textSize: bookSettingsState.getTextSize.toDouble() + 3,
                  textColor: appColors.inverseSurface,
                  fontFamily: 'Scheherazade',
                  footnoteColor: appColors.quaternaryColor,
                  textDataAlign: bookSettingsState.getTextAlign,
                  textDirection: TextDirection.rtl,
                  textHeight: 1.75,
                ),
                const SizedBox(height: 8),
                HadeethHtmlText(
                  textData: model.hadeethTranslation,
                  textSize: bookSettingsState.getTextSize.toDouble(),
                  textColor: appColors.inverseSurface,
                  fontFamily: 'Gilroy',
                  footnoteColor: appColors.quaternaryColor,
                  textDataAlign: bookSettingsState.getTextAlign,
                  textDirection: TextDirection.ltr,
                  textHeight: 1,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
