import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/presentation/fortress/widgets/fortress_settings.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../../data/repositories/fortress_chapter_data_repository.dart';
import '../../../data/repositories/fortress_data_repository.dart';
import '../../../data/repositories/fortress_footnote_data_repository.dart';
import '../../../data/services/databases/fortress_database_service.dart';
import '../../../domain/entities/fortress_chapter_entity.dart';
import '../../../domain/usecases/fortress_chapter_use_case.dart';
import '../../../domain/usecases/fortress_footnote_use_case.dart';
import '../../../domain/usecases/fortress_use_case.dart';
import '../../state/fortress_chapters_state.dart';
import '../../state/fortress_footnotes_state.dart';
import '../../state/fortress_state.dart';
import '../../widgets/app_error_text.dart';
import '../lists/fortress_content_list.dart';
import '../widgets/fortress_html_data.dart';

class FortressContentPage extends StatefulWidget {
  const FortressContentPage({
    super.key,
    required this.chapterId,
  });

  final int chapterId;

  @override
  State<FortressContentPage> createState() => _FortressContentPageState();
}

class _FortressContentPageState extends State<FortressContentPage> {
  final FortressDatabaseService _databaseService = FortressDatabaseService();

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
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
          create: (context) => FortressState(
            FortressUseCase(
              FortressDataRepository(_databaseService),
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
          title: Text('${appLocale.chapter} ${widget.chapterId}'),
          actions: [
            Consumer<FortressState>(
              builder: (context, fortressState, _) {
                return IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => ChangeNotifierProvider.value(
                        value: fortressState,
                        child: const FortressSettings(),
                      ),
                    );
                  },
                  tooltip: appLocale.settings,
                  icon: const Icon(Icons.settings),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: AppStyles.mainMardingMini,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Consumer<FortressChaptersState>(
                builder: (context, chapterState, _) {
                  return FutureBuilder<FortressChapterEntity>(
                    future: chapterState.getChapterById(
                      tableName: appLocale.fortressChapterTableName,
                      chapterId: widget.chapterId,
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return AppErrorText(text: snapshot.error.toString());
                      }
                      if (snapshot.hasData) {
                        final FortressChapterEntity chapterModel =
                            snapshot.data!;
                        return Card(
                          margin: EdgeInsets.zero,
                          color: appColors.secondaryContainer,
                          child: Padding(
                            padding: AppStyles.mainMardingMini,
                            child: FortressHtmlData(
                              htmlData: chapterModel.chapterTitle,
                              footnoteColor: appColors.primary,
                              font: AppStringConstraints.fontGilroy,
                              fontSize: 16.0,
                              textAlign: TextAlign.center,
                              fontColor: appColors.onSurface,
                            ),
                          ),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 8),
              Consumer<FortressState>(
                builder: (context, fortressState, _) {
                  return FortressContentList(
                    chapterId: widget.chapterId,
                    fortressState: fortressState,
                    tableName: appLocale.fortressTableName,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
