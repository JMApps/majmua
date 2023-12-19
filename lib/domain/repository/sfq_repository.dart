import 'package:majmua/domain/entities/sfq_entity.dart';

abstract class SFQRepository {
  Future<List<SFQEntity>> getAllSupplications({required String tableName});
}