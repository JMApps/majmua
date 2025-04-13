import 'package:sqflite/sqflite.dart';

import '../../domain/entities/sfq_entity.dart';
import '../../domain/repositories/sfq_repository.dart';
import '../models/sfq_model.dart';
import '../services/databases/sfq_database_service.dart';

class SFQDataRepository implements SFQRepository {
  final SFQDatabaseService _databaseService;

  const SFQDataRepository(this._databaseService);

  @override
  Future<List<SFQEntity>> getAllSupplications({required String tableName}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(tableName);
    final List<SFQEntity> allSupplications = resources.isNotEmpty ? resources.map((e) => SFQEntity.fromModel(SFQModel.fromMap(e))).toList() : [];
    return allSupplications;
  }
}