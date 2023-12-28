import 'package:majmua/domain/entities/raqaiq_entity.dart';

abstract class RaqaiqRepository {
  Future<List<RaqaiqEntity>> getAllChapters();
}