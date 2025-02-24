import '../entities/fortress_chapter_entity.dart';

abstract class FortressChapterRepository {
  Future<List<FortressChapterEntity>> getAllChapters({required String tableName});

  Future<FortressChapterEntity> getChapterById({required String tableName, required int chapterId});

  Future<List<FortressChapterEntity>> getFavoriteChapters({required String tableName, required List<int> ids});
}