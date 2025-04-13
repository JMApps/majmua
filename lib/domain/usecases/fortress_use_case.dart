import '../entities/fortress_entity.dart';
import '../repositories/fortress_repository.dart';

class FortressUseCase {
  final FortressRepository _fortressRepository;

  const FortressUseCase(this._fortressRepository);

  Future<List<FortressEntity>> fetchAllSupplications({required String tableName}) async {
    try {
      return await _fortressRepository.getAllSupplications(tableName: tableName);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<FortressEntity>> fetchSupplicationsByChapterId({required String tableName, required int chapterId}) async {
    try {
      return await _fortressRepository.getSupplicationsByChapterId(tableName: tableName, chapterId: chapterId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<FortressEntity> fetchSupplicationById({required String tableName, required int supplicationId}) async {
    try {
      return await _fortressRepository.getSupplicationById(tableName: tableName, supplicationId: supplicationId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<FortressEntity>> fetchFavoriteSupplications({required String tableName, required List<int> ids}) async {
    try {
      return await _fortressRepository.getFavoriteSupplications(tableName: tableName, ids: ids);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}