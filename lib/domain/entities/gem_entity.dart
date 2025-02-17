import '../../data/models/gem_model.dart';

class GemEntity {
  final int id;
  final String citation;

  const GemEntity({
    required this.id,
    required this.citation,
  });

  factory GemEntity.fromModel(GemModel model) {
    return GemEntity(
      id: model.id,
      citation: model.citation,
    );
  }
}
