class RaqaiqModel {
  final int id;
  final String chapterTitle;
  final String chapterContent;

  RaqaiqModel.fromMap(dynamic object)
      : id = object['id'],
        chapterTitle = object['chapter_title'],
        chapterContent = object['chapter_content'];
}
