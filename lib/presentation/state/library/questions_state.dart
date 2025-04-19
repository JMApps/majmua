import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../domain/entities/question_entity.dart';
import '../../../domain/entities/question_footnote_entity.dart';
import '../../../domain/usecases/questions_use_case.dart';

class QuestionsState with ChangeNotifier {
  final Box _mainScrollStatesBox = Hive.box(AppStringConstraints.keyMainScrollStatesBox);

  final QuestionsUseCase questionsUseCase;

  final String keyLastBookPage;

  late final PageController _pageController;

  QuestionsState({ required this.questionsUseCase, required this.keyLastBookPage}) {
    _pageIndex = _mainScrollStatesBox.get(keyLastBookPage, defaultValue: 0);
    _pageController = PageController(initialPage: _pageIndex);
  }

  PageController get pageController => _pageController;

  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  set pageIndex(int pageIndex) {
    _pageIndex = pageIndex;
    _mainScrollStatesBox.put(keyLastBookPage, pageIndex);
    notifyListeners();
  }

  Future<List<QuestionEntity>> getAllQuestions() async {
    return await questionsUseCase.getAllQuestions();
  }

  Future<QuestionEntity> getQuestionById({required int questionId}) async {
    return await questionsUseCase.getQuestionById(questionId: questionId);
  }

  Future<QuestionFootnoteEntity> getFootnoteById({required int footnoteId}) async {
    return await questionsUseCase.getFootnoteById(footnoteId: footnoteId);
  }

  Future<String> getFootnotesByQuestionId({required int questionId}) async {
    return await questionsUseCase.getFootnotesByQuestionId(questionId: questionId);
  }
}