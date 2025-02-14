import 'package:sqflite/sqflite.dart';

import '../../domain/entities/supplication_entity.dart';
import '../../domain/repositories/supplication_repository.dart';
import '../models/supplication_model.dart';
import '../services/databases/database_sfq_service.dart';

class SupplicationDataRepository implements SupplicationRepository {
  final DatabaseSFQService _databaseService;

  SupplicationDataRepository(this._databaseService);

  @override
  Future<List<SupplicationEntity>> getAllSupplications({required String tableName}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(tableName);
    final List<SupplicationEntity> allSupplications = resources.isNotEmpty ? resources.map((e) => SupplicationEntity.fromModel(SupplicationModel.fromMap(e))).toList() : [];
    return allSupplications;
  }
}