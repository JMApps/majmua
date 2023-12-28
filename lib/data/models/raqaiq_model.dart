class RaqaiqModel {
  final int id;
  final String chapterTitle;
  final String chapterContent;

  const RaqaiqModel({
    required this.id,
    required this.chapterTitle,
    required this.chapterContent,
  });

  factory RaqaiqModel.fromMap(Map<String, dynamic> map) {
    return RaqaiqModel(
      id: map['id'] as int,
      chapterTitle: map['chapter_title'] as String,
      chapterContent: map['chapter_content'] as String,
    );
  }
}
