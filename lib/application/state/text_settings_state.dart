import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/application/strings/app_constants.dart';

class TextSettingsState extends ChangeNotifier {

  final Box _mainAppSettingsBox = Hive.box(AppConstants.keyMainAppSettings);

  late double _fontSize;
  late bool _isTranscription;

  TextSettingsState() {
    _fontSize = _mainAppSettingsBox.get(AppConstants.keyMainTextSize, defaultValue: 16.0);
    _isTranscription = _mainAppSettingsBox.get(AppConstants.keyIsTranscriptionShow, defaultValue: false);
  }

  double get getFontSize => _fontSize;

  set setFontSize(double value) {
    _fontSize = value;
    _mainAppSettingsBox.put(AppConstants.keyMainTextSize, value);
    notifyListeners();
  }

  bool get getIsTranscription => _isTranscription;

  set setIsTranscription(bool value) {
    _isTranscription = value;
    _mainAppSettingsBox.put(AppConstants.keyIsTranscriptionShow, value);
    notifyListeners();
  }
}
