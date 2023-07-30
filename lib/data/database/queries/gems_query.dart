import 'package:majmua/data/database/models/gems_model.dart';
import 'package:majmua/data/database/services/gems_helper.dart';

class GemsQuery {
  final GemsDatabaseHelper _gemsDatabaseHelper = GemsDatabaseHelper();

  Future<List<GemsModel>> getGems() async {
    var dbClient = await _gemsDatabaseHelper.db;
    var res = await dbClient.query('Table_of_content');
    List<GemsModel>? gems = res.isNotEmpty ? res.map((c) => GemsModel.fromMap(c)).toList() : null;
    return gems!;
  }
}
