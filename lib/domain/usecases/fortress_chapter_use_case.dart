import '../entities/fortress_chapter_entity.dart';
import '../repositories/fortress_chapter_repository.dart';

class FortressChapterUseCase {

  final FortressChapterRepository _chapterRepository;

  const FortressChapterUseCase(this._chapterRepository);

  Future<List<FortressChapterEntity>> fetchAllChapters({required String languageCode}) async {
    try {
      return await _chapterRepository.getAllChapters(tableName: languageCode);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<FortressChapterEntity> fetchChapterById({required String languageCode, required int chapterId}) async {
    try {
      return await _chapterRepository.getChapterById(tableName: languageCode, chapterId: chapterId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<FortressChapterEntity>> fetchFavoriteChapters({required String languageCode, required List<int> ids}) async {
    try {
      return await _chapterRepository.getFavoriteChapters(tableName: languageCode, ids: ids);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}