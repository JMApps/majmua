import 'package:majmua/domain/entities/hadeeth_entity.dart';

abstract class HadeethsRepository {
  Future<List<HadeethEntity>> getAllHadeeths();
}