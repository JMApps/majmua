import 'package:sqflite/sqflite.dart';

import '../../core/strings/db_value_strings.dart';
import '../../domain/entities/names_of_ayah_entity.dart';
import '../../domain/entities/names_of_content_entity.dart';
import '../../domain/entities/names_of_entity.dart';
import '../../domain/repositories/names_of_repository.dart';
import '../models/names_of_ayah_model.dart';
import '../models/names_of_content_model.dart';
import '../models/names_of_model.dart';
import '../services/databases/names_of_database_service.dart';

class NamesOfDataRepository implements NamesOfRepository {
  final NamesOfDatabaseService _namesOfDatabaseService;

  const NamesOfDataRepository(this._namesOfDatabaseService);

  @override
  Future<List<NamesOfEntity>> getAllNames() async {
    final Database database = await _namesOfDatabaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValueStrings.dbNamesOfTableNames);
    final List<NamesOfEntity> allNames = resources.isNotEmpty ? resources.map((c) => NamesOfEntity.fromModel(NamesOfModel.fromMap(c))).toList() : [];
    return allNames;
  }

  @override
  Future<List<NamesOfEntity>> getNameByChapterId({required int chapterId}) async {
    final Database database = await _namesOfDatabaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValueStrings.dbNamesOfTableNames, where: '${DBValueStrings.dbSortedBy} = ?', whereArgs: [chapterId]);
    final List<NamesOfEntity> namesByChapterId = resources.isNotEmpty ? resources.map((c) => NamesOfEntity.fromModel(NamesOfModel.fromMap(c))).toList() : [];
    return namesByChapterId;
  }

  @override
  Future<List<NamesOfAyahEntity>> getAyahByChapterId({required int chapterId}) async {
    final Database database = await _namesOfDatabaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValueStrings.dbNamesOfTableAyahs, where: '${DBValueStrings.dbSortedBy} = ?', whereArgs: [chapterId]);
    final List<NamesOfAyahEntity> ayahByChapterId = resources.isNotEmpty ? resources.map((c) => NamesOfAyahEntity.fromModel(NamesOfAyahModel.fromMap(c))).toList() : [];
    return ayahByChapterId;
  }

  @override
  Future<NamesOfContentEntity> getContentById({required int contentId}) async {
    final Database database = await _namesOfDatabaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValueStrings.dbNamesOfTableOfContents, where: '${DBValueStrings.id} = ?', whereArgs: [contentId]);
    final NamesOfContentEntity? contentById = resources.isNotEmpty ? NamesOfContentEntity.fromModel(NamesOfContentModel.fromMap(resources.first)) : null;
    return contentById!;
  }

  @override
  Future<List<NamesOfContentEntity>> getAllContents() async {
    final Database database = await _namesOfDatabaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValueStrings.dbNamesOfTableOfContents);
    final List<NamesOfContentEntity> allContents = resources.isNotEmpty ? resources.map((c) => NamesOfContentEntity.fromModel(NamesOfContentModel.fromMap(c))).toList() : [];
    return allContents;
  }
}