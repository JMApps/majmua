import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/fortress_chapter_entity.dart';
import '../../state/fortress_chapters_state.dart';
import '../../widgets/app_error_text.dart';
import '../items/fortress_chapter_item.dart';

class FortressChaptersList extends StatefulWidget {
  const FortressChaptersList({
    super.key,
    required this.tableName,
  });

  final String tableName;

  @override
  State<FortressChaptersList> createState() => _FortressChaptersListState();
}

class _FortressChaptersListState extends State<FortressChaptersList> {
  late final Future<List<FortressChapterEntity>> _futureChapters;

  @override
  void initState() {
    super.initState();
    _futureChapters = Provider.of<FortressChaptersState>(context, listen: false).fetchAllChapters(tableName: widget.tableName);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: _futureChapters,
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
  }
}
