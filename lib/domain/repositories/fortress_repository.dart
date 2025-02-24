import '../entities/fortress_entity.dart';

abstract class FortressRepository {
  Future<List<FortressEntity>> getAllSupplications({required String tableName});

  Future<List<FortressEntity>> getSupplicationsByChapterId({required String tableName, required int chapterId});

  Future<FortressEntity> getSupplicationById({required String tableName, required int supplicationId});

  Future<List<FortressEntity>> getFavoriteSupplications({required String tableName, required List<int> ids});
}