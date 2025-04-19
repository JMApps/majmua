import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/app_route_names.dart';
import '../../../core/strings/app_string_constraints.dart';
import '../../../data/repositories/strength_data_repository.dart';
import '../../../data/services/databases/strength_database_service.dart';
import '../../../domain/usecases/strength_use_case.dart';
import '../../state/book_settings_state.dart';
import '../../state/library/strength_state.dart';
import '../lists/strength_chapters_list.dart';
import '../lists/strength_content.dart';
import '../widgets/book_settings_btn.dart';

class StrengthPage extends StatefulWidget {
  const StrengthPage({super.key});

  @override
  State<StrengthPage> createState() => _StrengthPageState();
}

class _StrengthPageState extends State<StrengthPage> {
  final StrengthDatabaseService _strengthDatabaseService = StrengthDatabaseService();

  @override
  void dispose() {
    _strengthDatabaseService.closeDatabase();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => StrengthState(
            strengthUseCase: StrengthUseCase(
              StrengthDataRepository(_strengthDatabaseService),
            ),
            keyLastBookPage: AppRouteNames.pageStrengthContent,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => BookSettingsState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStringConstraints.strengthOfWill),
          actions: [
            StrengthChaptersList(),
            BookSettingsBtn(),
          ],
        ),
        body: Consumer<StrengthState>(
          builder: (context, strengthState, _) {
            return PageView.builder(
              controller: strengthState.pageController,
              itemCount: 85,
              itemBuilder: (context, index) {
                return StrengthContent(pageIndex: index + 1);
              },
              onPageChanged: (int page) {
                strengthState.pageIndex = page;
              },
            );
          },
        ),
      ),
    );
  }
}
