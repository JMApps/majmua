import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../data/repositories/hadith_data_repository.dart';
import '../../../data/services/databases/hadith_database_service.dart';
import '../../../domain/usecases/hadiths_use_case.dart';
import '../../state/book_settings_state.dart';
import '../../state/library/hadith_state.dart';
import '../../widgets/book_settings.dart';
import '../widgets/hadith_column.dart';

class HadithPage extends StatefulWidget {
  const HadithPage({super.key});

  @override
  State<HadithPage> createState() => _HadithPageState();
}

class _HadithPageState extends State<HadithPage> {
  final HadithDatabaseService _hadithDatabaseService = HadithDatabaseService();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HadithsState(
            HadithsUseCase(
              hadithsRepository: HadithDataRepository(_hadithDatabaseService),
            ),
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
            return HadithColumn(pageIndex: index + 1);
          },
          onPageChanged: (int page) {
            Provider.of<HadithsState>(context, listen: false).pageIndex = page;
          },
        ),
      ),
    );
  }
}
