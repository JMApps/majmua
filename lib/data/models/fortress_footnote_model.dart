import '../../core/strings/db_value_strings.dart';

class FortressFootnoteModel {
  final int footnoteId;
  final String footnote;

  const FortressFootnoteModel({
    required this.footnoteId,
    required this.footnote,
  });

  factory FortressFootnoteModel.fromMap(Map<String, Object?> map) {
    return FortressFootnoteModel(
      footnoteId: map[DBValueStrings.dbFortressFootnoteId] as int,
      footnote: map[DBValueStrings.dbFortressFootnote] as String,
    );
  }
}
