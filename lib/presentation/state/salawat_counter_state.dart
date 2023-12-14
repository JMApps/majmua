import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:majmua/core/strings/app_constraints.dart';

class SalawatCounterState extends ChangeNotifier {
  final _salawatSettingsBox = Hive.box(AppConstraints.keyWeeklySalawatSettings);

  int _salawatCount = 0;

  int get getSalawatCount => _salawatCount;

  SalawatCounterState() {
    _salawatCount = _salawatSettingsBox.get(AppConstraints.keySalawatCount, defaultValue: 0);
  }

  void get changeSalawatCount {
    _salawatCount++;
    HapticFeedback.lightImpact();
    _salawatSettingsBox.put(AppConstraints.keySalawatCount, _salawatCount);
    notifyListeners();
  }

  void get resetSalawatCount {
    _salawatCount = 0;
    HapticFeedback.vibrate();
    _salawatSettingsBox.put(AppConstraints.keySalawatCount, _salawatCount);
    notifyListeners();
  }
}