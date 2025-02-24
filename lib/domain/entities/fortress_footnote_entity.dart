import '../../data/models/fortress_footnote_model.dart';

class FortressFootnoteEntity {
  final int footnoteId;
  final String footnote;

  const FortressFootnoteEntity({
    required this.footnoteId,
    required this.footnote,
  });

  factory FortressFootnoteEntity.fromModel(FortressFootnoteModel model) {
    return FortressFootnoteEntity(
      footnoteId: model.footnoteId,
      footnote: model.footnote,
    );
  }
}
