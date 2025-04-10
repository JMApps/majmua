import '../../core/strings/db_value_strings.dart';

class QuestionFootnoteModel {
  final int id;
  final String footnoteContent;

  const QuestionFootnoteModel({
    required this.id,
    required this.footnoteContent,
  });

  factory QuestionFootnoteModel.fromMap(Map<String, Object?> map) {
    return QuestionFootnoteModel(
      id: map[DBValueStrings.id] as int,
      footnoteContent: map[DBValueStrings.dbFootnoteContent] as String,
    );
  }
}
