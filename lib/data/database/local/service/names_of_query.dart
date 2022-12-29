import 'package:majmua/data/database/local/model/names_ayahs_of_model.dart';
import 'package:majmua/data/database/local/model/names_content_of_model.dart';
import 'package:majmua/data/database/local/model/names_of_model.dart';
import 'package:majmua/data/database/local/service/names_of_database_helper.dart';

class SFQQuery {
  final NamesOfDatabaseHelper _namesOfDatabaseHelper = NamesOfDatabaseHelper();

  Future<List<NamesOfModel>> getAllNames() async {
    var dbClient = await _namesOfDatabaseHelper.db;
    var res = await dbClient.query('Table_of_names');
    List<NamesOfModel>? allNames = res.isNotEmpty ? res.map((c) => NamesOfModel.fromMap(c)).toList() : null;
    return allNames!;
  }

  Future<List<NamesOfModel>> getContentNames(int sampleBy) async {
    var dbClient = await _namesOfDatabaseHelper.db;
    var res = await dbClient.query('Table_of_names', where: 'id == $sampleBy');
    List<NamesOfModel>? contentNames = res.isNotEmpty ? res.map((c) => NamesOfModel.fromMap(c)).toList() : null;
    return contentNames!;
  }

  Future<List<NamesAyahsOfModel>> getContentAyahs(int sampleBy) async {
    var dbClient = await _namesOfDatabaseHelper.db;
    var res = await dbClient.query('Table_of_ayahs', where: 'id == $sampleBy');
    List<NamesAyahsOfModel>? contentAyahs = res.isNotEmpty ? res.map((c) => NamesAyahsOfModel.fromMap(c)).toList() : null;
    return contentAyahs!;
  }

  Future<List<NamesContentOfModel>> getContents(int chapterNumber) async {
    var dbClient = await _namesOfDatabaseHelper.db;
    var res = await dbClient.query('Table_of_contents', where: 'id == $chapterNumber');
    List<NamesContentOfModel>? contents = res.isNotEmpty ? res.map((c) => NamesContentOfModel.fromMap(c)).toList() : null;
    return contents!;
  }
}
