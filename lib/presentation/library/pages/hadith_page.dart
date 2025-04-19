import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/app_route_names.dart';
import '../../../core/strings/app_string_constraints.dart';
import '../../../data/repositories/hadith_data_repository.dart';
import '../../../data/services/databases/hadith_database_service.dart';
import '../../../domain/usecases/hadiths_use_case.dart';
import '../../state/book_settings_state.dart';
import '../../state/library/hadith_state.dart';
import '../lists/hadith_chapters_list.dart';
import '../lists/hadith_content.dart';
import '../widgets/book_settings_btn.dart';

class HadithPage extends StatefulWidget {
  const HadithPage({super.key});

  @override
  State<HadithPage> createState() => _HadithPageState();
}

class _HadithPageState extends State<HadithPage> {
  final HadithDatabaseService _hadithDatabaseService = HadithDatabaseService();

  @override
  void dispose() {
    _hadithDatabaseService.closeDatabase();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HadithsState(
            hadithsUseCase: HadithsUseCase(
              hadithsRepository: HadithDataRepository(_hadithDatabaseService),
            ),
            keyLastBookPage: AppRouteNames.pageHadithsContent,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => BookSettingsState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStringConstraints.hadith40),
          actions: [
            HadithChaptersList(),
            BookSettingsBtn(),
          ],
        ),
        body: Consumer<HadithsState>(
          builder: (context, hadithsState, _) {
            return PageView.builder(
              itemCount: 42,
              controller: hadithsState.pageController,
              itemBuilder: (context, index) {
                return HadithContent(pageIndex: index + 1);
              },
              onPageChanged: (int page) {
                hadithsState.pageIndex = page;
              },
            );
          },
        ),
      ),
    );
  }
}
