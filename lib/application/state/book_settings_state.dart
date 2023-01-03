import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/application/constants/app_constants.dart';

class BookSettingsState extends ChangeNotifier {

  final _mainSettingsBox = Hive.box(AppConstants.keyMainAppSettings);

  final String keyCurrentTextSize;
  final String keyCurrentTextColor;

  late double _textSize;
  late Color _textColor;

  BookSettingsState({required this.keyCurrentTextSize, required this.keyCurrentTextColor}) {
    _textSize = _mainSettingsBox.get(keyCurrentTextSize, defaultValue: 16.0) ?? 16.0;
    _textColor = _mainSettingsBox.get(keyCurrentTextColor, defaultValue: Colors.black);
  }

  double get getTextSize => _textSize;

  Color get getTextColor => _textColor;

  set setChangeTextSize(double textSize) {
    _textSize = textSize;
    notifyListeners();
  }

  set setChangeTextColor(Color color) {
    _textColor = color;
    notifyListeners();
  }

  @override
  void dispose() {
    _mainSettingsBox.put(keyCurrentTextSize, _textSize);
    _mainSettingsBox.put(keyCurrentTextColor, _textColor);
    super.dispose();
  }
}