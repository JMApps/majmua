import 'package:flutter/cupertino.dart';

class TextSettingsState extends ChangeNotifier {

  double _fontSize = 16.0;
  bool _isTranscription = false;

  double get getFontSize => _fontSize;

  set setFontSize(double value) {
    _fontSize = value;
    notifyListeners();
  }

  bool get getIsTranscription => _isTranscription;

  set setIsTranscription(bool value) {
    _isTranscription = value;
    notifyListeners();
  }
}
