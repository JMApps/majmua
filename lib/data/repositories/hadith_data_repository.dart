import 'package:sqflite/sqflite.dart';

import '../../core/strings/db_value_strings.dart';
import '../../domain/entities/hadith_entity.dart';
import '../../domain/repositories/hadiths_repository.dart';
import '../models/hadith_model.dart';
import '../services/databases/hadith_database_service.dart';

class HadithDataRepository implements HadithsRepository {
  final HadithDatabaseService _hadithDatabaseService;

  const HadithDataRepository(this._hadithDatabaseService);

  @override
  Future<List<HadithEntity>> getAllHadiths() async {
    final Database database = await _hadithDatabaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValueStrings.dbHadithTableName);
    final List<HadithEntity> allHadiths = resources.isNotEmpty ? resources.map((e) => HadithEntity.fromModel(HadithModel.fromMap(e))).toList() : [];
    return allHadiths;
  }

  @override
  Future<HadithEntity> getHadithById({required int hadithId}) async {
    final Database database = await _hadithDatabaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValueStrings.dbHadithTableName, where: '${DBValueStrings.id} = ?', whereArgs: [hadithId]);
    final HadithEntity? hadithById = resources.isNotEmpty ? HadithEntity.fromModel(HadithModel.fromMap(resources.first)) : null;
    return hadithById!;
  }
}
