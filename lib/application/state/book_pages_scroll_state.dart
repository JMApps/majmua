import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/application/strings/app_constants.dart';

class BookPagesScrollState extends ChangeNotifier {
  final _mainSettingsBox = Hive.box(AppConstants.keyMainAppSettings);

  late PageController _pageController;

  final String keyForSettingsInitialization;

  BookPagesScrollState({required this.keyForSettingsInitialization}) {
    _lastPageNumber = _mainSettingsBox.get(keyForSettingsInitialization, defaultValue: 0);
    _pageController  = PageController(initialPage: _lastPageNumber);
  }

  PageController get getPageController => _pageController;

  late int _lastPageNumber;

  int get getLastPageNumber => _lastPageNumber;

  PageController get nextPage {
    if (_pageController.hasClients) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInQuad,
      );
    }
    notifyListeners();
    return _pageController;
  }

  PageController get previousPage {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInQuad,
    );
    notifyListeners();
    return _pageController;
  }

  changePageForLast({required int currentPage}) async {
    _lastPageNumber = currentPage;
    notifyListeners();
  }

  @override
  void dispose() async {
    await _mainSettingsBox.put(keyForSettingsInitialization, _lastPageNumber);
    _pageController.dispose();
    super.dispose();
  }
}
