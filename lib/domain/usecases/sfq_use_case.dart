import '../entities/sfq_entity.dart';
import '../repository/sfq_repository.dart';

class SFQUseCase {

  SFQUseCase(this._sfqRepository);

  final SFQRepository _sfqRepository;

  Future<List<SFQEntity>> fetchAllSupplications({required String tableName}) async {
    try {
      final List<SFQEntity> allSupplications = await _sfqRepository.getAllSupplications(tableName: tableName);
      return allSupplications;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}