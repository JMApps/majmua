import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/strings/app_string_constraints.dart';
import '../../../domain/entities/strength_entity.dart';
import '../../../domain/entities/strength_footnote_entity.dart';
import '../../../domain/usecases/strength_use_case.dart';

class StrengthState with ChangeNotifier {
  final Box _mainScrollStatesBox = Hive.box(AppStringConstraints.keyMainScrollStatesBox);

  final StrengthUseCase strengthUseCase;

  final String keyLastBookPage;

  late final PageController _pageController;

  StrengthState({required this.strengthUseCase, required this.keyLastBookPage}) {
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

  Future<List<StrengthEntity>> getAllStrengths() async {
    return await strengthUseCase.fetchAllStrengths();
  }

  Future<StrengthEntity> getStrengthById({required int strengthId}) async {
    return await strengthUseCase.fetchStrengthById(strengthId: strengthId);
  }

  Future<StrengthFootnoteEntity> getFootnoteById({required int footnoteId}) async {
    return await strengthUseCase.fetchFootnoteById(footnoteId: footnoteId);
  }
}
