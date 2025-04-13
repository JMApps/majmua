import '../entities/question_entity.dart';
import '../entities/question_footnote_entity.dart';
import '../repositories/questions_repository.dart';

class QuestionsUseCase {
  final QuestionsRepository _questionsRepository;

  const QuestionsUseCase(this._questionsRepository);

  Future<List<QuestionEntity>> getAllQuestions() async {
    try {
      return await _questionsRepository.getAllQuestions();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  
  Future<QuestionEntity> getQuestionById({required int questionId}) async {
    try {
      return await _questionsRepository.getQuestionById(questionId: questionId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<QuestionFootnoteEntity> getFootnoteById({required int footnoteId}) async {
    try {
      return await _questionsRepository.getFootnoteById(footnoteId: footnoteId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> getFootnotesByQuestionId({required int questionId}) async {
    try {
      return await _questionsRepository.getFootnotesByQuestionId(questionId: questionId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}