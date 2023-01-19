import 'package:majmua/data/database/models/custom_country_model.dart';
import 'package:majmua/data/database/models/default_country_model.dart';
import 'package:majmua/data/database/services/custom_countries_database_helper.dart';
import 'package:majmua/data/database/services/default_countries_database_helper.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DefaultCustomCountryQuery {
  static final DefaultCustomCountryQuery _instance = DefaultCustomCountryQuery.internal();

  factory DefaultCustomCountryQuery() => _instance;

  DefaultCustomCountryQuery.internal();

  final DefaultCountriesDatabaseHelper _defaultCountriesDatabaseHelper = DefaultCountriesDatabaseHelper();
  final CustomCountriesDatabaseHelper _customCountriesDatabaseHelper = CustomCountriesDatabaseHelper();

  Future<List<DefaultCountryModel>> getAllDefaultCountries() async {
    var dbClient = await _defaultCountriesDatabaseHelper.db;
    var res = await dbClient.query('Table_of_country_coordinates');
    List<DefaultCountryModel>? allCountries = res.isNotEmpty ? res.map((c) => DefaultCountryModel.fromMap(c)).toList() : null;
    return allCountries!;
  }

  getCounty(int idCountry) async {
    var dbClient = await _defaultCountriesDatabaseHelper.db;
    var res = await dbClient.query('Table_of_country_coordinates', where: 'id == $idCountry');
    List<DefaultCountryModel>? oneCountry = res.isNotEmpty ? res.map((c) => DefaultCountryModel.fromMap(c)).toList() : null;
    return oneCountry!;
  }

  Future<List<CustomCountryModel>> getAllCustomCountries() async {
    var dbClient = await _customCountriesDatabaseHelper.db;
    var res = await dbClient.query('Table_of_country_coordinates');
    List<CustomCountryModel>? allCustomCountries = res.isNotEmpty ? res.map((c) => CustomCountryModel.fromMap(c)).toList() : null;
    return allCustomCountries!;
  }

  Future<int> createCounty({
    required String country,
    required String city,
    required String latitude,
    required String longitude,
  }) async {
    var dbClient = await _customCountriesDatabaseHelper.db;
    final Map<String, dynamic> newCounty = {
      'country': country,
      'city': city,
      'latitude': latitude,
      'longitude': longitude,
    };
    return await dbClient.insert(
      'Table_of_country_coordinates',
      newCounty,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  Future<int> updateCounty({
    required int idCountry,
    required String country,
    required String city,
    required String latitude,
    required String longitude,
  }) async {
    var dbClient = await _customCountriesDatabaseHelper.db;
    final Map<String, dynamic> updateCounty = {
      'country': country,
      'city': city,
      'latitude': latitude,
      'longitude': longitude,
    };
    return await dbClient.update(
      'Table_of_country_coordinates',
      updateCounty,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
      where: 'id == $idCountry',
    );
  }

  Future<int> deleteCounty(int idCounty) async {
    var dbClient = await _customCountriesDatabaseHelper.db;
    var res = await dbClient.delete(
      'Table_of_country_coordinates',
      where: 'id == $idCounty',
    );
    return res;
  }
}
