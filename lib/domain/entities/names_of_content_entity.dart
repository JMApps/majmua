
import '../../data/models/names_of_content_model.dart';

class NamesOfContentEntity {
  final String clarificationTitle;
  final String clarificationContent;

  const NamesOfContentEntity({
    required this.clarificationTitle,
    required this.clarificationContent,
  });

  factory NamesOfContentEntity.fromModel(NamesOfContentModel model) {
    return NamesOfContentEntity(
      clarificationTitle: model.clarificationTitle,
      clarificationContent: model.clarificationContent,
    );
  }
}
