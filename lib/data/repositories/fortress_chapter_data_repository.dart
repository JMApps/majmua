import 'package:sqflite/sqflite.dart';

import '../../core/strings/db_value_strings.dart';
import '../../domain/entities/fortress_chapter_entity.dart';
import '../../domain/repositories/fortress_chapter_repository.dart';
import '../models/fortress_chapter_model.dart';
import '../services/databases/fortress_database_service.dart';

class FortressChapterDataRepository implements FortressChapterRepository {
  final FortressDatabaseService _databaseService;

  const FortressChapterDataRepository(this._databaseService);

  @override
  Future<List<FortressChapterEntity>> getAllChapters({required String tableName}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(tableName);
    return resources.isNotEmpty ? resources.map((e) => FortressChapterEntity.fromModel(FortressChapterModel.fromMap(e))).toList() : [];
  }

  @override
  Future<FortressChapterEntity> getChapterById({required String tableName, required int chapterId}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(tableName, where: '${DBValueStrings.dbFortressChapterId} = ?', whereArgs: [chapterId]);
    final FortressChapterEntity? chapterById = resources.isNotEmpty ? FortressChapterEntity.fromModel(FortressChapterModel.fromMap(resources.first)) : null;
    return chapterById!;
  }

  @override
  Future<List<FortressChapterEntity>> getFavoriteChapters({required String tableName, required List<int> ids}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(tableName, where: '${DBValueStrings.dbFortressChapterId} IN (${ids.map((id) => '?').join(', ')})', whereArgs: ids);
    final List<FortressChapterEntity> favoriteChapters = resources.isNotEmpty ? resources.map((e) => FortressChapterEntity.fromModel(FortressChapterModel.fromMap(e))).toList() : [];
    return favoriteChapters;
  }
}
