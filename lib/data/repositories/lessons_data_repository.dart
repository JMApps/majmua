import 'package:sqflite/sqflite.dart';

import '../../core/strings/db_value_strings.dart';
import '../../domain/entities/lessons_entity.dart';
import '../../domain/repositories/lessons_repository.dart';
import '../models/lessons_model.dart';
import '../services/databases/lessons_database_service.dart';

class LessonsDataRepository implements LessonsRepository {
  final LessonsDatabaseService _lessonsDatabaseService;

  const LessonsDataRepository(this._lessonsDatabaseService);

  @override
  Future<List<LessonsEntity>> getAllLessons() async {
    final Database database = await _lessonsDatabaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValueStrings.dbLessonsTableName);
    final List<LessonsEntity> allLessons = resources.isNotEmpty ? resources.map((e) => LessonsEntity.fromModel(LessonsModel.fromMap(e))).toList() : [];
    return allLessons;
  }

  @override
  Future<LessonsEntity> getLessonById({required int lessonId}) async {
    final Database database = await _lessonsDatabaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValueStrings.dbLessonsTableName, where: '${DBValueStrings.id} = ?', whereArgs: [lessonId]);
    final LessonsEntity? lessonsById = resources.isNotEmpty ? LessonsEntity.fromModel(LessonsModel.fromMap(resources.first)) : null;
    return lessonsById!;
  }
}
