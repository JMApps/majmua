import '../entities/supplication_entity.dart';
import '../repositories/supplication_repository.dart';

class SupplicationUseCase {
  final SupplicationRepository _supplicationRepository;

  SupplicationUseCase(this._supplicationRepository);

  Future<List<SupplicationEntity>> getAllSupplications({required String tableName}) async {
    try {
      return await _supplicationRepository.getAllSupplications(tableName: tableName);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
