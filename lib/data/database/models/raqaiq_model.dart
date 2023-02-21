class RaqaiqModel {
  late final int id;
  late final String chapterTitle;
  late final String chapterContent;

  RaqaiqModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    chapterTitle = map['chapter_title'];
    chapterContent = map['chapter_content'];
  }
}
