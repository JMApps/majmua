import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/app_route_names.dart';
import '../../../core/strings/app_string_constraints.dart';
import '../../../data/repositories/lessons_data_repository.dart';
import '../../../data/services/databases/lessons_database_service.dart';
import '../../../domain/usecases/lessons_use_case.dart';
import '../../state/book_settings_state.dart';
import '../../state/library/lessons_state.dart';
import '../lists/lesson_chapters_list.dart';
import '../lists/lesson_content.dart';
import '../widgets/book_settings_btn.dart';

class LessonsPage extends StatefulWidget {
  const LessonsPage({super.key});

  @override
  State<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  final LessonsDatabaseService _lessonsDatabaseService = LessonsDatabaseService();

  @override
  void dispose() {
    _lessonsDatabaseService.closeDatabase();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LessonsState(
            lessonsUseCase: LessonsUseCase(
              LessonsDataRepository(_lessonsDatabaseService),
            ),
            keyLastBookPage: AppRouteNames.pageLessonsContent,
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
            LessonChaptersList(),
            BookSettingsBtn(),
          ],
        ),
        body: Consumer<LessonsState>(
          builder: (context, lessonsState, _) {
            return PageView.builder(
              controller: lessonsState.pageController,
              itemCount: 31,
              itemBuilder: (context, index) {
                return LessonContent(pageIndex: index + 1);
              },
              onPageChanged: (int page) {
                lessonsState.pageIndex = page;
              },
            );
          },
        ),
      ),
    );
  }
}
