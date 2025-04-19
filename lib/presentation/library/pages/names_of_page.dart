import 'package:flutter/material.dart';
import 'package:majmua/presentation/library/lists/names_of_chapters_list.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/app_route_names.dart';
import '../../../core/strings/app_string_constraints.dart';
import '../../../data/repositories/names_of_data_repository.dart';
import '../../../data/services/databases/names_of_database_service.dart';
import '../../../domain/usecases/names_of_use_case.dart';
import '../../state/book_settings_state.dart';
import '../../state/library/names_of_state.dart';
import '../lists/names_of_content.dart';
import '../widgets/book_settings_btn.dart';

class NamesOfPage extends StatefulWidget {
  const NamesOfPage({super.key});

  @override
  State<NamesOfPage> createState() => _NamesOfPageState();
}

class _NamesOfPageState extends State<NamesOfPage> {
  final NamesOfDatabaseService _namesOfDatabaseService = NamesOfDatabaseService();

  @override
  void dispose() {
    _namesOfDatabaseService.closeDatabase();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NamesOfState(
            namesOfUseCase: NamesOfUseCase(
              NamesOfDataRepository(_namesOfDatabaseService),
            ),
            keyLastBookPage: AppRouteNames.pageNamesOfContent,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => BookSettingsState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStringConstraints.theNamesOf),
          actions: [
            NamesOfChaptersList(),
            BookSettingsBtn(),
          ],
        ),
        body: Consumer<NamesOfState>(
          builder: (context,namesOfState, _) {
            return PageView.builder(
              controller: namesOfState.pageController,
              itemCount: 65,
              itemBuilder: (context, index) {
                return NamesOfContent(pageIndex: index + 1);
              },
              onPageChanged: (int page) {
                namesOfState.pageIndex = page;
              },
            );
          },
        ),
      ),
    );
  }
}
