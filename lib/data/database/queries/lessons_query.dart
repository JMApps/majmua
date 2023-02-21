
import 'package:majmua/data/database/models/lesson_model.dart';
import 'package:majmua/data/database/services/lessons_database_helper.dart';

class LessonsQuery {
  final LessonsDatabaseHelper _lessonsDatabaseHelper = LessonsDatabaseHelper();

  Future<List<LessonModel>> getAllLessons() async {
    var dbClient = await _lessonsDatabaseHelper.db;
    var res = await dbClient.query('Table_of_lessons_ramadan');
    List<LessonModel>? allLessons = res.isNotEmpty ? res.map((c) => LessonModel.fromMap(c)).toList() : null;
    return allLessons!;
  }

  Future<List<LessonModel>> getOneLesson(int lessonId) async {
    var dbClient = await _lessonsDatabaseHelper.db;
    var res = await dbClient.query('Table_of_lessons_ramadan', where: 'id == $lessonId');
    List<LessonModel>? oneLesson = res.isNotEmpty ? res.map((c) => LessonModel.fromMap(c)).toList() : null;
    return oneLesson!;
  }
}
