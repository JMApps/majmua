import 'package:flutter/material.dart';

import '../../domain/entities/city_entity.dart';
import '../../domain/usecases/city_use_case.dart';

class CityState with ChangeNotifier {
  final CityUseCase _cityUseCase;

  CityState(this._cityUseCase);

  String _searchValue = '';

  String get searchValue => _searchValue;

  set searchValue(String value) {
    _searchValue = value;
    notifyListeners();
  }

  Future<List<CityEntity>> getAllCities() async {
    return await _cityUseCase.fetchAllCities();
  }

  Future<int> createCity({required Map<String, dynamic> mapCity}) async {
    final int createCity = await _cityUseCase.fetchCreateCity(mapCity: mapCity);
    notifyListeners();
    return createCity;
  }

  Future<int> updateCity({required Map<String, dynamic> mapCity, required int idCity}) async {
    final int updateCity = await _cityUseCase.fetchUpdateCity(mapCity: mapCity, idCity: idCity);
    notifyListeners();
    return updateCity;
  }

  Future<int> deleteCity({required int idCity}) async {
    final int deleteCity = await _cityUseCase.fetchDeleteCity(idCity: idCity);
    notifyListeners();
    return deleteCity;
  }
}