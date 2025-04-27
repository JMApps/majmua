import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/fortress_chapter_entity.dart';
import '../../../l10n/app_localizations.dart';
import '../../state/fortress_chapters_state.dart';
import '../../widgets/app_error_text.dart';
import '../../widgets/main_description_text.dart';
import '../items/fortress_chapter_item.dart';

class SearchFortressChaptersFuture extends StatefulWidget {
  const SearchFortressChaptersFuture({
    super.key,
    required this.query,
    required this.tableName,
  });

  final String query;
  final String tableName;

  @override
  State<SearchFortressChaptersFuture> createState() => _SearchFortressChaptersFutureState();
}

class _SearchFortressChaptersFutureState extends State<SearchFortressChaptersFuture> {
  late final Future<List<FortressChapterEntity>> _futureChapters;
  List<FortressChapterEntity> _chapters = [];
  List<FortressChapterEntity> _recentChapters = [];

  @override
  void initState() {
    super.initState();
    _futureChapters = Provider.of<FortressChaptersState>(context, listen: false).fetchAllChapters(tableName: widget.tableName);
  }

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return FutureBuilder<List<FortressChapterEntity>>(
      future: _futureChapters,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return AppErrorText(text: snapshot.error.toString());
        }
        if (snapshot.hasData && snapshot.data!.isEmpty) {
          return MainDescriptionText(
            text: appLocale.searchIsEmpty,
          );
        }
        if (snapshot.hasData) {
          _chapters = snapshot.data!;
          _recentChapters = widget.query.isEmpty ? _chapters : _chapters.where((element) =>
          element.chapterId.toString().contains(widget.query) ||
              element.chapterNumber.toLowerCase().contains(widget.query) ||
              element.chapterTitle.toLowerCase().contains(widget.query)).toList();
          return _recentChapters.isEmpty
              ? MainDescriptionText(text: appLocale.searchIsEmpty)
              : Scrollbar(
                  child: ListView.builder(
                    padding: AppStyles.mardingWithoutTopMini,
                    itemCount: _recentChapters.length,
                    itemBuilder: (BuildContext context, int index) {
                      return FortressChapterItem(
                        chapterModel: _recentChapters[index],
                        index: index,
                      );
                    },
                  ),
                );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
