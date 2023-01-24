import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/application/strings/app_constants.dart';

class WeeklySalawatState extends ChangeNotifier {
  final Box _salawatSettingsBox = Hive.box(AppConstants.keyWeeklySalawatSettings);
  int _salawatCount = 0;

  WeeklySalawatState() {
    _salawatCount = _salawatSettingsBox.get(AppConstants.keySalawatCount, defaultValue: 0);
  }

  changeSalawatCount() {
    _salawatCount++;
    _salawatSettingsBox.put(AppConstants.keySalawatCount, _salawatCount);
    notifyListeners();
  }

  int get getSalawatCount => _salawatCount;

  @override
  void dispose() {
    _salawatSettingsBox.close();
    super.dispose();
  }
}
