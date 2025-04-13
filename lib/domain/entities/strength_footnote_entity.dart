import '../../data/models/strength_footnote_model.dart';

class StrengthFootnoteEntity {
  final int footnoteId;
  final String footnote;

  const StrengthFootnoteEntity({
    required this.footnoteId,
    required this.footnote,
  });

  factory StrengthFootnoteEntity.fromModel(StrengthFootnoteModel model) {
    return StrengthFootnoteEntity(
      footnoteId: model.footnoteId,
      footnote: model.footnote,
    );
  }
}
