import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SupplicationsState extends ChangeNotifier {
  final PageController _supplicationController =
      PageController(initialPage: 0, viewportFraction: 0.85);

  PageController get getSupplicationController => _supplicationController;

  int get getSupplicationControllerIndex =>
      _supplicationController.page!.toInt();

  int _supplicationCount = 0;

  int get getSupplicationCount => _supplicationCount;

  bool _isVibration = true;

  bool get getIsVibration => _isVibration;

  bool _isTranscription = false;

  bool get getIsTranscription => _isTranscription;

  changeShowTranscription() {
    _isTranscription = !_isTranscription;
    notifyListeners();
  }

  set setSupplicationControllerIndex(int index) {
    if (_supplicationController.hasClients) {
      _supplicationController.animateToPage(
        index,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutCirc,
      );
    }
    notifyListeners();
  }

  updateCountValue() {
    if (_supplicationCount < 100) {
      _supplicationCount++;
    } else {
      _supplicationCount = 1;
    }
    if (_isVibration) {
      HapticFeedback.lightImpact();
    }
    notifyListeners();
  }

  resetCount() {
    _supplicationCount = 0;
    notifyListeners();
  }

  isVibration() {
    _isVibration = !_isVibration;
    if (_isVibration) {
      HapticFeedback.lightImpact();
    }
    notifyListeners();
  }
}
