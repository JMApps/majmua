import 'package:flutter/material.dart';

class AppBarState extends ChangeNotifier {
  bool _isShow = true;

  bool get getIsShow => _isShow;

  set setIsShow(bool value) {
    _isShow = value;
    notifyListeners();
  }
}
