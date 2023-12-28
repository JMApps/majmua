class QuestionFootnoteModel {
  final int id;
  final String footnoteContent;

  const QuestionFootnoteModel({
    required this.id,
    required this.footnoteContent,
  });

  factory QuestionFootnoteModel.fromMap(Map<String, dynamic> map) {
    return QuestionFootnoteModel(
      id: map['id'] as int,
      footnoteContent: map['footnote_content'] as String,
    );
  }
}
