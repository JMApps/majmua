import '../entities/ayah_entity.dart';
import '../entities/clarification_entity.dart';
import '../entities/name_entity.dart';

abstract class NamesOfRepository {
  Future<List<NameEntity>> getAllNames();

  Future<List<NameEntity>> getNamesByChapterId({required int chapterId});

  Future<List<AyahEntity>> getAyahsByChapterId({required int chapterId});

  Future<ClarificationEntity> getClarificationById({required int chapterId});
}