import 'package:flutter/material.dart';

class SFQPagesScrollState extends ChangeNotifier {
  final PageController _pageController = PageController(initialPage: 0);

  PageController get getPageController => _pageController;

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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
