import 'package:flutter/material.dart';

class MainAppState extends ChangeNotifier {
  final PageController _fridayController = PageController(initialPage: 0, viewportFraction: 0.85);

  final DateTime _dateTime = DateTime.now();

  bool _isTextPercentChange = true;

  bool get getIsTextPercentChange => _isTextPercentChange;

  int get getDayInMinutes => _dateTime.difference(DateTime(_dateTime.year, _dateTime.month, _dateTime.day)).inMinutes;

  PageController get getFridayController => _fridayController;

  int _fridaySunnahControllerIndex = 0;

  int get getFridaySunnahControllerIndex => _fridaySunnahControllerIndex;

  double restDayProgress() {
    return getDayInMinutes * 24 * 60 / 20736;
  }

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

  setPercentTextChange() {
    _isTextPercentChange = !_isTextPercentChange;
    notifyListeners();
  }
}
