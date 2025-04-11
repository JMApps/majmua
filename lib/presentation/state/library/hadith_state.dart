import 'package:flutter/material.dart';

import '../../../domain/entities/hadith_entity.dart';
import '../../../domain/usecases/hadiths_use_case.dart';

class HadithsState with ChangeNotifier {
  final HadithsUseCase _hadithsUseCase;

  HadithsState(this._hadithsUseCase);

  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  set pageIndex(int pageIndex) {
    _pageIndex = pageIndex;
    notifyListeners();
  }

  Future<List<HadithEntity>> getAllHadiths() async {
    return await _hadithsUseCase.fetchAllHadiths();
  }

  Future<HadithEntity> getHadithById({required int hadithId}) async {
    return await _hadithsUseCase.fetchHadithById(hadithId: hadithId);
  }
}