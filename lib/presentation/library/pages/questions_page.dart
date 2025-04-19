import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/app_route_names.dart';
import '../../../core/strings/app_string_constraints.dart';
import '../../../data/repositories/questions_data_repository.dart';
import '../../../data/services/databases/questions_database_service.dart';
import '../../../domain/usecases/questions_use_case.dart';
import '../../state/book_settings_state.dart';
import '../../state/library/questions_state.dart';
import '../lists/question_chapters_list.dart';
import '../lists/question_content.dart';
import '../widgets/book_settings_btn.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  final QuestionsDatabaseService _questionsDatabaseService = QuestionsDatabaseService();

  @override
  void dispose() {
    _questionsDatabaseService.closeDatabase();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => QuestionsState(
            questionsUseCase: QuestionsUseCase(
              QuestionsDataRepository(_questionsDatabaseService),
            ),
            keyLastBookPage: AppRouteNames.pageQuestionsContent,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => BookSettingsState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStringConstraints.questions200),
          actions: [
            QuestionChaptersList(),
            BookSettingsBtn(),
          ],
        ),
        body: Consumer<QuestionsState>(
          builder: (context, questionsState, _) {
            return PageView.builder(
              controller: questionsState.pageController,
              itemCount: 201,
              itemBuilder: (context, index) {
                return QuestionContent(pageIndex: index + 1);
              },
              onPageChanged: (int page) {
                questionsState.pageIndex = page;
              },
            );
          },
        ),
      ),
    );
  }
}
