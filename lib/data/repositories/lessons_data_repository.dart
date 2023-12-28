import 'package:majmua/data/models/city_model.dart';
import 'package:majmua/data/models/lesson_model.dart';
import 'package:majmua/data/services/lessons_database_service.dart';
import 'package:majmua/data/services/local/cities_database_service.dart';
import 'package:majmua/domain/entities/city_entity.dart';
import 'package:majmua/domain/entities/lesson_entity.dart';
import 'package:majmua/domain/repository/cities_repository.dart';
import 'package:majmua/domain/repository/lessons_repository.dart';
import 'package:sqflite/sqflite.dart';

class LessonsDataRepository implements LessonsRepository {
  final LessonsDatabaseService _databaseService = LessonsDatabaseService();

  @override
  Future<List<LessonEntity>> getAllLessons() async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query('Table_of_lessons_ramadan');
    final List<LessonEntity> allCities = resources.isNotEmpty ? resources.map((c) => _mapToEntity(LessonModel.fromMap(c))).toList() : [];
    return allCities;
  }

  // Mapping to entity
  LessonEntity _mapToEntity(LessonModel model) {
    return LessonEntity(
      id: model.id,
      numberChapter: model.numberChapter,
      titleChapter: model.titleChapter,
      contentChapter: model.contentChapter,
    );
  }
}
