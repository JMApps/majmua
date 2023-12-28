import 'package:majmua/data/models/raqaiq_model.dart';
import 'package:majmua/data/services/raqaiq_database_service.dart';
import 'package:majmua/domain/entities/raqaiq_entity.dart';
import 'package:majmua/domain/repository/raqaiq_repository.dart';
import 'package:sqflite/sqflite.dart';

class RaqaiqDataRepository implements RaqaiqRepository {
  final RaqaiqDatabaseService _databaseService = RaqaiqDatabaseService();

  @override
  Future<List<RaqaiqEntity>> getAllChapters() async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query('Table_of_raqaiq_content');
    final List<RaqaiqEntity> allChapters = resources.isNotEmpty ? resources.map((c) => _mapToEntity(RaqaiqModel.fromMap(c))).toList() : [];
    return allChapters;
  }

  // Mapping to entity
  RaqaiqEntity _mapToEntity(RaqaiqModel model) {
    return RaqaiqEntity(
      id: model.id,
      chapterTitle: model.chapterTitle,
      chapterContent: model.chapterContent,
    );
  }
}
