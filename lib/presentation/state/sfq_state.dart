import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../core/strings/app_string_constraints.dart';
import '../../domain/entities/sfq_entity.dart';
import '../../domain/usecases/sfq_use_case.dart';

class SFQState extends ChangeNotifier {
  final Box _mainSettingsBox = Hive.box(AppStringConstraints.keyMainAppSettings);

  final SFQUseCase _supplicationUseCase;

  late final PageController _controller;

  final ItemScrollController _itemScrollController = ItemScrollController();

  SFQState(this._supplicationUseCase) {
   _pageMode = _mainSettingsBox.get(AppStringConstraints.keySFQListPageMode, defaultValue: true);
   _arabicTextSize = _mainSettingsBox.get(AppStringConstraints.keySFQArabicTextSize, defaultValue: 22.0);
   _translationTextSize = _mainSettingsBox.get(AppStringConstraints.keySFQTranslationTextSize, defaultValue: 18.0);
   _lastPage = _mainSettingsBox.get(AppStringConstraints.keySFQLastPage, defaultValue: 0);
   _controller = PageController(initialPage: _lastPage.clamp(0, 53));
  }

  PageController get controller => _controller;

  ItemScrollController get itemController => _itemScrollController;

  double _arabicTextSize = 22.0;

  double _translationTextSize = 18.0;

  bool _pageMode = true;

  int _lastPage = 0;

  bool get pageMode => _pageMode;

  double get arabicTextSize => _arabicTextSize;

  double get translationTextSize => _translationTextSize;

  int get lastPage => _lastPage;

  set pageMode(bool state) {
    _pageMode = state;
    _mainSettingsBox.put(AppStringConstraints.keySFQListPageMode, state);
    notifyListeners();
  }

  set arabicTextSize(double size) {
    _arabicTextSize = size;
    _mainSettingsBox.put(AppStringConstraints.keySFQArabicTextSize, size);
    notifyListeners();
  }

  set translationTextSize(double size) {
    _translationTextSize = size;
    _mainSettingsBox.put(AppStringConstraints.keySFQTranslationTextSize, size);
    notifyListeners();
  }

  set lastPage(int page) {
    _lastPage = page;
    _mainSettingsBox.put(AppStringConstraints.keySFQLastPage, page);
  }

  Future<List<SFQEntity>> fetchAllSupplications({required String tableName}) async {
    return await _supplicationUseCase.getAllSupplications(tableName: tableName);
  }

  void defaultItem() {
    final int defaultPage = Random().nextInt(54);
    if (_pageMode) {
      _itemScrollController.scrollTo(index: defaultPage, duration: const Duration(milliseconds: 500));
    } else {
      if (_controller.hasListeners) {
        _controller.animateToPage(defaultPage, duration: const Duration(milliseconds: 500), curve: Curves.easeInSine);
      }
    }
  }
}
