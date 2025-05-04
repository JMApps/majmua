import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../data/repositories/fortress_chapter_data_repository.dart';
import '../../../data/repositories/fortress_footnote_data_repository.dart';
import '../../../data/services/databases/fortress_database_service.dart';
import '../../../domain/usecases/fortress_chapter_use_case.dart';
import '../../../domain/usecases/fortress_footnote_use_case.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/fortress_chapters_state.dart';
import '../../state/fortress_footnotes_state.dart';
import '../items/fortress_daily_item.dart';
import '../lists/fortress_chapters_list.dart';
import '../widgets/search_fortress_chapters_delegate.dart';

class MainFortressPage extends StatefulWidget {
  const MainFortressPage({super.key});

  @override
  State<MainFortressPage> createState() => _MainFortressPageState();
}

class _MainFortressPageState extends State<MainFortressPage> {
  final FortressDatabaseService _databaseService = FortressDatabaseService();

  @override
  void dispose() {
    super.dispose();
    _databaseService.closeDatabase();
  }

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
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
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(appLocale.fortressMuslim),
          actions: [
            Consumer2<FortressChaptersState, FortressFootnotesState>(
              builder: (context, chaptersState, footnotesState, _) {
                return IconButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: SearchFortressChaptersDelegate(
                        search: appLocale.search,
                        tableName: appLocale.fortressChapterTableName,
                        chaptersState: chaptersState,
                        footnotesState: footnotesState,
                      ),
                    );
                  },
                  icon: const Icon(CupertinoIcons.search),
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: AppStyles.mainMardingMini,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: FortressDailyItem(
                      iconName: AppStringConstraints.iconMorning,
                      title: appLocale.morning,
                      chapterId: 27,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: FortressDailyItem(
                      iconName: AppStringConstraints.iconEvening,
                      title: appLocale.evening,
                      chapterId: 28,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: FortressDailyItem(
                      iconName: AppStringConstraints.iconNight,
                      title: appLocale.night,
                      chapterId: 29,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: FortressDailyItem(
                      iconName: AppStringConstraints.iconKaaba,
                      title: appLocale.afterPrayer,
                      chapterId: 25,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              FortressDailyItem(
                iconName: AppStringConstraints.iconIstikhara,
                title: appLocale.istikhara,
                chapterId: 26,
              ),
              const Divider(),
              Consumer<FortressChaptersState>(
                builder: (context, chapterState, _) {
                  return ChangeNotifierProvider.value(
                    value: chapterState,
                    child: FortressChaptersList(
                      tableName: appLocale.fortressChapterTableName,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
