import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../core/strings/app_string_constraints.dart';
import '../../domain/entities/gem_entity.dart';
import '../../domain/usecases/gems_use_case.dart';

class GemsState extends ChangeNotifier {
  final Box _mainSettingsBox = Hive.box(AppStringConstraints.keyMainAppSettings);

  final GemsUseCase _gemsUseCase;

  final PageController _controller = PageController();

  final ItemScrollController _itemScrollController = ItemScrollController();

  GemsState(this._gemsUseCase) {
    _pageMode = _mainSettingsBox.get(AppStringConstraints.keyGemsListPageMode, defaultValue: true);
    _textSize = _mainSettingsBox.get(AppStringConstraints.keyGemsTextSize, defaultValue: 18.0);
  }

  PageController get controller => _controller;

  ItemScrollController get itemController => _itemScrollController;

  double _textSize = 18.0;

  bool _pageMode = true;

  double get textSize => _textSize;

  bool get pageMode => _pageMode;

  set textSize(double size) {
    _textSize = size;
    _mainSettingsBox.put(AppStringConstraints.keyGemsTextSize, size);
    notifyListeners();
  }

  set pageMode(bool state) {
    _pageMode = state;
    _mainSettingsBox.put(AppStringConstraints.keyGemsListPageMode, state);
    notifyListeners();
  }

  Future<List<GemEntity>> fetchAllGems() async {
    return await _gemsUseCase.fetchAllGems();
  }

  void defaultItem() {
    final int defaultPage = Random().nextInt(605);
    if (_pageMode) {
      _itemScrollController.scrollTo(index: defaultPage, duration: const Duration(milliseconds: 500));
    } else {
      if (_controller.hasListeners) {
        _controller.animateToPage(defaultPage, duration: const Duration(milliseconds: 500), curve: Curves.easeInSine);
      }
    }
  }
}
