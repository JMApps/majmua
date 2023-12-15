import 'package:flutter/material.dart';

class InputAddCityState extends ChangeNotifier {
  bool _inputCountry = false;

  bool get getInputCountry => _inputCountry;

  set setInputCountry(String country) {
    _inputCountry = country.isEmpty;
    notifyListeners();
  }

  bool _inputCity = false;

  bool get getInputCity => _inputCity;

  set setInputCity(String city) {
    _inputCity = city.isEmpty;
    notifyListeners();
  }

  bool _inputLatitude = false;

  bool get getInputLatitude => _inputLatitude;

  set setInputLatitude(String latitude) {
    _inputLatitude = latitude.isEmpty;
    notifyListeners();
  }

  bool _inputLongitude = false;

  bool get getInputLongitude => _inputLongitude;

  set setInputLongitude(String longitude) {
    _inputLongitude = longitude.isEmpty;
    notifyListeners();
  }
}
