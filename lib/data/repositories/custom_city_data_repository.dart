import 'package:sqflite/sqflite.dart';

import '../../core/strings/db_value_strings.dart';
import '../../domain/entities/city_entity.dart';
import '../../domain/repositories/city_repository.dart';
import '../models/city_model.dart';
import '../services/databases/custom_city_database_service.dart';

class CustomCityDataRepository implements CityRepository {
  final CustomCityDatabaseService _customCityDatabaseService;

  const CustomCityDataRepository(this._customCityDatabaseService);

  @override
  Future<List<CityEntity>> getAllCities() async {
    final Database database = await _customCityDatabaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValueStrings.dbTableOfCities, orderBy: '${DBValueStrings.id} DESC');
    return resources.isNotEmpty ? resources.map((c) => CityEntity.fromModel(CityModel.fromMap(c))).toList() : [];
  }

  @override
  Future<int> createCity({required Map<String, dynamic> mapCity}) async {
    final Database database = await _customCityDatabaseService.db;
    return await database.insert(DBValueStrings.dbTableOfCities, mapCity);
  }

  @override
  Future<int> updateCity({required Map<String, dynamic> mapCity, required int idCity}) async {
    final Database database = await _customCityDatabaseService.db;
    return await database.update(DBValueStrings.dbTableOfCities, mapCity, where: '${DBValueStrings.id} = ?', whereArgs: [idCity]);
  }

  @override
  Future<int> deleteCity({required int idCity}) async {
    final Database database = await _customCityDatabaseService.db;
    return await database.delete(DBValueStrings.dbTableOfCities, where: '${DBValueStrings.id} = ?', whereArgs: [idCity]);
  }
}