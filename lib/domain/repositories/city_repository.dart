
import '../entities/city_entity.dart';

abstract class CityRepository {
  Future<List<CityEntity>> getAllCities();

  Future<int> createCity({required Map<String, dynamic> mapCity});

  Future<int> updateCity({required Map<String, dynamic> mapCity, required int idCity});

  Future<int> deleteCity({required int idCity});
}