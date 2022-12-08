import 'package:majmua/data/database/model/model_friday_item.dart';
import 'package:majmua/data/database/model/model_hadeeth_item.dart';
import 'package:majmua/data/database/model/model_lesson_ramadan_item.dart';
import 'package:majmua/data/database/model/model_name_item.dart';
import 'package:majmua/data/database/model/model_question_item.dart';
import 'package:majmua/data/database/model/model_supplication_item.dart';
import 'package:majmua/data/database/service/database_service.dart';

class DatabaseQuery {
  DatabaseService con = DatabaseService();

  Future<List<ModelFridayItem>> getFridaySunnah() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_friday');
    List<ModelFridayItem>? fridaySunnah = res.isNotEmpty ? res.map((c) => ModelFridayItem.fromMap(c)).toList() : null;
    return fridaySunnah!;
  }

  Future<List<ModelNameItem>> getNames() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_names');
    List<ModelNameItem>? names = res.isNotEmpty ? res.map((c) => ModelNameItem.fromMap(c)).toList() : null;
    return names!;
  }

  Future<List<ModelQuestionItem>> getQuestions() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_questions');
    List<ModelQuestionItem>? questions = res.isNotEmpty ? res.map((c) => ModelQuestionItem.fromMap(c)).toList() : null;
    return questions!;
  }

  Future<List<ModelQuestionItem>> getOneQuestion(int questionId) async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_questions', where: 'id == $questionId');
    List<ModelQuestionItem>? questions = res.isNotEmpty ? res.map((c) => ModelQuestionItem.fromMap(c)).toList() : null;
    return questions!;
  }

  Future<List<ModelHadeethItem>> getHadeeths() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_hadeeths');
    List<ModelHadeethItem>? hadeeths = res.isNotEmpty ? res.map((c) => ModelHadeethItem.fromMap(c)).toList() : null;
    return hadeeths!;
  }

  Future<List<ModelLessonRamadanItem>> getLessonsRamadan() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_lessons_ramadan');
    List<ModelLessonRamadanItem>? lessonsRamadan = res.isNotEmpty ? res.map((c) => ModelLessonRamadanItem.fromMap(c)).toList() : null;
    return lessonsRamadan!;
  }

  Future<List<ModelSupplicationItem>> getDayNightSupplications(bool isDayNight) async {
    var dbClient = await con.db;
    var res = await dbClient.rawQuery('SELECT * FROM Table_of_supplications WHERE ${isDayNight ? 'is_day_night == 0 OR is_day_night == 1' : 'is_day_night == 0 OR is_day_night == 2'}');
    List<ModelSupplicationItem>? supplicationsDayNight = res.isNotEmpty ? res.map((c) => ModelSupplicationItem.fromMap(c)).toList() : null;
    return supplicationsDayNight!;
  }

  Future<List<ModelSupplicationItem>> getNightSupplications(int sampleBy) async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_supplications', where: 'sample_by == $sampleBy');
    List<ModelSupplicationItem>? supplicationsNight = res.isNotEmpty ? res.map((c) => ModelSupplicationItem.fromMap(c)).toList() : null;
    return supplicationsNight!;
  }
}