import 'package:flutter/material.dart';

import '../../domain/entities/fortress_chapter_entity.dart';
import '../../domain/usecases/fortress_chapter_use_case.dart';

class FortressChaptersState extends ChangeNotifier {

  final FortressChapterUseCase _chapterUseCase;

  FortressChaptersState(this._chapterUseCase);

  Future<List<FortressChapterEntity>> fetchAllChapters({required String tableName}) {
    return _chapterUseCase.fetchAllChapters(languageCode: tableName);
  }

  Future<FortressChapterEntity> getChapterById({required String tableName, required int chapterId}) async {
    return await _chapterUseCase.fetchChapterById(languageCode: tableName, chapterId: chapterId);
  }

  Future<List<FortressChapterEntity>> getFavoriteChapters({required String tableName, required List<int> ids}) async {
    return await _chapterUseCase.fetchFavoriteChapters(languageCode: tableName, ids: ids);
  }
}