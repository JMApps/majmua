class ChapterFortressModel {
  final int id;
  final String chapterNumber;
  final String chapterTitle;

  const ChapterFortressModel({
    required this.id,
    required this.chapterNumber,
    required this.chapterTitle,
  });

  factory ChapterFortressModel.fromMap(Map<String, dynamic> map) {
    return ChapterFortressModel(
      id: map['id'] as int,
      chapterNumber: map['chapter_number'] as String,
      chapterTitle: map['chapter_title'] as String,
    );
  }
}
