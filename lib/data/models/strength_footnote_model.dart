class StrengthFootnoteModel {
  final int id;
  final String footnote;

  const StrengthFootnoteModel({
    required this.id,
    required this.footnote,
  });

  factory StrengthFootnoteModel.fromMap(Map<String, dynamic> map) {
    return StrengthFootnoteModel(
      id: map['id'] as int,
      footnote: map['footnote'] as String,
    );
  }
}
