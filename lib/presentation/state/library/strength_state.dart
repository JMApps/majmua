import 'package:flutter/material.dart';

import '../../../domain/entities/strength_entity.dart';
import '../../../domain/entities/strength_footnote_entity.dart';
import '../../../domain/usecases/strength_use_case.dart';

class StrengthState with ChangeNotifier {
  final StrengthUseCase _strengthUseCase;

  StrengthState(this._strengthUseCase);

  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  set pageIndex(int pageIndex) {
    _pageIndex = pageIndex;
    notifyListeners();
  }

  Future<List<StrengthEntity>> getAllStrengths() async {
    return await _strengthUseCase.fetchAllStrengths();
  }

  Future<StrengthEntity> getStrengthById({required int strengthId}) async {
    return await _strengthUseCase.fetchStrengthById(strengthId: strengthId);
  }

  Future<StrengthFootnoteEntity> getFootnoteById({required int footnoteId}) async {
    return await _strengthUseCase.fetchFootnoteById(footnoteId: footnoteId);
  }
}
