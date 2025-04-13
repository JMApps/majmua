import 'package:sqflite/sqflite.dart';

import '../../core/strings/db_value_strings.dart';
import '../../domain/entities/fortress_entity.dart';
import '../../domain/repositories/fortress_repository.dart';
import '../models/fortress_model.dart';
import '../services/databases/fortress_database_service.dart';

class FortressDataRepository implements FortressRepository {
  final FortressDatabaseService _databaseService;

  const FortressDataRepository(this._databaseService);

  @override
  Future<List<FortressEntity>> getAllSupplications({required String tableName}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(tableName);
    final List<FortressEntity> allSupplications = resources.isNotEmpty ? resources.map((e) => FortressEntity.fromModel(FortressModel.fromMap(e))).toList() : [];
    return allSupplications;
  }

  @override
  Future<List<FortressEntity>> getSupplicationsByChapterId({required String tableName, required int chapterId}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(tableName, where: '${DBValueStrings.dbFortressSampleBy} = ?', whereArgs: [chapterId]);
    final List<FortressEntity> byChapterSupplications = resources.isNotEmpty ? resources.map((e) => FortressEntity.fromModel(FortressModel.fromMap(e))).toList() : [];
    return byChapterSupplications;
  }

  @override
  Future<FortressEntity> getSupplicationById({required String tableName, required int supplicationId}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(tableName, where: '${DBValueStrings.dbFortressSupplicationId} = ?', whereArgs: [supplicationId]);
    final FortressEntity? supplicationById = resources.isNotEmpty ? FortressEntity.fromModel(FortressModel.fromMap(resources.first)) : null;
    return supplicationById!;
  }

  @override
  Future<List<FortressEntity>> getFavoriteSupplications({required String tableName, required List<int> ids}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(tableName, where: '${DBValueStrings.dbFortressSupplicationId} IN (${ids.map((id) => '?').join(', ')})', whereArgs: ids);
    final List<FortressEntity> favoriteSupplications = resources.isNotEmpty ? resources.map((e) => FortressEntity.fromModel(FortressModel.fromMap(e))).toList() : [];
    return favoriteSupplications;
  }
}
