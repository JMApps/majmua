import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/application/constants/app_constants.dart';

class BookSettingsState extends ChangeNotifier {

  final _mainSettingsBox = Hive.box(AppConstants.keyMainAppSettings);

  late double _textSize;
  // late int _textColor;

  BookSettingsState() {
    _textSize = _mainSettingsBox.get(AppConstants.keyMainBookTextSize, defaultValue: 18.0);
    // _textColor = _mainSettingsBox.get(AppConstants.keyMainBookTextColor, defaultValue: Colors.black.value);
  }

  double get getTextSize => _textSize;

  // int get getTextColor => _textColor;

  set setChangeTextSize(double textSize) {
    _textSize = textSize;
    _mainSettingsBox.put(AppConstants.keyMainBookTextSize, _textSize);
    notifyListeners();
  }

  // set setChangeTextColor(int color) {
  //   _textColor = color;
  //   _mainSettingsBox.put(AppConstants.keyMainBookTextColor, _textColor);
  //   notifyListeners();
  // }

  @override
  void dispose() {
    _mainSettingsBox.close();
    super.dispose();
  }
}