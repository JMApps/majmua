import 'package:majmua/core/strings/db_value_strings.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/entities/fortress_footnote_entity.dart';
import '../../domain/repositories/fortress_footnote_repository.dart';
import '../models/fortress_footnote_model.dart';
import '../services/databases/fortress_database_service.dart';

class FortressFootnoteDataRepository implements FortressFootnoteRepository {
  final FortressDatabaseService _databaseService;

  FortressFootnoteDataRepository(this._databaseService);

  @override
  Future<List<FortressFootnoteEntity>> getAllFootnotes({required String tableName}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(tableName);
    final List<FortressFootnoteEntity> allFootnotes = resources.isNotEmpty ? resources.map((e) => FortressFootnoteEntity.fromModel(FortressFootnoteModel.fromMap(e))).toList() : [];
    return allFootnotes;
  }

  @override
  Future<FortressFootnoteEntity> getFootnoteById({required String tableName, required int footnoteId}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(tableName, where: '${DBValueStrings.dbFortressFootnoteId} = ?', whereArgs: [footnoteId]);
    final FortressFootnoteEntity? footnoteById = resources.isNotEmpty ? FortressFootnoteEntity.fromModel(FortressFootnoteModel.fromMap(resources.first)) : null;
    return footnoteById!;
  }

  @override
  Future<String> getFootnoteBySupplication({required String tableName, required int supplicationId}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(tableName, where: '${DBValueStrings.dbFortressSampleBy} = ?', whereArgs: [supplicationId]);
    final List<FortressFootnoteEntity> footnotesBySupplication = resources.isNotEmpty ? resources.map((e) => FortressFootnoteEntity.fromModel(FortressFootnoteModel.fromMap(e))).toList() : [];
    final String serializedFootnotes = footnotesBySupplication.asMap().entries.map((entry) => '[${entry.value.footnoteId}] - ${entry.value.footnote}').join('\n\n');
    return serializedFootnotes;
  }
}
