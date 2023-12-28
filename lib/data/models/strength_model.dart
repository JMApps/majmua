class StrengthModel {
  final int id;
  final String paragraph;
  final String chapterTitle;
  final String chapterContent;

  const StrengthModel({
    required this.id,
    required this.paragraph,
    required this.chapterTitle,
    required this.chapterContent,
  });

  factory StrengthModel.fromMap(Map<String, dynamic> map) {
    return StrengthModel(
      id: map['id'] as int,
      paragraph: map['paragraph'] as String,
      chapterTitle: map['chapter_title'] as String,
      chapterContent: map['chapter_content'] as String,
    );
  }
}
