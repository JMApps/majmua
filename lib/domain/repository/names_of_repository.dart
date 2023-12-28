import 'package:majmua/domain/entities/ayah_entity.dart';
import 'package:majmua/domain/entities/clarification_entity.dart';
import 'package:majmua/domain/entities/name_entity.dart';

abstract class NamesOfRepository {
  Future<List<NameEntity>> getAllNames();

  Future<List<NameEntity>> getNamesByChapterId({required int chapterId});

  Future<List<AyahEntity>> getAyahsByChapterId({required int chapterId});

  Future<ClarificationEntity> getClarificationById({required int chapterId});
}