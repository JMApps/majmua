import 'package:majmua/data/database/model/model_hadeeth_item.dart';
import 'package:majmua/data/database/model/model_lesson_ramadan_item.dart';
import 'package:majmua/data/database/model/model_question_item.dart';
import 'package:majmua/data/database/model/model_raqaiq_item.dart';
import 'package:majmua/data/database/model/model_supplication_item.dart';
import 'package:majmua/data/database/model/model_supplications_from_quran.dart';
import 'package:majmua/data/database/service/database_day_night.dart';
import 'package:majmua/data/database/service/database_hadeeth.dart';
import 'package:majmua/data/database/service/database_lessons_ramadan.dart';
import 'package:majmua/data/database/service/database_questions.dart';
import 'package:majmua/data/database/service/database_raqaiq.dart';
import 'package:majmua/data/database/service/database_supplications_from_quran.dart';

class DatabaseQuery {


  static final DatabaseQuery _instance = DatabaseQuery.internal();
  factory DatabaseQuery() => _instance;
  DatabaseQuery.internal();

  final DatabaseDayNight _databaseDayNight = DatabaseDayNight();
  final DatabaseSupplicationsFromQuran _databaseSupplicationsFromQuran = DatabaseSupplicationsFromQuran();
  final DatabaseQuestions _databaseQuestions = DatabaseQuestions();
  final DatabaseHadeeth _databaseHadeeth = DatabaseHadeeth();
  final DatabaseLessonsRamadan _databaseLessonsRamadan = DatabaseLessonsRamadan();
  final DatabaseRaqaiq _databaseRaqaiq = DatabaseRaqaiq();

  // Future<List<ModelNameItem>> getNames() async {
  //   var dbClient = await con.db;
  //   var res = await dbClient.query('Table_of_names');
  //   List<ModelNameItem>? names = res.isNotEmpty ? res.map((c) => ModelNameItem.fromMap(c)).toList() : null;
  //   return names!;
  // }

  Future<List<ModelSupplicationItem>> getDayNightSupplications(bool isDayNight) async {
    var dbClient = await _databaseDayNight.db;
    var res = await dbClient.rawQuery('SELECT * FROM Table_of_supplications WHERE ${isDayNight ? 'is_day_night == 0 OR is_day_night == 1' : 'is_day_night == 0 OR is_day_night == 2'}');
    List<ModelSupplicationItem>? supplicationsDayNight = res.isNotEmpty ? res.map((c) => ModelSupplicationItem.fromMap(c)).toList() : null;
    return supplicationsDayNight!;
  }

  Future<List<ModelSupplicationItem>> getNightSupplications(int sampleBy) async {
    var dbClient = await _databaseDayNight.db;
    var res = await dbClient.query('Table_of_supplications', where: 'sample_by == $sampleBy');
    List<ModelSupplicationItem>? supplicationsNight = res.isNotEmpty ? res.map((c) => ModelSupplicationItem.fromMap(c)).toList() : null;
    return supplicationsNight!;
  }

  Future<List<ModelSupplicationsFromQuran>> getSupplicationsFromQuran() async {
    var dbClient = await _databaseSupplicationsFromQuran.db;
    var res = await dbClient.query('Table_of_supplications_from_quran');
    List<ModelSupplicationsFromQuran>? supplicationsFromQuran = res.isNotEmpty ? res.map((c) => ModelSupplicationsFromQuran.fromMap(c)).toList() : null;
    return supplicationsFromQuran!;
  }

  Future<List<ModelQuestionItem>> getQuestions() async {
    var dbClient = await _databaseQuestions.db;
    var res = await dbClient.query('Table_of_questions');
    List<ModelQuestionItem>? questions = res.isNotEmpty ? res.map((c) => ModelQuestionItem.fromMap(c)).toList() : null;
    return questions!;
  }

  Future<List<ModelQuestionItem>> getOneQuestion(int questionId) async {
    var dbClient = await _databaseQuestions.db;
    var res = await dbClient.query('Table_of_questions', where: 'id == $questionId');
    List<ModelQuestionItem>? questions = res.isNotEmpty ? res.map((c) => ModelQuestionItem.fromMap(c)).toList() : null;
    return questions!;
  }

  Future<List<ModelHadeethItem>> getHadeeths() async {
    var dbClient = await _databaseHadeeth.db;
    var res = await dbClient.query('Table_of_hadeeths');
    List<ModelHadeethItem>? hadeeths = res.isNotEmpty ? res.map((c) => ModelHadeethItem.fromMap(c)).toList() : null;
    return hadeeths!;
  }

  Future<List<ModelHadeethItem>> getOneHadeeth(int hadeethId) async {
    var dbClient = await _databaseHadeeth.db;
    var res = await dbClient.query('Table_of_hadeeths', where: 'id == $hadeethId');
    List<ModelHadeethItem>? hadeeths = res.isNotEmpty ? res.map((c) => ModelHadeethItem.fromMap(c)).toList() : null;
    return hadeeths!;
  }

  Future<List<ModelLessonRamadanItem>> getLessonsRamadan() async {
    var dbClient = await _databaseLessonsRamadan.db;
    var res = await dbClient.query('Table_of_lessons_ramadan');
    List<ModelLessonRamadanItem>? lessonsRamadan = res.isNotEmpty ? res.map((c) => ModelLessonRamadanItem.fromMap(c)).toList() : null;
    return lessonsRamadan!;
  }

  Future<List<ModelLessonRamadanItem>> getOneLessonRamadan(int chapterId) async {
    var dbClient = await _databaseLessonsRamadan.db;
    var res = await dbClient.query('Table_of_lessons_ramadan', where: 'id == $chapterId');
    List<ModelLessonRamadanItem>? lessonsRamadan = res.isNotEmpty ? res.map((c) => ModelLessonRamadanItem.fromMap(c)).toList() : null;
    return lessonsRamadan!;
  }

  Future<List<ModelRaqaiqItem>> getRaqaiq() async {
    var dbClient = await _databaseRaqaiq.db;
    var res = await dbClient.query('Table_of_main_content');
    List<ModelRaqaiqItem>? raqaiq = res.isNotEmpty ? res.map((c) => ModelRaqaiqItem.fromMap(c)).toList() : null;
    return raqaiq!;
  }

  Future<List<ModelRaqaiqItem>> getOneRaqaiq(int chapterId) async {
    var dbClient = await _databaseRaqaiq.db;
    var res = await dbClient.query('Table_of_main_content', where: 'id == $chapterId');
    List<ModelRaqaiqItem>? oneRaqaiq = res.isNotEmpty ? res.map((c) => ModelRaqaiqItem.fromMap(c)).toList() : null;
    return oneRaqaiq!;
  }
}