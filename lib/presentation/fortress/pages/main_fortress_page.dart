import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/fortress_chapter_data_repository.dart';
import '../../../data/repositories/fortress_data_repository.dart';
import '../../../data/repositories/fortress_footnote_data_repository.dart';
import '../../../data/services/databases/fortress_database_service.dart';
import '../../../domain/usecases/fortress_chapter_use_case.dart';
import '../../../domain/usecases/fortress_footnote_use_case.dart';
import '../../../domain/usecases/fortress_use_case.dart';
import '../../state/fortress_chapters_state.dart';
import '../../state/fortress_footnotes_state.dart';
import '../../state/fortress_state.dart';

class MainFortressPage extends StatefulWidget {
  const MainFortressPage({super.key});

  @override
  State<MainFortressPage> createState() => _MainFortressPageState();
}

class _MainFortressPageState extends State<MainFortressPage> {
  final FortressDatabaseService _databaseService = FortressDatabaseService();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FortressChaptersState(
            FortressChapterUseCase(
              FortressChapterDataRepository(_databaseService),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => FortressFootnotesState(
            FortressFootnoteUseCase(
              FortressFootnoteDataRepository(_databaseService),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => FortressState(
            FortressUseCase(
              FortressDataRepository(_databaseService),
            ),
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Крепость мусульманина'),
        ),
        body: Container(),
      ),
    );
  }
}
