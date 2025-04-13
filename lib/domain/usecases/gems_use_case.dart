import '../entities/gem_entity.dart';
import '../repositories/gems_repository.dart';

class GemsUseCase {
  const GemsUseCase(this._gemsRepository);

  final GemsRepository _gemsRepository;

  Future<List<GemEntity>> fetchAllGems() async {
    try {
      return await _gemsRepository.getAllGems();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}