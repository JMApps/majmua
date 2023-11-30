import 'package:majmua/domain/entities/city_entity.dart';
import 'package:majmua/domain/repository/cities_repository.dart';

class CitiesUseCase {

  CitiesUseCase(this._citiesRepository);

  final CitiesRepository _citiesRepository;

  Future<List<CityEntity>> fetchAllCities() async {
    try {
      final List<CityEntity> allCities = await _citiesRepository.getAllCities();
      return allCities;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}