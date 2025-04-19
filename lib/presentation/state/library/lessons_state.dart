import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../domain/entities/lessons_entity.dart';
import '../../../domain/usecases/lessons_use_case.dart';

class LessonsState with ChangeNotifier {
  final Box _mainScrollStatesBox = Hive.box(AppStringConstraints.keyMainScrollStatesBox);

  final LessonsUseCase lessonsUseCase;

  final String keyLastBookPage;

  LessonsState({ required this.lessonsUseCase, required this.keyLastBookPage}) {
    _pageIndex = _mainScrollStatesBox.get(keyLastBookPage, defaultValue: 0);
    _pageController = PageController(initialPage: _pageIndex);
  }

  late final PageController _pageController;

  PageController get pageController => _pageController;

  late int _pageIndex;

  int get pageIndex => _pageIndex;

  set pageIndex(int pageIndex) {
    _pageIndex = pageIndex;
    _mainScrollStatesBox.put(keyLastBookPage, pageIndex);
    notifyListeners();
  }

  Future<List<LessonsEntity>> getAllLessons() async {
    return await lessonsUseCase.fetchAllLessons();
  }

  Future<LessonsEntity> getLessonById({required int lessonId}) async {
    return await lessonsUseCase.fetchLessonById(lessonId: lessonId);
  }
}
