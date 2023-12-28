import '../entities/question_entity.dart';
import '../entities/question_footnote_entity.dart';
import '../repository/questions_repository.dart';

class QuestionsUseCase {

  QuestionsUseCase(this._questionsRepository);

  final QuestionsRepository _questionsRepository;

  Future<List<QuestionEntity>> fetchAllQuestions() async {
    try {
      final List<QuestionEntity> allQuestions = await _questionsRepository.getAllQuestions();
      return allQuestions;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<QuestionFootnoteEntity> fetchFootnoteById({required int footnoteId}) async {
    try {
      final QuestionFootnoteEntity footnoteById = await _questionsRepository.getFootnoteById(footnoteId: footnoteId);
      return footnoteById;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}