import 'package:majmua/domain/entities/chapter_fortress_entity.dart';
import 'package:majmua/domain/entities/footnote_fortress_entity.dart';
import 'package:majmua/domain/entities/supplication_fortress_entity.dart';
import 'package:majmua/domain/repository/fortress_repository.dart';

class FortressUseCase {
  FortressUseCase(this._fortressRepository);
  final FortressRepository _fortressRepository;

  Future<List<ChapterFortressEntity>> fetchAllChapters({required String tableName}) async {
    try {
      final List<ChapterFortressEntity> allChapters = await _fortressRepository.getAllChapters(tableName: tableName);
      return allChapters;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ChapterFortressEntity> fetchChapterById({required String tableName, required int chapterId}) async {
    try {
      final ChapterFortressEntity chapterById = await _fortressRepository.getChapterById(tableName: tableName, chapterId: chapterId);
      return chapterById;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<SupplicationFortressEntity>> fetchAllSupplications({required String tableName}) async {
    try {
      final List<SupplicationFortressEntity> allSupplications = await _fortressRepository.getAllSupplications(tableName: tableName);
      return allSupplications;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<SupplicationFortressEntity> fetchSupplicationByChapterId({required String tableName, required int chapterId}) async {
    try {
      final SupplicationFortressEntity supplicationByChapterId = await _fortressRepository.getSupplicationByChapterId(tableName: tableName, chapterId: chapterId);
      return supplicationByChapterId;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<FootnoteFortressEntity> fetchFootnoteById({required String tableName, required int footnoteId}) async {
    try {
      final FootnoteFortressEntity footnoteById = await _fortressRepository.getFootnoteById(tableName: tableName, footnoteId: footnoteId);
      return footnoteById;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}