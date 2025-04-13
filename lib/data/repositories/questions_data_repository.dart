import 'package:sqflite/sqflite.dart';

import '../../core/strings/db_value_strings.dart';
import '../../domain/entities/question_entity.dart';
import '../../domain/entities/question_footnote_entity.dart';
import '../../domain/repositories/questions_repository.dart';
import '../models/question_footnote_model.dart';
import '../models/question_model.dart';
import '../services/databases/questions_database_service.dart';

class QuestionsDataRepository implements QuestionsRepository {
  final QuestionsDatabaseService _databaseService;

  const QuestionsDataRepository(this._databaseService);

  @override
  Future<List<QuestionEntity>> getAllQuestions() async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValueStrings.dbQuestionsTableName);
    final List<QuestionEntity> allQuestions = resources.isNotEmpty ? resources.map((e) => QuestionEntity.fromModel(QuestionModel.fromMap(e))).toList() : [];
    return allQuestions;
  }

  @override
  Future<QuestionEntity> getQuestionById({required int questionId}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resource = await database.query(DBValueStrings.dbQuestionsTableName, where: '${DBValueStrings.id} = ?', whereArgs: [questionId]);
    final QuestionEntity? questionById = resource.isNotEmpty ? QuestionEntity.fromModel(QuestionModel.fromMap(resource.first)) : null;
    return questionById!;
  }

  @override
  Future<QuestionFootnoteEntity> getFootnoteById({required int footnoteId}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, dynamic>> resource = await database.query(DBValueStrings.dbFootnotesTableName, where: '${DBValueStrings.id} = ?', whereArgs: [footnoteId]);
    final QuestionFootnoteEntity? footnoteById = resource.isNotEmpty ? QuestionFootnoteEntity.fromModel(QuestionFootnoteModel.fromMap(resource.first)) : null;
    return footnoteById!;
  }

  @override
  Future<String> getFootnotesByQuestionId({required int questionId}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValueStrings.dbFootnotesTableName, where: '${DBValueStrings.dbContentNumber} = ?', whereArgs: [questionId]);
    final List<QuestionFootnoteEntity> footnotesByQuestionId = resources.isNotEmpty ? resources.map((e) => QuestionFootnoteEntity.fromModel(QuestionFootnoteModel.fromMap(e))).toList() : [];
    final String serializedFootnotes = footnotesByQuestionId.asMap().entries.map((entry) => '[${entry.value.id}] – ${entry.value.footnoteContent}').join('\n\n');
    return serializedFootnotes;
  }
}
