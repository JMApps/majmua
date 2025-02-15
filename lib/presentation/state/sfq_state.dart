
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../domain/entities/supplication_entity.dart';
import '../../domain/usecases/supplication_use_case.dart';

class SFQState extends ChangeNotifier {
  final SupplicationUseCase _supplicationUseCase;

  final PageController _controller = PageController();

  final ItemScrollController _itemScrollController = ItemScrollController();

  SFQState(this._supplicationUseCase);

  PageController get controller => _controller;

  ItemScrollController get itemController => _itemScrollController;

  bool _pageMode = true;

  bool get pageMode => _pageMode;

  set pageMode(bool state) {
    _pageMode = state;
    notifyListeners();
  }

  Future<List<SupplicationEntity>> fetchAllSupplications({required String tableName}) async {
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
