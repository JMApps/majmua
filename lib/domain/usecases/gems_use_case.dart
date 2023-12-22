import 'package:majmua/domain/entities/gem_entity.dart';
import 'package:majmua/domain/repository/gems_repository.dart';

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