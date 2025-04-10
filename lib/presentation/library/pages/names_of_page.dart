import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../data/repositories/names_of_data_repository.dart';
import '../../../data/services/databases/names_of_database_service.dart';
import '../../../domain/usecases/names_of_use_case.dart';
import '../../state/book_settings_state.dart';
import '../../state/library/names_of_state.dart';
import '../../widgets/book_settings.dart';
import '../widgets/names_of_column.dart';

class NamesOfPage extends StatefulWidget {
  const NamesOfPage({super.key});

  @override
  State<NamesOfPage> createState() => _NamesOfPageState();
}

class _NamesOfPageState extends State<NamesOfPage> {
  final NamesOfDatabaseService _namesOfDatabaseService = NamesOfDatabaseService();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NamesOfState(
            NamesOfUseCase(
              NamesOfDataRepository(_namesOfDatabaseService),
            ),
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
            return NamesOfColumn(pageIndex: index + 1);
          },
          onPageChanged: (int page) {
            Provider.of<NamesOfState>(context, listen: false).pageIndex = page;
          },
        ),
      ),
    );
  }
}
