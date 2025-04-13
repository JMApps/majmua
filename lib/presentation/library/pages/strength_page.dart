import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../data/repositories/strength_data_repository.dart';
import '../../../data/services/databases/strength_database_service.dart';
import '../../../domain/usecases/strength_use_case.dart';
import '../../state/book_settings_state.dart';
import '../../state/library/strength_state.dart';
import '../../widgets/book_settings.dart';
import '../widgets/strength_column.dart';

class StrengthPage extends StatefulWidget {
  const StrengthPage({super.key});

  @override
  State<StrengthPage> createState() => _StrengthPageState();
}

class _StrengthPageState extends State<StrengthPage> {
  final StrengthDatabaseService _strengthDatabaseService = StrengthDatabaseService();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => StrengthState(
            StrengthUseCase(
              StrengthDataRepository(_strengthDatabaseService),
            ),
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
            return StrengthColumn(pageIndex: index + 1);
          },
          onPageChanged: (int page) {
            Provider.of<StrengthState>(context, listen: false).pageIndex = page;
          },
        ),
      ),
    );
  }
}
