import '../entities/raqaiq_entity.dart';
import '../repositories/raqaiq_repository.dart';

class RaqaiqUseCase {
  final RaqaiqRepository _raqaiqRepository;

  const RaqaiqUseCase(this._raqaiqRepository);

  Future<List<RaqaiqEntity>> fetchAllRaqaiqs() async {
    try {
      return await _raqaiqRepository.getAllRaqaiqs();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<RaqaiqEntity> fetchRaqaiqById({required int raqaiqId}) async {
    try {
      return await _raqaiqRepository.getRaqaiqById(raqaiqId: raqaiqId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}