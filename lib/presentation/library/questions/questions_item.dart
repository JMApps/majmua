import 'package:flutter/material.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/library/questions/question_html_text.dart';
import 'package:majmua/presentation/state/book_settings_state.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/question_entity.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({
    super.key,
    required this.model,
  });

  final QuestionEntity model;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      padding: AppStyles.mainMardingMini,
      child: Consumer<BookSettingsState>(
        builder: (BuildContext context, BookSettingsState bookSettingsState, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                model.questionNumber,
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
                child: QuestionHtmlText(
                  textData: model.questionContent,
                  textSize: bookSettingsState.getTextSize.toDouble(),
                  textColor: appColors.inverseSurface,
                  fontFamily: 'Gilroy',
                  footnoteColor: appColors.quaternaryColor,
                  textDataAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8),
              QuestionHtmlText(
                textData: model.answerContent,
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
    );
  }
}
