import 'package:majmua/data/database/local/model/country_model.dart';
import 'package:majmua/data/database/local/service/custom_counties_database_helper.dart';
import 'package:majmua/data/database/local/service/default_countries_database_helper.dart';
import 'package:sqflite/sqflite.dart' as sql;

class CoordinatesQuery {

  static final CoordinatesQuery _instance = CoordinatesQuery.internal();
  factory CoordinatesQuery() => _instance;
  CoordinatesQuery.internal();

  final DefaultCountriesDatabaseHelper _defaultCountriesDatabaseHelper = DefaultCountriesDatabaseHelper();
  final CustomCountriesDatabaseHelper _customCountriesDatabaseHelper = CustomCountriesDatabaseHelper();

  Future<List<CountryModel>> getAllCountries() async {
    var dbClient = await _defaultCountriesDatabaseHelper.db;
    var res = await dbClient.query('Table_of_country_coordinates');
    List<CountryModel>? allCountries = res.isNotEmpty ? res.map((c) => CountryModel.fromMap(c)).toList() : null;
    return allCountries!;
  }

  getCounty(int idCountry) async {
    var dbClient = await _defaultCountriesDatabaseHelper.db;
    var res = await dbClient.query('Table_of_country_coordinates', where: 'id == $idCountry');
    List<CountryModel>? oneCountry = res.isNotEmpty ? res.map((c) => CountryModel.fromMap(c)).toList() : null;
    return oneCountry!;
  }

  Future<int> createCounty({
    required String country,
    required String city,
    required double latitude,
    required double longitude,
    required int calculationIndex,
  }) async {
    var dbClient = await _customCountriesDatabaseHelper.db;
    final Map<String, dynamic> newCounty = {
      'country': country,
      'city': city,
      'latitude': latitude,
      'longitude': longitude,
      'calculationIndex': calculationIndex,
    };
    return await dbClient.insert(
      'Table_of_county_coordinates',
      newCounty,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  Future<int> updateCounty({
    required int idCounty,
    required String country,
    required String city,
    required double latitude,
    required double longitude,
    required int calculationIndex,
  }) async {
    var dbClient = await _customCountriesDatabaseHelper.db;
    final Map<String, dynamic> updateCounty = {
      'country': country,
      'city': city,
      'latitude': latitude,
      'longitude': longitude,
      'calculationIndex': calculationIndex,
    };
    return await dbClient.update(
      'Table_of_county_coordinates',
      updateCounty,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
      where: 'id == $idCounty',
    );
  }

  Future<int> deleteCounty(int idCounty) async {
    var dbClient = await _customCountriesDatabaseHelper.db;
    var res = await dbClient.delete(
      'Table_of_county_coordinates',
      where: 'id == $idCounty',
    );
    return res;
  }
}
