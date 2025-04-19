import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/strings/app_string_constraints.dart';

class SalawatState extends ChangeNotifier {
  final _appCounterBox = Hive.box(AppStringConstraints.keyWeeklySalawatSettings);

  SalawatState() {
    _salawatCount = _appCounterBox.get(AppStringConstraints.keySalawatCount, defaultValue: 0);
  }

  late int _salawatCount;

  int get salawatCount => _salawatCount;

  void incrementCount() {
    _salawatCount++;
    _appCounterBox.put(AppStringConstraints.keySalawatCount, _salawatCount);
    notifyListeners();
  }

  void resetCount() {
    _salawatCount = 0;
    _appCounterBox.put(AppStringConstraints.keySalawatCount, _salawatCount);
    notifyListeners();
  }
}