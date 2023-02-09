import 'package:majmua/data/database/models/supplications_model.dart';
import 'package:majmua/data/database/services/supplications_database_helper.dart';

class SupplicationsQuery {

  static final SupplicationsQuery _instance = SupplicationsQuery.internal();
  factory SupplicationsQuery() => _instance;
  SupplicationsQuery.internal();

  final SupplicationsDatabaseHelper _supplicationsDatabaseHelper = SupplicationsDatabaseHelper();

  Future<List<SupplicationsModel>> getSupplicationsWhere(int groupBy) async {
    var dbClient = await _supplicationsDatabaseHelper.db;
    var res = await dbClient.query('Table_of_supplications', where: 'group_by == $groupBy');
    List<SupplicationsModel>? supplicationsWhere = res.isNotEmpty ? res.map((c) => SupplicationsModel.fromMap(c)).toList() : null;
    return supplicationsWhere!;
  }
}
