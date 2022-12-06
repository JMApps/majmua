import 'package:flutter/material.dart';

class MainAppState extends ChangeNotifier {
  final PageController _fridayController = PageController(initialPage: 0, viewportFraction: 0.85);

  PageController get getFridayController => _fridayController;

  int _fridaySunnahControllerIndex = 0;

  int get getFridaySunnahControllerIndex => _fridaySunnahControllerIndex;

  set fridaySunnahControllerIndex(int index) {
    _fridaySunnahControllerIndex = index;
    if (_fridayController.hasClients) {
      _fridayController.animateToPage(
        index,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    }
    notifyListeners();
  }
}
