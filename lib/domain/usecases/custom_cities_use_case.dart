import 'package:majmua/domain/entities/custom_city_entity.dart';
import 'package:majmua/domain/repository/custom_cities_repository.dart';

class CustomCitiesUseCase {

  CustomCitiesUseCase(this._customCitiesRepository);

  final CustomCitiesRepository _customCitiesRepository;

  Future<List<CustomCityEntity>> fetchAllCustomCities() async {
    try {
      final List<CustomCityEntity> allCustomCities = await _customCitiesRepository.getAllCustomCities();
      return allCustomCities;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<int> fetchAddCity({required CustomCityEntity model}) async {
    try {
      final int addCity = await _customCitiesRepository.addCity(model: model);
      return addCity;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<int> fetchChangeCity({required CustomCityEntity model}) async {
    try {
      final int changeCity = await _customCitiesRepository.changeCity(model: model);
      return changeCity;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<int> fetchDeleteCity({required int cityId}) async {
    try {
      final int deleteCity = await _customCitiesRepository.deleteCity(cityId: cityId);
      return deleteCity;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}