import 'package:sqflite/sqflite.dart';

import '../../core/strings/db_value_strings.dart';
import '../../domain/entities/gem_entity.dart';
import '../../domain/repositories/gems_repository.dart';
import '../models/gem_model.dart';
import '../services/databases/gems_database_service.dart';

class GemsDataRepository implements GemsRepository {
  final GemsDatabaseService _databaseService;

  const GemsDataRepository(this._databaseService);

  @override
  Future<List<GemEntity>> getAllGems() async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValueStrings.dbGemsTableName);
    final List<GemEntity> allGems = resources.isNotEmpty ? resources.map((e) => GemEntity.fromModel(GemModel.fromMap(e))).toList() : [];
    return allGems;
  }
}
