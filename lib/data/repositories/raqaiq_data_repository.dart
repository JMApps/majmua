import 'package:sqflite/sqflite.dart';

import '../../core/strings/db_value_strings.dart';
import '../../domain/entities/raqaiq_entity.dart';
import '../../domain/repositories/raqaiq_repository.dart';
import '../models/raqaiq_model.dart';
import '../services/databases/raqaiq_database_service.dart';

class RaqaiqDataRepository implements RaqaiqRepository {
  final RaqaiqDatabaseService _raqaiqDatabaseService;

  const RaqaiqDataRepository(this._raqaiqDatabaseService);

  @override
  Future<List<RaqaiqEntity>> getAllRaqaiqs() async {
    final Database database = await _raqaiqDatabaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValueStrings.dbRaqaiqTableName);
    final List<RaqaiqEntity> allRaqaiqs = resources.isNotEmpty ? resources.map((e) => RaqaiqEntity.fromModel(RaqaiqModel.fromMap(e))).toList() : [];
    return allRaqaiqs;
  }

  @override
  Future<RaqaiqEntity> getRaqaiqById({required int raqaiqId}) async {
    final Database database = await _raqaiqDatabaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValueStrings.dbRaqaiqTableName, where: '${DBValueStrings.id} = ?', whereArgs: [raqaiqId]);
    final RaqaiqEntity? raqaiqById = resources.isNotEmpty ? RaqaiqEntity.fromModel(RaqaiqModel.fromMap(resources.first)) : null;
    return raqaiqById!;
  }
}
