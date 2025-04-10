import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../data/repositories/questions_data_repository.dart';
import '../../../data/services/databases/questions_database_service.dart';
import '../../../domain/usecases/questions_use_case.dart';
import '../../state/book_settings_state.dart';
import '../../state/library/questions_state.dart';
import '../../widgets/book_settings.dart';
import '../widgets/questions_column.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  final QuestionsDatabaseService _questionsDatabaseService = QuestionsDatabaseService();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => QuestionsState(
            QuestionsUseCase(
              QuestionsDataRepository(_questionsDatabaseService),
            ),
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
            Consumer<BookSettingsState>(
              builder: (context, settings, _) {
                return IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => ChangeNotifierProvider.value(
                        value: settings,
                        child: BookSettings(),
                      ),
                    );
                  },
                  icon: Icon(Icons.settings),
                );
              },
            ),
          ],
        ),
        body: PageView.builder(
          itemCount: 65,
          itemBuilder: (context, index) {
            return QuestionsColumn(pageIndex: index + 1);
          },
          onPageChanged: (int page) {
            Provider.of<QuestionsState>(context, listen: false).pageIndex = page;
          },
        ),
      ),
    );
  }
}
