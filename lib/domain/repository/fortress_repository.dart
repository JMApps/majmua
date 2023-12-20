import 'package:majmua/domain/entities/chapter_fortress_entity.dart';
import 'package:majmua/domain/entities/footnote_fortress_entity.dart';
import 'package:majmua/domain/entities/supplication_fortress_entity.dart';

abstract class FortressRepository {
  Future<List<ChapterFortressEntity>> getAllChapters({required String tableName});

  Future<ChapterFortressEntity> getChapterById({required String tableName, required int chapterId});

  Future<List<SupplicationFortressEntity>> getAllSupplications({required String tableName});

  Future<SupplicationFortressEntity> getSupplicationByChapterId({required String tableName, required int chapterId});

  Future<FootnoteFortressEntity> getFootnoteById({required String tableName, required int footnoteId});
}