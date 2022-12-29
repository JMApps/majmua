import 'package:majmua/data/database/local/model/lesson_model.dart';
import 'package:majmua/data/database/local/service/lessons_database_helper.dart';

class LessonsQuery {
  final LessonsDatabaseHelper _lessonsDatabaseHelper = LessonsDatabaseHelper();

  Future<List<LessonModel>> getAllHadeeth() async {
    var dbClient = await _lessonsDatabaseHelper.db;
    var res = await dbClient.query('Table_of_lessons_ramadan');
    List<LessonModel>? allLessons = res.isNotEmpty ? res.map((c) => LessonModel.fromMap(c)).toList() : null;
    return allLessons!;
  }

  Future<List<LessonModel>> getOneHadeeth(int lessonId) async {
    var dbClient = await _lessonsDatabaseHelper.db;
    var res = await dbClient.query('Table_of_lessons_ramadan', where: 'id == $lessonId');
    List<LessonModel>? oneLesson = res.isNotEmpty ? res.map((c) => LessonModel.fromMap(c)).toList() : null;
    return oneLesson!;
  }
}
