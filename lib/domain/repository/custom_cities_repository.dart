
import '../entities/custom_city_entity.dart';

abstract class CustomCitiesRepository {
  Future<List<CustomCityEntity>> getAllCustomCities();

  Future<int> addCity({required CustomCityEntity model});

  Future<int> changeCity({required CustomCityEntity model});

  Future<int> deleteCity({required int cityId});
}