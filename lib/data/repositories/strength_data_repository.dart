import 'package:sqflite/sqflite.dart';

import '../../core/strings/db_value_strings.dart';
import '../../domain/entities/strength_entity.dart';
import '../../domain/entities/strength_footnote_entity.dart';
import '../../domain/repositories/strength_repository.dart';
import '../models/strength_footnote_model.dart';
import '../models/strength_model.dart';
import '../services/databases/strength_database_service.dart';

class StrengthDataRepository implements StrengthRepository {
  final StrengthDatabaseService _strengthDatabaseService;

  const StrengthDataRepository(this._strengthDatabaseService);

  @override
  Future<List<StrengthEntity>> getAllStrengths() async {
    final Database database = await _strengthDatabaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValueStrings.dbStrengthTableName);
    final List<StrengthEntity> allStrengths = resources.isNotEmpty ? resources.map((e) => StrengthEntity.fromModel(StrengthModel.fromMap(e))).toList() : [];
    return allStrengths;
  }

  @override
  Future<StrengthEntity> getStrengthById({required int strengthId}) async {
    final Database database = await _strengthDatabaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValueStrings.dbStrengthTableName, where: '${DBValueStrings.id} = ?', whereArgs: [strengthId]);
    final StrengthEntity? strengthById = resources.isNotEmpty ? StrengthEntity.fromModel(StrengthModel.fromMap(resources.first)) : null;
    return strengthById!;
  }

  @override
  Future<StrengthFootnoteEntity> getFootnoteById({required int footnoteId}) async {
    final Database database = await _strengthDatabaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValueStrings.dbStrengthFootnoteTableName, where: '${DBValueStrings.id} = ?', whereArgs: [footnoteId]);
    final StrengthFootnoteEntity? footnoteById = resources.isNotEmpty ? StrengthFootnoteEntity.fromModel(StrengthFootnoteModel.fromMap(resources.first)) : null;
    return footnoteById!;
  }
}
