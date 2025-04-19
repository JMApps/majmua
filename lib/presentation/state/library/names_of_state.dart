import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../domain/entities/names_of_ayah_entity.dart';
import '../../../domain/entities/names_of_content_entity.dart';
import '../../../domain/entities/names_of_entity.dart';
import '../../../domain/usecases/names_of_use_case.dart';

class NamesOfState with ChangeNotifier {
  final Box _mainScrollStatesBox = Hive.box(AppStringConstraints.keyMainScrollStatesBox);

  final NamesOfUseCase namesOfUseCase;

  final String keyLastBookPage;

  late final PageController _pageController;

  NamesOfState({required this.namesOfUseCase, required this.keyLastBookPage}) {
    _pageIndex = _mainScrollStatesBox.get(keyLastBookPage, defaultValue: 0);
    _pageController = PageController(initialPage: _pageIndex);
  }

  PageController get pageController => _pageController;

  late int _pageIndex;

  int get pageIndex => _pageIndex;

  set pageIndex(int pageIndex) {
    _pageIndex = pageIndex;
    _mainScrollStatesBox.put(keyLastBookPage, pageIndex);
    notifyListeners();
  }

  Future<List<NamesOfEntity>> getAllNames() async {
    return namesOfUseCase.getAllNames();
  }

  Future<List<NamesOfEntity>> getNameByChapterId({required int contentId}) async {
    return namesOfUseCase.getNameByChapterId(chapterId: contentId);
  }

  Future<List<NamesOfAyahEntity>> getAyahByChapterId({required int contentId}) async {
    return namesOfUseCase.getAyahByChapterId(chapterId: contentId);
  }

  Future<NamesOfContentEntity> getContentById({required int contentId}) async {
    return namesOfUseCase.getContentById(contentId: contentId);
  }

  Future<List<NamesOfContentEntity>> getAllContents() async {
    return namesOfUseCase.getAllContents();
  }
}