import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqflite.dart' as sql;

import '../../domain/entities/custom_city_entity.dart';
import '../../domain/repository/custom_cities_repository.dart';
import '../models/custom_city_model.dart';
import '../services/local/custom_cities_database_service.dart';

class CustomCitiesDataRepository implements CustomCitiesRepository {
  final CustomCitiesDatabaseService _databaseService = CustomCitiesDatabaseService();
  final String _tableName = 'Table_of_country_coordinates';

  @override
  Future<List<CustomCityEntity>> getAllCustomCities() async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(_tableName, orderBy: 'id DESC');
    final List<CustomCityEntity> allCustomCities = resources.isNotEmpty ? resources.map((c) => _mapToEntity(CustomCityModel.fromMap(c))).toList() : [];
    return allCustomCities;
  }

  @override
  Future<int> addCity({required CustomCityEntity model}) async {
    final Database database = await _databaseService.db;
    CustomCityModel customCityModel = CustomCityModel(
      id: model.id,
      country: model.country,
      city: model.city,
      latitude: model.latitude,
      longitude: model.longitude,
    );
    final int addCity = await database.insert(_tableName, customCityModel.toMap(), conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return addCity;
  }

  @override
  Future<int> changeCity({required CustomCityEntity model}) async {
    final Database database = await _databaseService.db;
    CustomCityModel customCityModel = CustomCityModel(
      id: model.id,
      country: model.country,
      city: model.city,
      latitude: model.latitude,
      longitude: model.longitude,
    );
    final int changeCity = await database.update(_tableName, customCityModel.toMap(), where: 'id = ${model.id}', conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return changeCity;
  }

  @override
  Future<int> deleteCity({required int cityId}) async {
    final Database database = await _databaseService.db;
    final int deleteCity = await database.delete(_tableName, where: 'id = $cityId');
    return deleteCity;
  }

  // Mapping to entity
  CustomCityEntity _mapToEntity(CustomCityModel model) {
    return CustomCityEntity(
      id: model.id,
      country: model.country,
      city: model.city,
      latitude: model.latitude,
      longitude: model.longitude,
    );
  }
}
