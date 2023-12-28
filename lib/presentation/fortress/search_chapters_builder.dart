import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/styles/app_styles.dart';
import '../../data/repositories/fortress_data_repository.dart';
import '../../domain/entities/chapter_fortress_entity.dart';
import '../../domain/usecases/fortress_use_case.dart';
import '../widgets/info_data_text.dart';
import 'chapter_item.dart';

class SearchChaptersBuilder extends StatefulWidget {
  const SearchChaptersBuilder({super.key, required this.query});

  final String query;

  @override
  State<SearchChaptersBuilder> createState() => _SearchChaptersBuilderState();
}

class _SearchChaptersBuilderState extends State<SearchChaptersBuilder> {
  List<ChapterFortressEntity> _chapters = [];
  List<ChapterFortressEntity> _recentChapters = [];
  final FortressUseCase _fortressUseCase = FortressUseCase(FortressDataRepository());

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return FutureBuilder<List<ChapterFortressEntity>>(
      future: _fortressUseCase.fetchAllChapters(tableName: appLocale!.tableOfChapter),
      builder: (BuildContext context, AsyncSnapshot<List<ChapterFortressEntity>> snapshot) {
        if (snapshot.hasData) {
          _chapters = snapshot.data!;
          _recentChapters = widget.query.isEmpty
              ? _chapters
              : _chapters.where((element) => element.chapterNumber.toLowerCase().contains(widget.query.toLowerCase()) ||
                      element.chapterTitle.toLowerCase().contains(widget.query.toLowerCase())).toList();
          if (_recentChapters.isEmpty && widget.query.isNotEmpty) {
            return InfoDataText(infoText: appLocale.queryIsEmpty);
          } else {
            return CupertinoScrollbar(
              child: ListView.builder(
                padding: AppStyles.mainMardingMini,
                itemCount: _recentChapters.length,
                itemBuilder: (BuildContext context, int index) {
                  final ChapterFortressEntity model = _recentChapters[index];
                  return ChapterItem(
                    model: model,
                    index: index,
                  );
                },
              ),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
