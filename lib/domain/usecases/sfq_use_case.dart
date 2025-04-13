import '../entities/sfq_entity.dart';
import '../repositories/sfq_repository.dart';

class SFQUseCase {
  final SFQRepository _sfqRepository;

  const SFQUseCase(this._sfqRepository);

  Future<List<SFQEntity>> getAllSupplications({required String tableName}) async {
    try {
      return await _sfqRepository.getAllSupplications(tableName: tableName);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
