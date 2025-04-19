import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/question_entity.dart';
import '../../state/library/questions_state.dart';
import '../../widgets/app_error_text.dart';
import '../widgets/questions_html_data.dart';

class QuestionChaptersList extends StatelessWidget {
  const QuestionChaptersList({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final itemOddColor = appColors.primary.withAlpha(20);
    final itemEvenColor = appColors.primary.withAlpha(10);
    return Consumer<QuestionsState>(
      builder: (context, questionsState, _) {
        return IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return ChangeNotifierProvider.value(
                  value: questionsState,
                  child: FutureBuilder<List<QuestionEntity>>(
                    future: questionsState.getAllQuestions(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return AppErrorText(text: snapshot.error.toString());
                      }
                      if (snapshot.hasData) {
                        return Scrollbar(
                          child: ListView.builder(
                            padding: AppStyles.mardingHorizontalMini,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final QuestionEntity model = snapshot.data![index];
                              return Container(
                                margin: AppStyles.mardingBottomMini,
                                decoration: BoxDecoration(
                                  borderRadius: AppStyles.mainBorder,
                                  color: index.isOdd ? itemOddColor : itemEvenColor,
                                ),
                                child: ListTile(
                                  onTap: () {
                                    questionsState.pageIndex = index;
                                    questionsState.pageController.animateToPage(questionsState.pageIndex, duration: Duration(milliseconds: 350), curve: Curves.easeIn);
                                    Navigator.pop(context);
                                  },
                                  title: Text(
                                    model.questionNumber,
                                    style: AppStyles.mainTextStyleMiniBold,
                                  ),
                                  subtitle: QuestionsHtmlData(
                                    htmlData: model.questionContent,
                                    footnoteColor: appColors.primary,
                                    font: AppStringConstraints.fontGilroy,
                                    fontSize: 16.0,
                                    textAlign: TextAlign.start,
                                    fontColor: appColors.onSurface,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    },
                  ),
                );
              },
            );
          },
          icon: Icon(Icons.format_list_numbered),
        );
      },
    );
  }
}
