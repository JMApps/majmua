import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../data/repositories/raqaiq_data_repository.dart';
import '../../../data/services/databases/raqaiq_database_service.dart';
import '../../../domain/usecases/raqaiq_use_case.dart';
import '../../state/book_settings_state.dart';
import '../../state/library/raqaiq_state.dart';
import '../../widgets/book_settings.dart';
import '../widgets/raqaiq_column.dart';

class RaqaiqPage extends StatefulWidget {
  const RaqaiqPage({super.key});

  @override
  State<RaqaiqPage> createState() => _RaqaiqPageState();
}

class _RaqaiqPageState extends State<RaqaiqPage> {
  final RaqaiqDatabaseService _raqaiqDatabaseService = RaqaiqDatabaseService();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RaqaiqState(
            RaqaiqUseCase(
              RaqaiqDataRepository(_raqaiqDatabaseService),
            ),
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
            return RaqaiqColumn(pageIndex: index + 1);
          },
          onPageChanged: (int page) {
            Provider.of<RaqaiqState>(context, listen: false).pageIndex = page;
          },
        ),
      ),
    );
  }
}
