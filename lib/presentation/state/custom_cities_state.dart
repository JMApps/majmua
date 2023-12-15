import 'package:flutter/material.dart';
import 'package:majmua/data/repositories/custom_cities_data_repository.dart';
import 'package:majmua/domain/entities/custom_city_entity.dart';
import 'package:majmua/domain/usecases/custom_cities_use_case.dart';

class CustomCitiesState extends ChangeNotifier {
  final CustomCitiesUseCase _customCitiesUseCase = CustomCitiesUseCase(CustomCitiesDataRepository(),);

  Future<List<CustomCityEntity>> getAllCustomCities() async {
    final List<CustomCityEntity> allCustomCities = await _customCitiesUseCase.fetchAllCustomCities();
    return allCustomCities;
  }

  Future<int> addCustomCity({required CustomCityEntity model}) async {
    final int addCity = await _customCitiesUseCase.fetchAddCity(model: model);
    notifyListeners();
    return addCity;
  }

  Future<int> changeCustomCity({required CustomCityEntity model}) async {
    final int changeCity = await _customCitiesUseCase.fetchChangeCity(model: model);
    notifyListeners();
    return changeCity;
  }

  Future<int> deleteCustomCity({required int customCityId}) async {
    final int deleteCustomCity = await _customCitiesUseCase.fetchDeleteCity(cityId: customCityId);
    notifyListeners();
    return deleteCustomCity;
  }
}
