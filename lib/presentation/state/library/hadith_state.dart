import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../domain/entities/hadith_entity.dart';
import '../../../domain/usecases/hadiths_use_case.dart';

class HadithsState with ChangeNotifier {
  final Box _mainScrollStatesBox = Hive.box(AppStringConstraints.keyMainScrollStatesBox);

  final HadithsUseCase hadithsUseCase;

  final String keyLastBookPage;

  late final PageController _pageController;

  HadithsState({required this.hadithsUseCase, required this.keyLastBookPage}) {
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

  Future<List<HadithEntity>> getAllHadiths() async {
    return await hadithsUseCase.fetchAllHadiths();
  }

  Future<HadithEntity> getHadithById({required int hadithId}) async {
    return await hadithsUseCase.fetchHadithById(hadithId: hadithId);
  }
}
