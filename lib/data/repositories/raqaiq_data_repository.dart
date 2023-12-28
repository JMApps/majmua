import 'package:sqflite/sqflite.dart';

import '../../domain/entities/raqaiq_entity.dart';
import '../../domain/repository/raqaiq_repository.dart';
import '../models/raqaiq_model.dart';
import '../services/local/raqaiq_database_service.dart';

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
