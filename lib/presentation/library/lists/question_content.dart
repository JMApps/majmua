import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/question_entity.dart';
import '../../state/book_settings_state.dart';
import '../../state/library/questions_state.dart';
import '../../widgets/app_error_text.dart';
import '../widgets/questions_html_data.dart';

class QuestionContent extends StatefulWidget {
  const QuestionContent({
    super.key,
    required this.pageIndex,
  });

  final int pageIndex;

  @override
  State<QuestionContent> createState() => _QuestionContentState();
}

class _QuestionContentState extends State<QuestionContent> {
  late final Future<QuestionEntity> _futureQuestions;

  @override
  void initState() {
    super.initState();
    _futureQuestions = Provider.of<QuestionsState>(context, listen: false).getQuestionById(questionId: widget.pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return FutureBuilder<QuestionEntity>(
      future: _futureQuestions,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return AppErrorText(text: snapshot.error.toString());
        }
        if (snapshot.hasData) {
          final QuestionEntity model = snapshot.data!;
          return SelectableRegion(
            selectionControls: Platform.isAndroid ? MaterialTextSelectionControls() : CupertinoTextSelectionControls(),
            child: Scrollbar(
              child: SingleChildScrollView(
                padding: AppStyles.mainMardingMini,
                child: Consumer<BookSettingsState>(
                  builder: (context, settings, _) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Card(
                          color: appColors.secondary.withAlpha(35),
                          elevation: 0,
                          child: Padding(
                            padding: AppStyles.mainMarding,
                            child: QuestionsHtmlData(
                              htmlData: '<b>${model.questionNumber}</b><br/>${model.questionContent}',
                              footnoteColor: appColors.primary,
                              font: AppStringConstraints.fontGilroyMedium,
                              fontSize: settings.textSize,
                              textAlign: TextAlign.center,
                              fontColor: appColors.onSurface,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        QuestionsHtmlData(
                          htmlData: model.answerContent,
                          footnoteColor: appColors.primary,
                          font: AppStringConstraints.fontGilroyMedium,
                          fontSize: settings.textSize,
                          textAlign: AppStyles.fontAligns[settings.textAlignIndex],
                          fontColor: appColors.onSurface,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
