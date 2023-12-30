import 'package:sqflite/sqflite.dart';

import '../../domain/entities/strength_entity.dart';
import '../../domain/entities/strength_footnote_entity.dart';
import '../../domain/repository/strength_repository.dart';
import '../models/strength_footnote_model.dart';
import '../models/strength_model.dart';
import '../services/local/strength_database_service.dart';

class StrengthDataRepository implements StrengthRepository {
  final StrengthDatabaseService _databaseService = StrengthDatabaseService();

  @override
  Future<List<StrengthEntity>> getAllChapters() async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query('Table_of_chapters');
    final List<StrengthEntity> allChapters = resources.isNotEmpty ? resources.map((c) => _chapterToEntity(StrengthModel.fromMap(c))).toList() : [];
    return allChapters;
  }

  @override
  Future<StrengthFootnoteEntity> getFootnoteById({required int footnoteId}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query('Table_of_footnotes', where: 'id = ?', whereArgs: [footnoteId]);
    final StrengthFootnoteEntity? footnoteById = resources.isNotEmpty ? _footnoteToEntity(StrengthFootnoteModel.fromMap(resources.first)) : null;
    return footnoteById!;
  }

  // Mapping to entity
  StrengthEntity _chapterToEntity(StrengthModel model) {
    return StrengthEntity(
      id: model.id,
      paragraph: model.paragraph,
      chapterTitle: model.chapterTitle,
      chapterContent: model.chapterContent,
    );
  }

  // Mapping to entity
  StrengthFootnoteEntity _footnoteToEntity(StrengthFootnoteModel model) {
    return StrengthFootnoteEntity(
      id: model.id,
      footnote: model.footnote,
    );
  }
}
