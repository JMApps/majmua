import '../entities/gem_entity.dart';

abstract class GemsRepository {
  Future<List<GemEntity>> getAllGems();
}