import 'package:flutter/material.dart';

import '../../../domain/entities/question_entity.dart';
import '../../../domain/entities/question_footnote_entity.dart';
import '../../../domain/usecases/questions_use_case.dart';

class QuestionsState with ChangeNotifier {
  final QuestionsUseCase _questionsUseCase;

  QuestionsState(this._questionsUseCase);

  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  set pageIndex(int pageIndex) {
    _pageIndex = pageIndex;
    notifyListeners();
  }

  Future<List<QuestionEntity>> getAllQuestions() async {
    return await _questionsUseCase.getAllQuestions();
  }

  Future<QuestionEntity> getQuestionById({required int questionId}) async {
    return await _questionsUseCase.getQuestionById(questionId: questionId);
  }

  Future<QuestionFootnoteEntity> getFootnoteById({required int footnoteId}) async {
    return await _questionsUseCase.getFootnoteById(footnoteId: footnoteId);
  }

  Future<String> getFootnotesByQuestionId({required int questionId}) async {
    return await _questionsUseCase.getFootnotesByQuestionId(questionId: questionId);
  }
}