import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../core/strings/app_string_constraints.dart';
import '../../../domain/entities/raqaiq_entity.dart';
import '../../../domain/usecases/raqaiq_use_case.dart';

class RaqaiqState with ChangeNotifier {
  final Box _mainScrollStatesBox = Hive.box(AppStringConstraints.keyMainScrollStatesBox);

  final RaqaiqUseCase raqaiqUseCase;

  final String keyLastBookPage;

  late final PageController _pageController;

  RaqaiqState({required this.raqaiqUseCase, required this.keyLastBookPage}) {
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

  Future<List<RaqaiqEntity>> getAllRaqaiqs() async {
    return await raqaiqUseCase.fetchAllRaqaiqs();
  }

  Future<RaqaiqEntity> getRaqaiqById({required int raqaiqId}) async {
    return await raqaiqUseCase.fetchRaqaiqById(raqaiqId: raqaiqId);
  }
}
