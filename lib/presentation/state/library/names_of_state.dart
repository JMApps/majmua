import 'package:flutter/material.dart';

import '../../../domain/entities/names_of_ayah_entity.dart';
import '../../../domain/entities/names_of_content_entity.dart';
import '../../../domain/entities/names_of_entity.dart';
import '../../../domain/usecases/names_of_use_case.dart';

class NamesOfState with ChangeNotifier {
  final NamesOfUseCase _namesOfUseCase;

  NamesOfState(this._namesOfUseCase);

  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  set pageIndex(int pageIndex) {
    _pageIndex = pageIndex;
    notifyListeners();
  }

  Future<List<NamesOfEntity>> getAllNames() async {
    return _namesOfUseCase.getAllNames();
  }

  Future<List<NamesOfEntity>> getNameByChapterId({required int contentId}) async {
    return _namesOfUseCase.getNameByChapterId(chapterId: contentId);
  }

  Future<List<NamesOfAyahEntity>> getAyahByChapterId({required int contentId}) async {
    return _namesOfUseCase.getAyahByChapterId(chapterId: contentId);
  }

  Future<NamesOfContentEntity> getContentById({required int contentId}) async {
    return _namesOfUseCase.getContentById(contentId: contentId);
  }
}