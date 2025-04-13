import '../entities/raqaiq_entity.dart';

abstract class RaqaiqRepository {
  Future<List<RaqaiqEntity>> getAllRaqaiqs();

  Future<RaqaiqEntity> getRaqaiqById({required int raqaiqId});
}
