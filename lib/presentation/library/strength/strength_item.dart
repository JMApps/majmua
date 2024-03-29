import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/strength_entity.dart';
import '../../state/book_settings_state.dart';
import 'strength_html_text.dart';

class StrengthItem extends StatelessWidget {
  const StrengthItem({
    super.key,
    required this.model,
    required this.myController,
  });

  final StrengthEntity model;
  final ScrollController myController;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return CupertinoScrollbar(
      controller: myController,
      child: SingleChildScrollView(
        primary: true,
        padding: AppStyles.mainMardingMini,
        child: Consumer<BookSettingsState>(
          builder:
              (BuildContext context, BookSettingsState bookSettingsState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  model.paragraph.toUpperCase(),
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
                  child: StrengthHtmlText(
                    textData: model.chapterTitle,
                    textSize: bookSettingsState.getTextSize.toDouble(),
                    textColor: appColors.inverseSurface,
                    fontFamily: 'Gilroy',
                    footnoteColor: appColors.quaternaryColor,
                    textDataAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 8),
                StrengthHtmlText(
                  textData: model.chapterContent,
                  textSize: bookSettingsState.getTextSize.toDouble(),
                  textColor: appColors.inverseSurface,
                  fontFamily: 'Gilroy',
                  footnoteColor: appColors.quaternaryColor,
                  textDataAlign: bookSettingsState.getTextAlign,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
