import 'package:flutter/material.dart';

class QiblahDirectionState with ChangeNotifier {
  double _deviceOrientation = 0.0;

  double get deviceOrientation => _deviceOrientation;

  void updateDeviceOrientation(double orientation) {
    _deviceOrientation = orientation;
    notifyListeners();
  }
}