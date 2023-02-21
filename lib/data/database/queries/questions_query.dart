import 'package:majmua/data/database/models/question_model.dart';
import 'package:majmua/data/database/services/questions_database_helper.dart';

class QuestionsQuery {
  final QuestionsDatabaseHelper _questionsDatabaseHelper = QuestionsDatabaseHelper();

  Future<List<QuestionModel>> getAllQuestions() async {
    var dbClient = await _questionsDatabaseHelper.db;
    var res = await dbClient.query('Table_of_questions');
    List<QuestionModel>? allQuestions = res.isNotEmpty ? res.map((c) => QuestionModel.fromMap(c)).toList() : null;
    return allQuestions!;
  }

  Future<List<QuestionModel>> getOneQuestion(int questionId) async {
    var dbClient = await _questionsDatabaseHelper.db;
    var res = await dbClient.query('Table_of_questions', where: 'id == $questionId');
    List<QuestionModel>? oneQuestion = res.isNotEmpty ? res.map((c) => QuestionModel.fromMap(c)).toList() : null;
    return oneQuestion!;
  }
}
