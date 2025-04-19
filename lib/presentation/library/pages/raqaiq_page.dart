import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/app_route_names.dart';
import '../../../core/strings/app_string_constraints.dart';
import '../../../data/repositories/raqaiq_data_repository.dart';
import '../../../data/services/databases/raqaiq_database_service.dart';
import '../../../domain/usecases/raqaiq_use_case.dart';
import '../../state/book_settings_state.dart';
import '../../state/library/raqaiq_state.dart';
import '../lists/raqaiq_chapters_list.dart';
import '../lists/raqaiq_content.dart';
import '../widgets/book_settings_btn.dart';

class RaqaiqPage extends StatefulWidget {
  const RaqaiqPage({super.key});

  @override
  State<RaqaiqPage> createState() => _RaqaiqPageState();
}

class _RaqaiqPageState extends State<RaqaiqPage> {
  final RaqaiqDatabaseService _raqaiqDatabaseService = RaqaiqDatabaseService();

  @override
  void dispose() {
    _raqaiqDatabaseService.closeDatabase();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RaqaiqState(
            raqaiqUseCase: RaqaiqUseCase(
              RaqaiqDataRepository(_raqaiqDatabaseService),
            ),
            keyLastBookPage: AppRouteNames.pageRaqaiqContent,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => BookSettingsState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStringConstraints.raqaiqQuran),
          actions: [
            RaqaiqChaptersList(),
            BookSettingsBtn(),
          ],
        ),
        body: Consumer<RaqaiqState>(
          builder: (context, raqaiqState, _) {
            return PageView.builder(
              controller: raqaiqState.pageController,
              itemCount: 15,
              itemBuilder: (context, index) {
                return RaqaiqContent(pageIndex: index + 1);
              },
              onPageChanged: (int page) {
                raqaiqState.pageIndex = page;
              },
            );
          },
        ),
      ),
    );
  }
}
