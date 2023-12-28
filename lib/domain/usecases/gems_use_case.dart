

import '../entities/gem_entity.dart';
import '../repository/gems_repository.dart';

class GemsUseCase {
  GemsUseCase(this._gemsRepository);

  final GemsRepository _gemsRepository;

  Future<List<GemEntity>> fetchAllGems() async {
    try {
      final List<GemEntity> allGems = await _gemsRepository.getAllGems();
      return allGems;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}