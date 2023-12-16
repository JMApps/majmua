import 'package:flutter/material.dart';

class AppSettingsState extends ChangeNotifier {
  int _backgroundPictureIndex = 5;

  int get getBackgroundPictureIndex => _backgroundPictureIndex;

  set setBackgroundPictureIndex(int backgroundPicIndex) {
    _backgroundPictureIndex = backgroundPicIndex;
    notifyListeners();
  }
}
