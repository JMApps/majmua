import 'package:majmua/data/database/local/model/supplication_model.dart';
import 'package:majmua/data/database/local/service/supplications_database_helper.dart';

class SupplicationsQuery {
  static final SupplicationsQuery _instance = SupplicationsQuery.internal();

  factory SupplicationsQuery() => _instance;

  SupplicationsQuery.internal();

  final SupplicationsDatabaseHelper _supplicationsDatabaseHelper =
      SupplicationsDatabaseHelper();

  Future<List<SupplicationModel>> getAllMorningSupplications() async {
    var dbClient = await _supplicationsDatabaseHelper.db;
    var res = await dbClient.query('Table_of_morning_supplications');
    List<SupplicationModel>? morningSupplications = res.isNotEmpty ? res.map((c) => SupplicationModel.fromMap(c)).toList() : null;
    return morningSupplications!;
  }

  Future<List<SupplicationModel>> getAllEveningSupplications() async {
    var dbClient = await _supplicationsDatabaseHelper.db;
    var res = await dbClient.query('Table_of_evening_supplications');
    List<SupplicationModel>? morningSupplications = res.isNotEmpty ? res.map((c) => SupplicationModel.fromMap(c)).toList() : null;
    return morningSupplications!;
  }

  Future<List<SupplicationModel>> getAllNightSupplications() async {
    var dbClient = await _supplicationsDatabaseHelper.db;
    var res = await dbClient.query('Table_of_night_supplications');
    List<SupplicationModel>? morningSupplications = res.isNotEmpty ? res.map((c) => SupplicationModel.fromMap(c)).toList() : null;
    return morningSupplications!;
  }
}
