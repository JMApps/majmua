import 'package:majmua/data/models/chapter_fortress_model.dart';
import 'package:majmua/data/models/footnote_fortress_model.dart';
import 'package:majmua/data/models/supplication_fortress_model.dart';
import 'package:majmua/data/services/local/fortress_database_service.dart';
import 'package:majmua/domain/entities/chapter_fortress_entity.dart';
import 'package:majmua/domain/entities/footnote_fortress_entity.dart';
import 'package:majmua/domain/entities/supplication_fortress_entity.dart';
import 'package:majmua/domain/repository/fortress_repository.dart';
import 'package:sqflite/sqflite.dart';

class FortressDataRepository implements FortressRepository {
  final FortressDatabaseService _fortressDatabaseService = FortressDatabaseService();

  @override
  Future<List<ChapterFortressEntity>> getAllChapters({required String tableName}) async {
    final Database database = await _fortressDatabaseService.db;
    final List<Map<String, Object?>> resources = await database.query(tableName);
    final List<ChapterFortressEntity> allChapters = resources.isNotEmpty ? resources.map((c) => _chapterToEntity(ChapterFortressModel.fromMap(c))).toList() : [];
    return allChapters;
  }

  @override
  Future<ChapterFortressEntity> getChapterById({required String tableName, required int chapterId}) async {
    final Database database = await _fortressDatabaseService.db;
    final List<Map<String, Object?>> resources = await database.query(tableName,where: 'id = $chapterId', whereArgs: [chapterId]);
    final ChapterFortressEntity? chapterById = resources.isNotEmpty ? _chapterToEntity(ChapterFortressModel.fromMap(resources.first)) : null;
    return chapterById!;
  }

  @override
  Future<List<SupplicationFortressEntity>> getAllSupplications({required String tableName}) async {
    final Database database = await _fortressDatabaseService.db;
    final List<Map<String, Object?>> resources = await database.query(tableName);
    final List<SupplicationFortressEntity> allSupplications = resources.isNotEmpty ? resources.map((c) => _supplicationToEntity(SupplicationFortressModel.fromMap(c))).toList() : [];
    return allSupplications;
  }

  @override
  Future<List<SupplicationFortressEntity>> getSupplicationByChapterId({required String tableName, required int chapterId}) async {
    final Database database = await _fortressDatabaseService.db;
    final List<Map<String, Object?>> resources = await database.query(tableName, where: 'sample_by = $chapterId', whereArgs: [chapterId]);
    final List<SupplicationFortressEntity> supplicationsByChapterId = resources.isNotEmpty ? resources.map((c) => _supplicationToEntity(SupplicationFortressModel.fromMap(c))).toList() : [];
    return supplicationsByChapterId;
  }

  @override
  Future<FootnoteFortressEntity> getFootnoteById({required String tableName, required int footnoteId}) async {
    final Database database = await _fortressDatabaseService.db;
    final List<Map<String, Object?>> resources = await database.query(tableName, where: 'id = $footnoteId', whereArgs: [footnoteId]);
    final FootnoteFortressEntity? footnoteById = resources.isNotEmpty ? _footnoteToEntity(FootnoteFortressModel.fromMap(resources.first)) : null;
    return footnoteById!;
  }

  // Mapping to entity
  ChapterFortressEntity _chapterToEntity(ChapterFortressModel model) {
    return ChapterFortressEntity(
      id: model.id,
      chapterNumber: model.chapterNumber,
      chapterTitle: model.chapterTitle,
    );
  }

  // Mapping to entity
  SupplicationFortressEntity _supplicationToEntity(SupplicationFortressModel model) {
    return SupplicationFortressEntity(
      id: model.id,
      arabicText: model.arabicText,
      transcriptionText: model.transcriptionText,
      translationText: model.translationText,
      contentForShare: model.contentForShare,
      countNumber: model.countNumber,
    );
  }

  // Mapping to entity
  FootnoteFortressEntity _footnoteToEntity(FootnoteFortressModel model) {
    return FootnoteFortressEntity(
      id: model.id,
      footnote: model.footnote,
    );
  }
}
