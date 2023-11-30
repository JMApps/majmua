import 'package:majmua/data/models/city_model.dart';
import 'package:majmua/data/services/local/cities_database_service.dart';
import 'package:majmua/domain/entities/city_entity.dart';
import 'package:majmua/domain/repository/cities_repository.dart';
import 'package:sqflite/sqflite.dart';

class CitiesDataRepository implements CitiesRepository {
  final CitiesDatabaseService _databaseService = CitiesDatabaseService();

  @override
  Future<List<CityEntity>> getAllCities() async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query('Table_of_country_coordinates');
    final List<CityEntity> allCities = resources.isNotEmpty ? resources.map((c) => _mapToEntity(CityModel.fromMap(c))).toList() : [];
    return allCities;
  }

  // Mapping to entity
  CityEntity _mapToEntity(CityModel model) {
    return CityEntity(
      id: model.id,
      country: model.country,
      city: model.city,
      adminName: model.adminName,
      iso3: model.iso3,
      latitude: model.latitude,
      longitude: model.longitude,
    );
  }
}
