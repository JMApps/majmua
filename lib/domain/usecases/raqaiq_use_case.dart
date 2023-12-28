import 'package:majmua/domain/entities/raqaiq_entity.dart';
import 'package:majmua/domain/repository/raqaiq_repository.dart';

class RaqaiqUseCase {
  RaqaiqUseCase(this._raqaiqRepository);

  final RaqaiqRepository _raqaiqRepository;

  Future<List<RaqaiqEntity>> fetchAllChapters() async {
    try {
      final List<RaqaiqEntity> allChapters = await _raqaiqRepository.getAllChapters();
      return allChapters;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}