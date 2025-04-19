
import '../../data/models/names_of_content_model.dart';

class NamesOfContentEntity {
  final int id;
  final String clarificationTitle;
  final String clarificationContent;

  const NamesOfContentEntity({
    required this.id,
    required this.clarificationTitle,
    required this.clarificationContent,
  });

  factory NamesOfContentEntity.fromModel(NamesOfContentModel model) {
    return NamesOfContentEntity(
      id: model.id,
      clarificationTitle: model.clarificationTitle,
      clarificationContent: model.clarificationContent,
    );
  }
}
