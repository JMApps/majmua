import 'package:flutter/material.dart';

import '../../../domain/entities/lessons_entity.dart';
import '../../../domain/usecases/lessons_use_case.dart';

class LessonsState with ChangeNotifier {
  final LessonsUseCase _lessonsUseCase;

  LessonsState(this._lessonsUseCase);

  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  set pageIndex(int pageIndex) {
    _pageIndex = pageIndex;
    notifyListeners();
  }

  Future<List<LessonsEntity>> getAllLessons() async {
    return await _lessonsUseCase.fetchAllLessons();
  }

  Future<LessonsEntity> getLessonById({required int lessonId}) async {
    return await _lessonsUseCase.fetchLessonById(lessonId: lessonId);
  }
}
