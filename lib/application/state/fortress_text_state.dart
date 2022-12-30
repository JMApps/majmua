import 'package:flutter/material.dart';

class FortressTextState extends ChangeNotifier {
  bool _transcriptionIsShow = false;

  bool get getTranscriptionIsShow => _transcriptionIsShow;

  set setTranscriptionIsShow(bool value) {
    _transcriptionIsShow = value;
    notifyListeners();
  }
}