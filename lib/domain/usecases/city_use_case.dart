import '../entities/city_entity.dart';
import '../repositories/city_repository.dart';

class CityUseCase {

  final CityRepository _cityRepository;

  const CityUseCase(this._cityRepository);

  Future<List<CityEntity>> fetchAllCities() async {
    try {
      return await _cityRepository.getAllCities();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<int> fetchCreateCity({required Map<String, dynamic> mapCity}) async {
    try {
      return await _cityRepository.createCity(mapCity: mapCity);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<int> fetchUpdateCity({required Map<String, dynamic> mapCity, required int idCity}) async {
    try {
      return await _cityRepository.updateCity(mapCity: mapCity, idCity: idCity);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<int> fetchDeleteCity({required int idCity}) async {
    try {
      return await _cityRepository.deleteCity(idCity: idCity);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}