import '../entities/question_entity.dart';
import '../entities/question_footnote_entity.dart';

abstract class QuestionsRepository {
  Future<List<QuestionEntity>> getAllQuestions();

  Future<QuestionEntity> getQuestionById({required int questionId});

  Future<QuestionFootnoteEntity> getFootnoteById({required int footnoteId});

  Future<String> getFootnotesByQuestionId({required int questionId});
}