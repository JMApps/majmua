import '../../core/strings/db_value_strings.dart';

class StrengthFootnoteModel {
  final int footnoteId;
  final String footnote;

  const StrengthFootnoteModel({
    required this.footnoteId,
    required this.footnote,
  });

  factory StrengthFootnoteModel.fromMap(Map<String, Object?> map) {
    return StrengthFootnoteModel(
      footnoteId: map[DBValueStrings.id] as int,
      footnote: map[DBValueStrings.dbStrengthFootnote] as String,
    );
  }
}
