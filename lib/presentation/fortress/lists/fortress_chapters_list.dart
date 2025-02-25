import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/fortress_chapter_entity.dart';
import '../../state/fortress_chapters_state.dart';
import '../../widgets/app_error_text.dart';
import '../items/fortress_chapter_item.dart';

class FortressChaptersList extends StatelessWidget {
  const FortressChaptersList({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Consumer<FortressChaptersState>(
      builder: (context, chapters, _) {
        return Expanded(
          child: FutureBuilder(
            future: chapters.fetchAllChapters(tableName: appLocale.fortressChapterTableName),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return AppErrorText(text: snapshot.error.toString());
              }
              if (snapshot.hasData) {
                return Scrollbar(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final FortressChapterEntity chapterModel = snapshot.data![index];
                      return FortressChapterItem(
                        chapterModel: chapterModel,
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
          ),
        );
      },
    );
  }
}
