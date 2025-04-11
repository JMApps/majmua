import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../data/repositories/lessons_data_repository.dart';
import '../../../data/services/databases/lessons_database_service.dart';
import '../../../domain/usecases/lessons_use_case.dart';
import '../../state/book_settings_state.dart';
import '../../state/library/lessons_state.dart';
import '../../widgets/book_settings.dart';
import '../widgets/lessons_column.dart';

class LessonsPage extends StatefulWidget {
  const LessonsPage({super.key});

  @override
  State<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  final LessonsDatabaseService _lessonsDatabaseService = LessonsDatabaseService();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LessonsState(
            LessonsUseCase(
              LessonsDataRepository(_lessonsDatabaseService),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => BookSettingsState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStringConstraints.lessonsRamadan),
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
            return LessonsColumn(pageIndex: index + 1);
          },
          onPageChanged: (int page) {
            Provider.of<LessonsState>(context, listen: false).pageIndex = page;
          },
        ),
      ),
    );
  }
}
