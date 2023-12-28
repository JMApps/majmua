import 'package:majmua/data/models/question_footnote_model.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/entities/question_entity.dart';
import '../../domain/entities/question_footnote_entity.dart';
import '../../domain/repository/questions_repository.dart';
import '../models/question_model.dart';
import '../services/local/questions_database_service.dart';

class QuestionsDataRepository implements QuestionsRepository {
  final QuestionsDatabaseService _questionsDatabaseService = QuestionsDatabaseService();

  @override
  Future<List<QuestionEntity>> getAllQuestions() async {
    final Database database = await _questionsDatabaseService.db;
    final List<Map<String, Object?>> resources = await database.query('Table_of_questions');
    final List<QuestionEntity> allQuestions = resources.isNotEmpty ? resources.map((c) => _questionToEntity(QuestionModel.fromMap(c))).toList() : [];
    return allQuestions;
  }

  @override
  Future<List<QuestionEntity>> getQuestionById({required int questionId}) async {
    final Database database = await _questionsDatabaseService.db;
    final List<Map<String, Object?>> resources = await database.query('Table_of_questions', where: 'id = $questionId', whereArgs: [questionId]);
    final List<QuestionEntity> questionById = resources.isNotEmpty ? resources.map((c) => _questionToEntity(QuestionModel.fromMap(c))).toList() : [];
    return questionById;
  }

  @override
  Future<QuestionFootnoteEntity> getFootnoteById({required int footnoteId}) async {
    final Database database = await _questionsDatabaseService.db;
    final List<Map<String, Object?>> resources = await database.query('Table_of_footnotes', where: 'id = $footnoteId', whereArgs: [footnoteId]);
    final QuestionFootnoteEntity? footnoteById = resources.isNotEmpty ? _footnoteToEntity(QuestionFootnoteModel.fromMap(resources.first)) : null;
    return footnoteById!;
  }

  // Mapping to entity
  QuestionEntity _questionToEntity(QuestionModel model) {
    return QuestionEntity(
      id: model.id,
      questionNumber: model.questionNumber,
      questionContent: model.questionContent,
      answerContent: model.answerContent,
    );
  }

  // Mapping to entity
  QuestionFootnoteEntity _footnoteToEntity(QuestionFootnoteModel model) {
    return QuestionFootnoteEntity(
      id: model.id,
      footnoteContent: model.footnoteContent,
    );
  }
}
