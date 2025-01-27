import 'package:sqflite/sqflite.dart';

import '../../core/strings/db_value_strings.dart';
import '../../domain/entities/city_entity.dart';
import '../../domain/repositories/city_repository.dart';
import '../models/city_model.dart';
import '../services/city_database_service.dart';

class CityDataRepository implements CityRepository {
  final CityDatabaseService _cityDatabaseService;

  CityDataRepository(this._cityDatabaseService);

  @override
  Future<List<CityEntity>> getAllCities() async {
    final Database database = await _cityDatabaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValueStrings.dbTableOfCities);
    final List<CityEntity> allCities = resources.isNotEmpty ? resources.map((c) => CityEntity.fromModel(CityModel.fromMap(c))).toList() : [];
    return allCities;
  }

  @override
  Future<int> createCity({required Map<String, dynamic> mapCity}) {
    // TODO: implement addCity
    print('call city data repository');
    throw UnimplementedError();
  }

  @override
  Future<int> updateCity({required Map<String, dynamic> mapCity, required int idCity}) {
    // TODO: implement changeCity
    throw UnimplementedError();
  }

  @override
  Future<int> deleteCity({required int idCity}) {
    // TODO: implement deleteCity
    throw UnimplementedError();
  }
}