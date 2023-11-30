import 'package:majmua/domain/entities/city_entity.dart';

abstract class CitiesRepository {
  Future<List<CityEntity>> getAllCities();
}