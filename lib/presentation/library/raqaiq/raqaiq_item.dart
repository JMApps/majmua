import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/raqaiq_entity.dart';
import '../../state/book_settings_state.dart';
import 'raqaiq_html_text.dart';

class RaqaiqItem extends StatelessWidget {
  const RaqaiqItem({
    super.key,
    required this.model,
  });

  final RaqaiqEntity model;

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
                const SizedBox(height: 8),
                Container(
                  padding: AppStyles.mainMardingMini,
                  decoration: BoxDecoration(
                    color: appColors.inversePrimary,
                    borderRadius: AppStyles.mainBorderRadiusMini,
                  ),
                  child: Text(
                    model.chapterTitle,
                    style: TextStyle(
                      fontSize: bookSettingsState.getTextSize.toDouble(),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 8),
                RaqaiqHtmlText(
                  textData: model.chapterContent,
                  textSize: bookSettingsState.getTextSize.toDouble(),
                  textColor: appColors.inverseSurface,
                  fontFamily: 'Gilroy',
                  footnoteColor: appColors.quaternaryColor,
                  textDataAlign: bookSettingsState.getTextAlign,
                  textDirection: TextDirection.ltr,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
