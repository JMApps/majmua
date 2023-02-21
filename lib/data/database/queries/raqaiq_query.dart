import 'package:majmua/data/database/models/raqaiq_model.dart';
import 'package:majmua/data/database/services/raqaiq_database_helper.dart';

class RaqaiqQuery {
  final RaqaiqDatabaseHelper _raqaiqDatabaseHelper = RaqaiqDatabaseHelper();

  Future<List<RaqaiqModel>> getAllChapters() async {
    var dbClient = await _raqaiqDatabaseHelper.db;
    var res = await dbClient.query('Table_of_raqaiq_content');
    List<RaqaiqModel>? allChapters = res.isNotEmpty ? res.map((c) => RaqaiqModel.fromMap(c)).toList() : null;
    return allChapters!;
  }

  Future<List<RaqaiqModel>> getOneChapter(int chapterId) async {
    var dbClient = await _raqaiqDatabaseHelper.db;
    var res = await dbClient.query('Table_of_raqaiq_content', where: 'id == $chapterId');
    List<RaqaiqModel>? oneChapter = res.isNotEmpty ? res.map((c) => RaqaiqModel.fromMap(c)).toList() : null;
    return oneChapter!;
  }
}
