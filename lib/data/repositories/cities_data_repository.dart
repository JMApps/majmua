import 'package:sqflite/sqflite.dart';

import '../../domain/entities/city_entity.dart';
import '../../domain/repository/cities_repository.dart';
import '../models/city_model.dart';
import '../services/local/cities_database_service.dart';

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
