import 'package:majmua/domain/entities/hadeeth_entity.dart';
import 'package:majmua/domain/repository/hadeeths_repository.dart';

class HadeethsUseCase {

  HadeethsUseCase(this._hadeethsRepository);

  final HadeethsRepository _hadeethsRepository;

  Future<List<HadeethEntity>> fetchAllHadeeths() async {
    try {
      final List<HadeethEntity> allHadeeths = await _hadeethsRepository.getAllHadeeths();
      return allHadeeths;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}