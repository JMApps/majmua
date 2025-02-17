import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../domain/entities/gem_entity.dart';
import '../../domain/usecases/gems_use_case.dart';

class GemsState extends ChangeNotifier {
  final GemsUseCase _gemsUseCase;

  final PageController _controller = PageController();

  final ItemScrollController _itemScrollController = ItemScrollController();

  GemsState(this._gemsUseCase);

  PageController get controller => _controller;

  ItemScrollController get itemController => _itemScrollController;

  bool _pageMode = true;

  bool get pageMode => _pageMode;

  set pageMode(bool state) {
    _pageMode = state;
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
